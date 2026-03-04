/*
 * input_recorder.h - Record game inputs for deterministic replay
 *
 * Records FrameTime, Controls, and RNG state each frame.
 * Used with input_replayer.h to regression-test OCaml bridge parity.
 *
 * Compile with OX_REPLAY to enable. Zero overhead when disabled.
 */

#ifndef OX_INPUT_RECORDER_H
#define OX_INPUT_RECORDER_H

#ifdef OX_REPLAY

#ifdef __cplusplus
extern "C" {
#endif

#include "fix/fix.h"
#include <stdint.h>

/* File format version */
#define OX_REPLAY_VERSION 1

/* Magic bytes for file identification */
#define OX_REPLAY_MAGIC 0x4F585245  /* "OXRE" */

/*
 * Per-frame record. Captures everything needed to reproduce one game frame.
 */
typedef struct ox_frame_record {
	fix             frame_time;
	uint32_t        rand_state;
	int32_t         frame_count;
	fix             game_time;
	/* control_info fields (6 fix + 10 uint8_t for D2) */
	fix             ctrl_pitch_time;
	fix             ctrl_vertical_thrust_time;
	fix             ctrl_heading_time;
	fix             ctrl_sideways_thrust_time;
	fix             ctrl_bank_time;
	fix             ctrl_forward_thrust_time;
	uint8_t         ctrl_rear_view_down_count;
	uint8_t         ctrl_rear_view_down_state;
	uint8_t         ctrl_fire_primary_down_count;
	uint8_t         ctrl_fire_primary_state;
	uint8_t         ctrl_fire_secondary_state;
	uint8_t         ctrl_fire_secondary_down_count;
	uint8_t         ctrl_fire_flare_down_count;
	uint8_t         ctrl_drop_bomb_down_count;
	uint8_t         ctrl_automap_down_count;
	uint8_t         ctrl_automap_state;
	uint8_t         ctrl_afterburner_state;
	uint8_t         ctrl_cycle_primary_count;
	uint8_t         ctrl_cycle_secondary_count;
	uint8_t         ctrl_headlight_count;
	uint8_t         _pad[2];  /* align to 4 bytes */
} ox_frame_record;

/*
 * File header written at the start of a recording.
 */
typedef struct ox_replay_header {
	uint32_t        magic;
	uint32_t        version;
	int32_t         level_num;
	int32_t         difficulty_level;
	uint32_t        initial_rand_state;
	int32_t         highest_object_index;
	uint32_t        num_frames;         /* filled on close */
	uint32_t        snapshot_size;      /* size of initial state snapshot that follows */
} ox_replay_header;

/*
 * Initialize the recorder. Call once at program startup.
 * filename: path to output file (from -record command line arg)
 * Returns 0 on success, -1 on failure.
 */
int ox_recorder_init(const char *filename);

/*
 * Record initial game state at level start.
 * Call from StartNewLevelSub or equivalent after level is fully loaded.
 */
void ox_recorder_level_start(int level_num, int difficulty_level);

/*
 * Record one frame of input. Call from GameLoop after calc_frame_time()
 * and after controls are read, before object_move_all().
 */
void ox_recorder_frame(void);

/*
 * Finalize and close the recording file.
 */
void ox_recorder_close(void);

/*
 * Is recording active?
 */
int ox_recorder_active(void);

#ifdef __cplusplus
}
#endif

#endif /* OX_REPLAY */

#endif /* OX_INPUT_RECORDER_H */
