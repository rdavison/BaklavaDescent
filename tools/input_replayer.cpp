/*
 * input_replayer.c - Replay recorded game inputs for deterministic comparison
 */

#ifdef OX_REPLAY

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef BUILD_DESCENT2
#include "main_d2/object.h"
#include "main_d2/ai.h"
#include "main_d2/aistruct.h"
#include "main_d2/player.h"
#include "main_d2/wall.h"
#include "main_d2/kconfig.h"
#include "main_d2/game.h"
#else
#include "main_d1/object.h"
#include "main_d1/ai.h"
#include "main_d1/aistruct.h"
#include "main_d1/player.h"
#include "main_d1/wall.h"
#include "main_d1/kconfig.h"
#include "main_d1/game.h"
#endif

#include "main_shared/game_shared.h"
#include "misc/rand.h"
#include "tools/input_replayer.h"

static FILE *replay_file = NULL;
static FILE *state_log = NULL;
static int replaying_active = 0;

static ox_replay_header replay_header;
static uint32_t frames_replayed = 0;

/* Initial state snapshot buffer (dynamically allocated based on snapshot_size) */
static uint8_t *initial_snapshot = NULL;
static uint32_t initial_snapshot_size = 0;

/* Read buffer for frame records */
#define REPLAY_BUFFER_SIZE 1024
static ox_frame_record replay_buffer[REPLAY_BUFFER_SIZE];
static int buffer_pos = 0;
static int buffer_count = 0;

static int refill_buffer(void)
{
	if (!replay_file)
		return 0;

	uint32_t remaining = replay_header.num_frames - frames_replayed;
	uint32_t to_read = remaining < REPLAY_BUFFER_SIZE ? remaining : REPLAY_BUFFER_SIZE;
	if (to_read == 0)
		return 0;

	buffer_count = (int)fread(replay_buffer, sizeof(ox_frame_record), to_read, replay_file);
	buffer_pos = 0;
	return buffer_count;
}

int ox_replayer_init(const char *replay_filename, const char *state_log_filename)
{
	replay_file = fopen(replay_filename, "rb");
	if (!replay_file) {
		fprintf(stderr, "OX_REPLAY: failed to open '%s' for replay\n", replay_filename);
		return -1;
	}

	/* Read and validate header */
	if (fread(&replay_header, sizeof(replay_header), 1, replay_file) != 1) {
		fprintf(stderr, "OX_REPLAY: failed to read header from '%s'\n", replay_filename);
		fclose(replay_file);
		replay_file = NULL;
		return -1;
	}

	if (replay_header.magic != OX_REPLAY_MAGIC) {
		fprintf(stderr, "OX_REPLAY: invalid magic in '%s' (expected 0x%X, got 0x%X)\n",
			replay_filename, OX_REPLAY_MAGIC, replay_header.magic);
		fclose(replay_file);
		replay_file = NULL;
		return -1;
	}

	if (replay_header.version != OX_REPLAY_VERSION) {
		fprintf(stderr, "OX_REPLAY: version mismatch in '%s' (expected %d, got %d)\n",
			replay_filename, OX_REPLAY_VERSION, replay_header.version);
		fclose(replay_file);
		replay_file = NULL;
		return -1;
	}

	/* Read initial state snapshot */
	initial_snapshot_size = replay_header.snapshot_size;
	if (initial_snapshot_size > 0) {
		initial_snapshot = (uint8_t *)malloc(initial_snapshot_size);
		if (!initial_snapshot) {
			fprintf(stderr, "OX_REPLAY: failed to allocate %u bytes for snapshot\n",
				initial_snapshot_size);
			fclose(replay_file);
			replay_file = NULL;
			return -1;
		}
		if (fread(initial_snapshot, 1, initial_snapshot_size, replay_file) != initial_snapshot_size) {
			fprintf(stderr, "OX_REPLAY: failed to read snapshot from '%s'\n", replay_filename);
			free(initial_snapshot);
			initial_snapshot = NULL;
			fclose(replay_file);
			replay_file = NULL;
			return -1;
		}
	}

	/* Open state log if requested */
	if (state_log_filename && state_log_filename[0]) {
		state_log = fopen(state_log_filename, "wb");
		if (!state_log) {
			fprintf(stderr, "OX_REPLAY: warning: failed to open state log '%s'\n",
				state_log_filename);
		}
	}

	replaying_active = 1;
	frames_replayed = 0;
	buffer_pos = 0;
	buffer_count = 0;

	fprintf(stderr, "OX_REPLAY: replaying '%s' (level %d, difficulty %d, %u frames)\n",
		replay_filename, replay_header.level_num,
		replay_header.difficulty_level, replay_header.num_frames);

	return 0;
}

int ox_replayer_get_level(void)
{
	return replay_header.level_num;
}

int ox_replayer_get_difficulty(void)
{
	return replay_header.difficulty_level;
}

void ox_replayer_restore_initial_state(void)
{
	if (!initial_snapshot || initial_snapshot_size == 0)
		return;

	const uint8_t *p = initial_snapshot;
	uint32_t remaining = initial_snapshot_size;

	int n_obj = replay_header.highest_object_index + 1;
	if (n_obj > MAX_OBJECTS) n_obj = MAX_OBJECTS;

	/* Restore Objects */
	uint32_t obj_size = n_obj * sizeof(object);
	if (remaining >= obj_size) {
		memcpy(Objects, p, obj_size);
		p += obj_size;
		remaining -= obj_size;
	}

	/* Restore Ai_local_info */
	uint32_t ai_size = n_obj * sizeof(ai_local);
	if (remaining >= ai_size) {
		memcpy(Ai_local_info, p, ai_size);
		p += ai_size;
		remaining -= ai_size;
	}

	/* Restore Players */
	uint32_t player_size = MAX_PLAYERS * sizeof(player);
	if (remaining >= player_size) {
		memcpy(Players, p, player_size);
		p += player_size;
		remaining -= player_size;
	}

	/* Restore Walls */
	if (remaining > 0) {
		uint32_t wall_count = remaining / sizeof(wall);
		if (wall_count > MAX_WALLS) wall_count = MAX_WALLS;
		memcpy(Walls, p, wall_count * sizeof(wall));
		Num_walls = wall_count;
	}

	Highest_object_index = replay_header.highest_object_index;
	P_Rand_set_state(replay_header.initial_rand_state);

	fprintf(stderr, "OX_REPLAY: initial state restored (%d objects)\n", n_obj);
}

int ox_replayer_apply_frame(void)
{
	if (!replaying_active)
		return -1;

	if (frames_replayed >= replay_header.num_frames)
		return -1;

	/* Refill buffer if needed */
	if (buffer_pos >= buffer_count) {
		if (refill_buffer() == 0)
			return -1;
	}

	const ox_frame_record *rec = &replay_buffer[buffer_pos];
	buffer_pos++;
	frames_replayed++;

	/* Override FrameTime */
	FrameTime = rec->frame_time;

	/* Override RNG state */
	P_Rand_set_state(rec->rand_state);

	/* Override Controls */
	Controls.pitch_time = rec->ctrl_pitch_time;
	Controls.vertical_thrust_time = rec->ctrl_vertical_thrust_time;
	Controls.heading_time = rec->ctrl_heading_time;
	Controls.sideways_thrust_time = rec->ctrl_sideways_thrust_time;
	Controls.bank_time = rec->ctrl_bank_time;
	Controls.forward_thrust_time = rec->ctrl_forward_thrust_time;
	Controls.rear_view_down_count = rec->ctrl_rear_view_down_count;
	Controls.rear_view_down_state = rec->ctrl_rear_view_down_state;
	Controls.fire_primary_down_count = rec->ctrl_fire_primary_down_count;
	Controls.fire_primary_state = rec->ctrl_fire_primary_state;
	Controls.fire_secondary_state = rec->ctrl_fire_secondary_state;
	Controls.fire_secondary_down_count = rec->ctrl_fire_secondary_down_count;
	Controls.fire_flare_down_count = rec->ctrl_fire_flare_down_count;
	Controls.drop_bomb_down_count = rec->ctrl_drop_bomb_down_count;
	Controls.automap_down_count = rec->ctrl_automap_down_count;
	Controls.automap_state = rec->ctrl_automap_state;
#ifdef BUILD_DESCENT2
	Controls.afterburner_state = rec->ctrl_afterburner_state;
	Controls.cycle_primary_count = rec->ctrl_cycle_primary_count;
	Controls.cycle_secondary_count = rec->ctrl_cycle_secondary_count;
	Controls.headlight_count = rec->ctrl_headlight_count;
#endif

	return 0;
}

void ox_replayer_log_state(void)
{
	if (!state_log)
		return;

	/* Write frame number */
	uint32_t frame = frames_replayed;
	fwrite(&frame, sizeof(frame), 1, state_log);

	/* Write key game state: objects up to Highest_object_index */
	int n_obj = Highest_object_index + 1;
	if (n_obj > MAX_OBJECTS) n_obj = MAX_OBJECTS;

	int32_t n = n_obj;
	fwrite(&n, sizeof(n), 1, state_log);
	if (n_obj > 0) {
		fwrite(Objects, sizeof(object), n_obj, state_log);
		fwrite(Ai_local_info, sizeof(ai_local), n_obj, state_log);
	}

	/* Write players */
	fwrite(Players, sizeof(player), MAX_PLAYERS, state_log);

	/* Write globals */
	int32_t globals[5];
	globals[0] = Player_is_dead;
	globals[1] = Player_exploded;
	globals[2] = Overall_agitation;
	globals[3] = Highest_object_index;
	globals[4] = (int32_t)P_Rand_get_state();
	fwrite(globals, sizeof(globals), 1, state_log);
}

void ox_replayer_close(void)
{
	if (replay_file) {
		fclose(replay_file);
		replay_file = NULL;
	}
	if (state_log) {
		fclose(state_log);
		state_log = NULL;
	}
	if (initial_snapshot) {
		free(initial_snapshot);
		initial_snapshot = NULL;
	}
	replaying_active = 0;

	fprintf(stderr, "OX_REPLAY: replay closed (%u frames replayed)\n", frames_replayed);
}

int ox_replayer_active(void)
{
	return replaying_active;
}

#endif /* OX_REPLAY */
