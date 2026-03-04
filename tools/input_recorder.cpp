/*
 * input_recorder.c - Record game inputs for deterministic replay
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
#include "main_d2/gameseq.h"
#else
#include "main_d1/object.h"
#include "main_d1/ai.h"
#include "main_d1/aistruct.h"
#include "main_d1/player.h"
#include "main_d1/wall.h"
#include "main_d1/kconfig.h"
#include "main_d1/game.h"
#include "main_d1/gameseq.h"
#endif

#include "main_shared/game_shared.h"
#include "misc/rand.h"
#include "tools/input_recorder.h"

/* Ring buffer for frame records - flush when full */
#define RECORD_BUFFER_SIZE 1024

static FILE *record_file = NULL;
static int recording_active = 0;
static uint32_t total_frames_recorded = 0;
static long header_offset = 0;  /* file offset of header for patching num_frames */

static ox_frame_record record_buffer[RECORD_BUFFER_SIZE];
static int buffer_count = 0;
static ox_replay_header saved_header;

/* Forward declaration for atexit handler */
void ox_recorder_close(void);

static void atexit_flush(void)
{
	if (recording_active)
		ox_recorder_close();
}

static void flush_buffer(void)
{
	if (buffer_count > 0 && record_file) {
		fwrite(record_buffer, sizeof(ox_frame_record), buffer_count, record_file);
		fflush(record_file);
		buffer_count = 0;
	}
}

int ox_recorder_init(const char *filename)
{
	record_file = fopen(filename, "wb");
	if (!record_file) {
		fprintf(stderr, "OX_REPLAY: failed to open '%s' for recording\n", filename);
		return -1;
	}

	/* Write placeholder header - will be patched on close */
	ox_replay_header hdr;
	memset(&hdr, 0, sizeof(hdr));
	hdr.magic = OX_REPLAY_MAGIC;
	hdr.version = OX_REPLAY_VERSION;
	header_offset = 0;
	fwrite(&hdr, sizeof(hdr), 1, record_file);
	fflush(record_file);

	recording_active = 1;
	total_frames_recorded = 0;
	buffer_count = 0;

	atexit(atexit_flush);

	fprintf(stderr, "OX_REPLAY: recording to '%s'\n", filename);
	return 0;
}

void ox_recorder_level_start(int level_num, int difficulty_level)
{
	if (!recording_active || !record_file)
		return;

	/* Rewrite header with level info */
	ox_replay_header hdr;
	hdr.magic = OX_REPLAY_MAGIC;
	hdr.version = OX_REPLAY_VERSION;
	hdr.level_num = level_num;
	hdr.difficulty_level = difficulty_level;
	hdr.initial_rand_state = P_Rand_get_state();
	hdr.highest_object_index = Highest_object_index;
	hdr.num_frames = 0;  /* patched on close */

	/* Calculate snapshot size: Objects + Ai_local_info + Players + Walls */
	int n_obj = Highest_object_index + 1;
	if (n_obj > MAX_OBJECTS) n_obj = MAX_OBJECTS;
	uint32_t snap_size = n_obj * sizeof(object)
	                   + n_obj * sizeof(ai_local)
	                   + MAX_PLAYERS * sizeof(player)
	                   + Num_walls * sizeof(wall);
	hdr.snapshot_size = snap_size;

	/* Save header for patching on close */
	saved_header = hdr;

	/* Seek back to header and rewrite */
	fseek(record_file, header_offset, SEEK_SET);
	fwrite(&hdr, sizeof(hdr), 1, record_file);

	/* Write initial state snapshot */
	if (n_obj > 0) {
		fwrite(Objects, sizeof(object), n_obj, record_file);
		fwrite(Ai_local_info, sizeof(ai_local), n_obj, record_file);
	}
	fwrite(Players, sizeof(player), MAX_PLAYERS, record_file);
	if (Num_walls > 0)
		fwrite(Walls, sizeof(wall), Num_walls, record_file);
	fflush(record_file);

	fprintf(stderr, "OX_REPLAY: level %d start recorded (snapshot %u bytes, %d objects, %d walls)\n",
		level_num, snap_size, n_obj, Num_walls);
}

void ox_recorder_frame(void)
{
	if (!recording_active)
		return;

	ox_frame_record *rec = &record_buffer[buffer_count];

	rec->frame_time = FrameTime;
	rec->rand_state = P_Rand_get_state();
	rec->frame_count = FrameCount;
	rec->game_time = GameTime;

	/* Pack control_info */
	rec->ctrl_pitch_time = Controls.pitch_time;
	rec->ctrl_vertical_thrust_time = Controls.vertical_thrust_time;
	rec->ctrl_heading_time = Controls.heading_time;
	rec->ctrl_sideways_thrust_time = Controls.sideways_thrust_time;
	rec->ctrl_bank_time = Controls.bank_time;
	rec->ctrl_forward_thrust_time = Controls.forward_thrust_time;
	rec->ctrl_rear_view_down_count = Controls.rear_view_down_count;
	rec->ctrl_rear_view_down_state = Controls.rear_view_down_state;
	rec->ctrl_fire_primary_down_count = Controls.fire_primary_down_count;
	rec->ctrl_fire_primary_state = Controls.fire_primary_state;
	rec->ctrl_fire_secondary_state = Controls.fire_secondary_state;
	rec->ctrl_fire_secondary_down_count = Controls.fire_secondary_down_count;
	rec->ctrl_fire_flare_down_count = Controls.fire_flare_down_count;
	rec->ctrl_drop_bomb_down_count = Controls.drop_bomb_down_count;
	rec->ctrl_automap_down_count = Controls.automap_down_count;
	rec->ctrl_automap_state = Controls.automap_state;
#ifdef BUILD_DESCENT2
	rec->ctrl_afterburner_state = Controls.afterburner_state;
	rec->ctrl_cycle_primary_count = Controls.cycle_primary_count;
	rec->ctrl_cycle_secondary_count = Controls.cycle_secondary_count;
	rec->ctrl_headlight_count = Controls.headlight_count;
#else
	rec->ctrl_afterburner_state = 0;
	rec->ctrl_cycle_primary_count = 0;
	rec->ctrl_cycle_secondary_count = 0;
	rec->ctrl_headlight_count = 0;
#endif
	rec->_pad[0] = 0;
	rec->_pad[1] = 0;

	buffer_count++;
	total_frames_recorded++;

	if (buffer_count >= RECORD_BUFFER_SIZE)
		flush_buffer();
}

void ox_recorder_close(void)
{
	if (!recording_active || !record_file)
		return;

	flush_buffer();

	/* Patch num_frames in header */
	saved_header.num_frames = total_frames_recorded;
	fseek(record_file, header_offset, SEEK_SET);
	fwrite(&saved_header, sizeof(saved_header), 1, record_file);

	fclose(record_file);
	record_file = NULL;
	recording_active = 0;

	fprintf(stderr, "OX_REPLAY: recording closed (%u frames)\n", total_frames_recorded);
}

int ox_recorder_active(void)
{
	return recording_active;
}

#endif /* OX_REPLAY */
