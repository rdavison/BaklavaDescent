/*
 * dump_obj_state.c - Dump specific object fields from a state log at given frames
 *
 * Usage: dump_obj_state <log.bin> <obj_index> <start_frame> <end_frame>
 *
 * Prints position, velocity, thrust, rotvel, orientation, segment, type, mode
 * for the given object at each frame in the range.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#define MAX_OBJECTS 350
#define MAX_PLAYERS 8

/* arm64 macOS struct sizes */
#define OBJECT_SIZE 268
#define AI_LOCAL_SIZE 200
#define PLAYER_SIZE 148

/* Read a 32-bit signed int from a byte offset in the object data */
static int32_t read_i32(const uint8_t *data, size_t offset) {
	int32_t v;
	memcpy(&v, data + offset, 4);
	return v;
}

static int16_t read_i16(const uint8_t *data, size_t offset) {
	int16_t v;
	memcpy(&v, data + offset, 2);
	return v;
}

static uint8_t read_u8(const uint8_t *data, size_t offset) {
	return data[offset];
}

int main(int argc, char **argv) {
	if (argc < 5) {
		fprintf(stderr, "Usage: %s <log.bin> <obj_index> <start_frame> <end_frame>\n", argv[0]);
		return 1;
	}

	const char *filename = argv[1];
	int obj_idx = atoi(argv[2]);
	int start_frame = atoi(argv[3]);
	int end_frame = atoi(argv[4]);

	FILE *f = fopen(filename, "rb");
	if (!f) { fprintf(stderr, "Cannot open %s\n", filename); return 1; }

	while (1) {
		uint32_t frame;
		int32_t n_objects;

		if (fread(&frame, 4, 1, f) != 1) break;
		if (fread(&n_objects, 4, 1, f) != 1) break;

		if (n_objects < 0 || n_objects > MAX_OBJECTS) {
			fprintf(stderr, "Bad n_objects %d at frame %u\n", n_objects, frame);
			break;
		}

		size_t obj_bytes = n_objects * OBJECT_SIZE;
		size_t ai_bytes = n_objects * AI_LOCAL_SIZE;
		size_t player_bytes = MAX_PLAYERS * PLAYER_SIZE;
		size_t globals_bytes = 5 * 4;

		uint8_t *obj_data = malloc(obj_bytes);
		uint8_t *ai_data = malloc(ai_bytes);
		uint8_t *player_data = malloc(player_bytes);
		int32_t globals[5];

		if (fread(obj_data, 1, obj_bytes, f) != obj_bytes) { free(obj_data); free(ai_data); free(player_data); break; }
		if (fread(ai_data, 1, ai_bytes, f) != ai_bytes) { free(obj_data); free(ai_data); free(player_data); break; }
		if (fread(player_data, 1, player_bytes, f) != player_bytes) { free(obj_data); free(ai_data); free(player_data); break; }
		if (fread(globals, 1, globals_bytes, f) != globals_bytes) { free(obj_data); free(ai_data); free(player_data); break; }

		if ((int)frame >= start_frame && (int)frame <= end_frame && obj_idx < n_objects) {
			const uint8_t *obj = obj_data + obj_idx * OBJECT_SIZE;
			const uint8_t *ai = ai_data + obj_idx * AI_LOCAL_SIZE;

			printf("=== Frame %u, Object %d ===\n", frame, obj_idx);
			printf("  type=%d id=%d control=%d movement=%d render=%d flags=0x%02X\n",
				read_u8(obj, 4), read_u8(obj, 5), read_u8(obj, 10), read_u8(obj, 11),
				read_u8(obj, 12), read_u8(obj, 13));
			printf("  segnum=%d\n", read_i16(obj, 14));
			printf("  pos=(%d, %d, %d)\n",
				read_i32(obj, 20), read_i32(obj, 24), read_i32(obj, 28));
			printf("  last_pos=(%d, %d, %d)\n",
				read_i32(obj, 76), read_i32(obj, 80), read_i32(obj, 84));
			printf("  orient.fvec=(%d, %d, %d)\n",
				read_i32(obj, 56), read_i32(obj, 60), read_i32(obj, 64));
			printf("  size=%d shields=%d\n", read_i32(obj, 68), read_i32(obj, 72));
			printf("  velocity=(%d, %d, %d)\n",
				read_i32(obj, 96), read_i32(obj, 100), read_i32(obj, 104));
			printf("  thrust=(%d, %d, %d)\n",
				read_i32(obj, 108), read_i32(obj, 112), read_i32(obj, 116));
			printf("  rotvel=(%d, %d, %d)\n",
				read_i32(obj, 132), read_i32(obj, 136), read_i32(obj, 140));
			printf("  rotthrust=(%d, %d, %d)\n",
				read_i32(obj, 144), read_i32(obj, 148), read_i32(obj, 152));
			printf("  mass=%d drag=%d phys_flags=0x%04X\n",
				read_i32(obj, 120), read_i32(obj, 124), (int)read_i16(obj, 158));
			/* ai_info (ctype) starts at offset 160 */
			printf("  ai: CURRENT_STATE=%d GOAL_STATE=%d behavior=0x%02X\n",
				read_u8(obj, 162), read_u8(obj, 163),
				read_u8(obj, 160 + 8)); /* behavior is at offset 8 in ai_static */
			printf("  ai: hide_segment=%d cur_path_index=%d path_length=%d\n",
				read_i16(obj, 160 + 10), read_i16(obj, 160 + 14), read_i16(obj, 160 + 16));
			/* ai_local */
			printf("  ailp: player_awareness_type=%d mode=%d\n",
				read_i32(ai, 0), read_i32(ai, 12));
			printf("  ailp: next_action_time=%d player_awareness_time=%d\n",
				read_i32(ai, 28), read_i32(ai, 40));
			printf("  ailp: time_since_processed=%d previous_visibility=%d\n",
				read_i32(ai, 56), read_i32(ai, 4));
			printf("  ailp: goal_segment=%d\n", read_i32(ai, 16));
			printf("\n");
		}

		free(obj_data);
		free(ai_data);
		free(player_data);
	}

	fclose(f);
	return 0;
}
