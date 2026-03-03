/*
 * parity.h - Dual-execution parity testing for OCaml bridge
 *
 * Snapshots full game state before/after OCaml and C execution paths,
 * compares field-by-field, and logs divergences. C path is canonical.
 *
 * Compile with USE_OX_BRIDGE to enable. Zero overhead when disabled.
 *
 * Runtime control:
 *   OX_PARITY_ASSERT=1  - crash on first divergence
 *   OX_PARITY_LOG=file  - write divergences to file
 */

#ifndef OX_PARITY_H
#define OX_PARITY_H

#ifdef USE_OX_BRIDGE

#ifdef __cplusplus
extern "C" {
#endif

#include "fix/fix.h"

/* Forward declarations - actual types come from game headers */
struct object;
struct ai_local;
struct player;
struct wall;

#define PARITY_MAX_OBJECTS  350
#define PARITY_MAX_PLAYERS  8
#define PARITY_MAX_WALLS    254
#define PARITY_MAX_SEGMENTS 900

typedef struct game_state_snapshot {
	/* Object array - only up to Highest_object_index+1 are meaningful */
	struct object   objects[PARITY_MAX_OBJECTS];
	struct ai_local ai_local_info[PARITY_MAX_OBJECTS];
	struct player   players[PARITY_MAX_PLAYERS];
	struct wall     walls[PARITY_MAX_WALLS];

	/* Per-segment object list heads (obj_relink modifies these) */
	short           seg_objects[PARITY_MAX_SEGMENTS];
	int             highest_segment_index;

	/* Key globals */
	unsigned int    rand_state;
	int             highest_object_index;
	int             player_is_dead;
	int             player_exploded;
	int             overall_agitation;
	int             num_walls;
	fix             frame_time;
	fix             game_time;
	int             frame_count;
} game_state_snapshot;

/*
 * Snapshot the current game state into dst.
 */
void parity_snapshot(game_state_snapshot *dst);

/*
 * Restore game state from src (used between OCaml and C runs).
 */
void parity_restore(const game_state_snapshot *src);

/*
 * Compare two snapshots field-by-field.
 * Logs all divergences to stderr (and optionally to file).
 * Returns number of divergent fields.
 *
 * fn_name: which function was being compared (e.g. "do_physics_sim")
 * frame: current frame number
 * objnum: object being processed (-1 if N/A)
 */
int parity_compare(const game_state_snapshot *a, const game_state_snapshot *b,
                   const char *fn_name, int frame, int objnum);

/*
 * Initialize parity system. Call once at startup.
 * Reads OX_PARITY_ASSERT and OX_PARITY_LOG environment variables.
 */
void parity_init(void);

/*
 * Pre-allocated snapshot buffers for use in dual-execution wrappers.
 * Avoids repeated allocation of ~350KB snapshots.
 */
extern game_state_snapshot parity_snap_before;
extern game_state_snapshot parity_snap_after_ocaml;
extern game_state_snapshot parity_snap_after_c;

#ifdef __cplusplus
}
#endif

#endif /* USE_OX_BRIDGE */

#endif /* OX_PARITY_H */
