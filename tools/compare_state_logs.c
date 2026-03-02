/*
 * compare_state_logs.c - Offline comparison of two state log files
 *
 * Compares per-frame game state dumps produced by the input replayer
 * running through two different builds (e.g., C-only vs OCaml bridge).
 *
 * Usage: compare_state_logs <log_a.bin> <log_b.bin>
 *
 * State log format per frame:
 *   uint32_t frame_number
 *   int32_t  n_objects
 *   object   objects[n_objects]
 *   ai_local ai_local_info[n_objects]
 *   player   players[MAX_PLAYERS]
 *   int32_t  globals[5]  (Player_is_dead, Player_exploded, Overall_agitation,
 *                         Highest_object_index, rand_state)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

/* We don't include game headers here - we compare raw bytes.
 * Object and struct sizes are detected from the log files. */

#define MAX_OBJECTS 350
#define MAX_PLAYERS 8

static int verbose = 0;

typedef struct {
	uint32_t frame;
	int32_t  n_objects;
	int32_t  globals[5];
	/* Raw bytes for objects, ai_local, players follow */
	uint8_t  *object_data;      /* n_objects * object_size */
	uint8_t  *ai_local_data;    /* n_objects * ai_local_size */
	uint8_t  *player_data;      /* MAX_PLAYERS * player_size */
} frame_state;

/*
 * Read one frame from the state log.
 * Returns bytes of object/ai data read, or -1 on EOF/error.
 * Caller must free object_data, ai_local_data, player_data.
 */
static int read_frame(FILE *f, frame_state *state,
                      size_t object_size, size_t ai_local_size, size_t player_size)
{
	if (fread(&state->frame, sizeof(uint32_t), 1, f) != 1)
		return -1;

	if (fread(&state->n_objects, sizeof(int32_t), 1, f) != 1)
		return -1;

	if (state->n_objects < 0 || state->n_objects > MAX_OBJECTS) {
		fprintf(stderr, "ERROR: invalid n_objects %d at frame %u\n",
			state->n_objects, state->frame);
		return -1;
	}

	size_t obj_bytes = state->n_objects * object_size;
	size_t ai_bytes = state->n_objects * ai_local_size;
	size_t player_bytes = MAX_PLAYERS * player_size;

	state->object_data = NULL;
	state->ai_local_data = NULL;
	state->player_data = NULL;

	if (obj_bytes > 0) {
		state->object_data = (uint8_t *)malloc(obj_bytes);
		if (fread(state->object_data, 1, obj_bytes, f) != obj_bytes)
			return -1;
	}

	if (ai_bytes > 0) {
		state->ai_local_data = (uint8_t *)malloc(ai_bytes);
		if (fread(state->ai_local_data, 1, ai_bytes, f) != ai_bytes)
			return -1;
	}

	state->player_data = (uint8_t *)malloc(player_bytes);
	if (fread(state->player_data, 1, player_bytes, f) != player_bytes)
		return -1;

	if (fread(state->globals, sizeof(state->globals), 1, f) != 1)
		return -1;

	return 0;
}

static void free_frame(frame_state *state)
{
	free(state->object_data);
	free(state->ai_local_data);
	free(state->player_data);
	state->object_data = NULL;
	state->ai_local_data = NULL;
	state->player_data = NULL;
}

static int compare_bytes(const uint8_t *a, const uint8_t *b, size_t len,
                         const char *label, uint32_t frame, int index)
{
	int diffs = 0;
	for (size_t i = 0; i < len; i++) {
		if (a[i] != b[i]) {
			diffs++;
			if (verbose && diffs <= 10) {
				if (index >= 0)
					printf("  frame=%u %s[%d] byte %zu: A=0x%02X B=0x%02X\n",
						frame, label, index, i, a[i], b[i]);
				else
					printf("  frame=%u %s byte %zu: A=0x%02X B=0x%02X\n",
						frame, label, i, a[i], b[i]);
			}
		}
	}
	return diffs;
}

int main(int argc, char **argv)
{
	if (argc < 3) {
		fprintf(stderr, "Usage: %s [-v] <log_a.bin> <log_b.bin> [object_size] [ai_local_size] [player_size]\n", argv[0]);
		fprintf(stderr, "\nCompare two state log files frame-by-frame.\n");
		fprintf(stderr, "Optional size args default to common Descent 2 struct sizes.\n");
		fprintf(stderr, "Use -v for verbose byte-level diff output.\n");
		return 1;
	}

	int arg_offset = 1;
	if (strcmp(argv[1], "-v") == 0) {
		verbose = 1;
		arg_offset = 2;
	}

	const char *file_a = argv[arg_offset];
	const char *file_b = argv[arg_offset + 1];

	/* Default struct sizes for Descent 2 on arm64 macOS */
	size_t object_size = (argc > arg_offset + 2) ? (size_t)atoi(argv[arg_offset + 2]) : 268;
	size_t ai_local_size = (argc > arg_offset + 3) ? (size_t)atoi(argv[arg_offset + 3]) : 200;
	size_t player_size = (argc > arg_offset + 4) ? (size_t)atoi(argv[arg_offset + 4]) : 148;

	FILE *fa = fopen(file_a, "rb");
	FILE *fb = fopen(file_b, "rb");

	if (!fa) { fprintf(stderr, "ERROR: cannot open '%s'\n", file_a); return 1; }
	if (!fb) { fprintf(stderr, "ERROR: cannot open '%s'\n", file_b); fclose(fa); return 1; }

	printf("Comparing state logs:\n  A: %s\n  B: %s\n", file_a, file_b);
	printf("Struct sizes: object=%zu ai_local=%zu player=%zu\n",
		object_size, ai_local_size, player_size);

	int total_frames = 0;
	int divergent_frames = 0;
	int total_object_diffs = 0;
	int total_ai_diffs = 0;
	int total_player_diffs = 0;
	int total_global_diffs = 0;

	frame_state sa, sb;

	while (1) {
		int ra = read_frame(fa, &sa, object_size, ai_local_size, player_size);
		int rb = read_frame(fb, &sb, object_size, ai_local_size, player_size);

		if (ra == -1 && rb == -1)
			break;  /* Both done */

		if (ra == -1 || rb == -1) {
			printf("WARNING: logs have different lengths (A %s, B %s at frame ~%d)\n",
				ra == -1 ? "ended" : "continues",
				rb == -1 ? "ended" : "continues",
				total_frames);
			free_frame(&sa);
			free_frame(&sb);
			break;
		}

		total_frames++;
		int frame_diffs = 0;

		if (sa.frame != sb.frame) {
			printf("DIVERGE frame number: A=%u B=%u\n", sa.frame, sb.frame);
			frame_diffs++;
		}

		/* Compare n_objects */
		int n_compare = sa.n_objects < sb.n_objects ? sa.n_objects : sb.n_objects;

		if (sa.n_objects != sb.n_objects) {
			printf("DIVERGE frame=%u n_objects: A=%d B=%d\n",
				sa.frame, sa.n_objects, sb.n_objects);
			frame_diffs++;
		}

		/* Compare objects */
		for (int i = 0; i < n_compare; i++) {
			int d = compare_bytes(
				sa.object_data + i * object_size,
				sb.object_data + i * object_size,
				object_size, "object", sa.frame, i);
			if (d > 0) {
				total_object_diffs++;
				if (!verbose)
					printf("DIVERGE frame=%u object[%d]: %d byte differences\n",
						sa.frame, i, d);
				frame_diffs++;
			}
		}

		/* Compare AI local */
		for (int i = 0; i < n_compare; i++) {
			int d = compare_bytes(
				sa.ai_local_data + i * ai_local_size,
				sb.ai_local_data + i * ai_local_size,
				ai_local_size, "ai_local", sa.frame, i);
			if (d > 0) {
				total_ai_diffs++;
				if (!verbose)
					printf("DIVERGE frame=%u ai_local[%d]: %d byte differences\n",
						sa.frame, i, d);
				frame_diffs++;
			}
		}

		/* Compare players */
		for (int i = 0; i < MAX_PLAYERS; i++) {
			int d = compare_bytes(
				sa.player_data + i * player_size,
				sb.player_data + i * player_size,
				player_size, "player", sa.frame, i);
			if (d > 0) {
				total_player_diffs++;
				if (!verbose)
					printf("DIVERGE frame=%u player[%d]: %d byte differences\n",
						sa.frame, i, d);
				frame_diffs++;
			}
		}

		/* Compare globals */
		for (int i = 0; i < 5; i++) {
			if (sa.globals[i] != sb.globals[i]) {
				const char *names[] = {"Player_is_dead", "Player_exploded",
					"Overall_agitation", "Highest_object_index", "rand_state"};
				printf("DIVERGE frame=%u %s: A=%d B=%d\n",
					sa.frame, names[i], sa.globals[i], sb.globals[i]);
				total_global_diffs++;
				frame_diffs++;
			}
		}

		if (frame_diffs > 0)
			divergent_frames++;

		free_frame(&sa);
		free_frame(&sb);
	}

	fclose(fa);
	fclose(fb);

	printf("\n=== Summary ===\n");
	printf("Frames compared: %d\n", total_frames);
	printf("Divergent frames: %d\n", divergent_frames);
	printf("Object divergences: %d\n", total_object_diffs);
	printf("AI local divergences: %d\n", total_ai_diffs);
	printf("Player divergences: %d\n", total_player_diffs);
	printf("Global divergences: %d\n", total_global_diffs);

	if (divergent_frames == 0) {
		printf("\nPARITY CHECK PASSED - zero divergences\n");
		return 0;
	} else {
		printf("\nPARITY CHECK FAILED - %d divergent frames\n", divergent_frames);
		return 1;
	}
}
