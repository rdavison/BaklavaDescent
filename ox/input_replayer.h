/*
 * input_replayer.h - Replay recorded game inputs for deterministic comparison
 *
 * Reads a recording file produced by input_recorder, overrides FrameTime,
 * Controls, and RNG state each frame to reproduce the same game state.
 * Optionally writes per-frame state logs for offline comparison.
 *
 * Compile with OX_REPLAY to enable.
 */

#ifndef OX_INPUT_REPLAYER_H
#define OX_INPUT_REPLAYER_H

#ifdef OX_REPLAY

#ifdef __cplusplus
extern "C" {
#endif

#include "ox/input_recorder.h"

/*
 * Initialize the replayer.
 * replay_file: path to recording file (from -replay command line arg)
 * state_log_file: path to state log output (from -state-log arg), or NULL
 * Returns 0 on success, -1 on failure.
 */
int ox_replayer_init(const char *replay_file, const char *state_log_file);

/*
 * Get the level number from the recording.
 * Call after init to know which level to load.
 */
int ox_replayer_get_level(void);

/*
 * Get the difficulty level from the recording.
 */
int ox_replayer_get_difficulty(void);

/*
 * Restore initial game state from the recording.
 * Call after the level is loaded to set up the exact initial state.
 */
void ox_replayer_restore_initial_state(void);

/*
 * Apply the next frame's recorded inputs.
 * Overrides FrameTime, Controls, and RNG state.
 * Returns 0 if a frame was applied, -1 if no more frames (replay done).
 */
int ox_replayer_apply_frame(void);

/*
 * Write current game state to the state log (if state logging is active).
 * Call after each frame's game logic has run.
 */
void ox_replayer_log_state(void);

/*
 * Finalize and close the replayer.
 */
void ox_replayer_close(void);

/*
 * Is replay active?
 */
int ox_replayer_active(void);

#ifdef __cplusplus
}
#endif

#endif /* OX_REPLAY */

#endif /* OX_INPUT_REPLAYER_H */
