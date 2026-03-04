/*
 * parity.c - Dual-execution parity testing for OCaml bridge
 *
 * Implements game state snapshot, restore, and field-by-field comparison.
 * Used to detect divergences between OCaml and C execution paths.
 */

#ifdef USE_OX_BRIDGE

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdarg>

#ifdef BUILD_DESCENT2
#include "main_d2/object.h"
#include "main_d2/ai.h"
#include "main_d2/aistruct.h"
#include "main_d2/player.h"
#include "main_d2/wall.h"
#include "main_d2/segment.h"
#include "main_d2/gameseg.h"
#include "main_shared/game_shared.h"
#include "misc/rand.h"
#else
#include "main_d1/object.h"
#include "main_d1/ai.h"
#include "main_d1/aistruct.h"
#include "main_d1/player.h"
#include "main_d1/wall.h"
#include "main_d1/segment.h"
#include "main_d1/gameseg.h"
#include "main_shared/game_shared.h"
#include "misc/rand.h"
#endif

#include "tools/parity.h"

/* Pre-allocated snapshot buffers (~350KB each, ~1MB total) */
game_state_snapshot parity_snap_before;
game_state_snapshot parity_snap_after_ocaml;
game_state_snapshot parity_snap_after_c;

/* Runtime configuration */
static int parity_initialized = 0;
static int parity_assert_on_diverge = 0;
static FILE *parity_log_file = NULL;
static int parity_total_divergences = 0;

void parity_init(void)
{
	if (parity_initialized) return;
	parity_initialized = 1;

	const char *assert_env = getenv("OX_PARITY_ASSERT");
	if (assert_env && atoi(assert_env))
		parity_assert_on_diverge = 1;

	const char *log_env = getenv("OX_PARITY_LOG");
	if (log_env && log_env[0]) {
		parity_log_file = fopen(log_env, "w");
		if (!parity_log_file)
			fprintf(stderr, "PARITY: failed to open log file '%s'\n", log_env);
	}

	fprintf(stderr, "PARITY: initialized (assert=%d, log=%s)\n",
		parity_assert_on_diverge,
		log_env ? log_env : "stderr");
}

/* Helper: write to both stderr and optional log file */
static void parity_log(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);

	if (parity_log_file) {
		va_start(ap, fmt);
		vfprintf(parity_log_file, fmt, ap);
		va_end(ap);
		fflush(parity_log_file);
	}
}

void parity_snapshot(game_state_snapshot *dst)
{
	int n_objects = Highest_object_index + 1;
	if (n_objects > PARITY_MAX_OBJECTS)
		n_objects = PARITY_MAX_OBJECTS;
	if (n_objects > 0) {
		memcpy(dst->objects, Objects, n_objects * sizeof(object));
		memcpy(dst->ai_local_info, Ai_local_info, n_objects * sizeof(ai_local));
	}

	memcpy(dst->players, Players, PARITY_MAX_PLAYERS * sizeof(player));

	int n_walls = Num_walls;
	if (n_walls > PARITY_MAX_WALLS)
		n_walls = PARITY_MAX_WALLS;
	if (n_walls > 0)
		memcpy(dst->walls, Walls, n_walls * sizeof(wall));

	/* Save per-segment object list heads */
	int n_segs = Highest_segment_index + 1;
	if (n_segs > PARITY_MAX_SEGMENTS)
		n_segs = PARITY_MAX_SEGMENTS;
	for (int i = 0; i < n_segs; i++)
		dst->seg_objects[i] = Segments[i].objects;
	dst->highest_segment_index = Highest_segment_index;

	dst->rand_state = P_Rand_get_state();
	dst->highest_object_index = Highest_object_index;
	dst->player_is_dead = Player_is_dead;
	dst->player_exploded = Player_exploded;
	dst->overall_agitation = Overall_agitation;
	dst->num_walls = Num_walls;
	dst->frame_time = FrameTime;
	dst->game_time = GameTime;
	dst->frame_count = FrameCount;
}

void parity_restore(const game_state_snapshot *src)
{
	int n_objects = src->highest_object_index + 1;
	if (n_objects > PARITY_MAX_OBJECTS)
		n_objects = PARITY_MAX_OBJECTS;
	if (n_objects > 0) {
		memcpy(Objects, src->objects, n_objects * sizeof(object));
		memcpy(Ai_local_info, src->ai_local_info, n_objects * sizeof(ai_local));
	}

	memcpy(Players, src->players, PARITY_MAX_PLAYERS * sizeof(player));

	int n_walls = src->num_walls;
	if (n_walls > PARITY_MAX_WALLS)
		n_walls = PARITY_MAX_WALLS;
	if (n_walls > 0)
		memcpy(Walls, src->walls, n_walls * sizeof(wall));

	Highest_object_index = src->highest_object_index;
	Player_is_dead = src->player_is_dead;
	Player_exploded = src->player_exploded;
	Overall_agitation = src->overall_agitation;
	Num_walls = src->num_walls;
	FrameTime = src->frame_time;
	GameTime = src->game_time;
	FrameCount = src->frame_count;

	P_Rand_set_state(src->rand_state);

	/* Restore per-segment object list heads */
	int n_segs = src->highest_segment_index + 1;
	if (n_segs > PARITY_MAX_SEGMENTS)
		n_segs = PARITY_MAX_SEGMENTS;
	for (int i = 0; i < n_segs; i++)
		Segments[i].objects = src->seg_objects[i];
}

/* ---- Field-by-field comparison ---- */

/* Macro to compare a field and log divergence */
#define CMP_FIELD(prefix, field, fmt_a, fmt_b) do { \
	if ((a_val = (fmt_a)) != (b_val = (fmt_b))) { \
		parity_log("  %s." #field ": OCaml=0x%X C=0x%X\n", prefix, a_val, b_val); \
		divergences++; \
	} \
} while(0)

static int compare_object(const object *oa, const object *ob, int idx, const char *fn_name, int frame)
{
	int divergences = 0;
	int a_val, b_val;
	char prefix[64];
	snprintf(prefix, sizeof(prefix), "Objects[%d]", idx);

	/* Skip OBJ_NONE objects */
	if (oa->type == 255 && ob->type == 255) /* OBJ_NONE */
		return 0;

	/* Core fields */
	CMP_FIELD(prefix, type, oa->type, ob->type);
	CMP_FIELD(prefix, id, oa->id, ob->id);
	CMP_FIELD(prefix, control_type, oa->control_type, ob->control_type);
	CMP_FIELD(prefix, movement_type, oa->movement_type, ob->movement_type);
	CMP_FIELD(prefix, flags, oa->flags, ob->flags);
	CMP_FIELD(prefix, segnum, oa->segnum, ob->segnum);

	/* Position */
	CMP_FIELD(prefix, pos.x, oa->pos.x, ob->pos.x);
	CMP_FIELD(prefix, pos.y, oa->pos.y, ob->pos.y);
	CMP_FIELD(prefix, pos.z, oa->pos.z, ob->pos.z);

	/* Orientation */
	CMP_FIELD(prefix, orient.rvec.x, oa->orient.rvec.x, ob->orient.rvec.x);
	CMP_FIELD(prefix, orient.rvec.y, oa->orient.rvec.y, ob->orient.rvec.y);
	CMP_FIELD(prefix, orient.rvec.z, oa->orient.rvec.z, ob->orient.rvec.z);
	CMP_FIELD(prefix, orient.uvec.x, oa->orient.uvec.x, ob->orient.uvec.x);
	CMP_FIELD(prefix, orient.uvec.y, oa->orient.uvec.y, ob->orient.uvec.y);
	CMP_FIELD(prefix, orient.uvec.z, oa->orient.uvec.z, ob->orient.uvec.z);
	CMP_FIELD(prefix, orient.fvec.x, oa->orient.fvec.x, ob->orient.fvec.x);
	CMP_FIELD(prefix, orient.fvec.y, oa->orient.fvec.y, ob->orient.fvec.y);
	CMP_FIELD(prefix, orient.fvec.z, oa->orient.fvec.z, ob->orient.fvec.z);

	/* Size, shields, lifeleft */
	CMP_FIELD(prefix, size, oa->size, ob->size);
	CMP_FIELD(prefix, shields, oa->shields, ob->shields);
	CMP_FIELD(prefix, lifeleft, oa->lifeleft, ob->lifeleft);

	/* Contains */
	CMP_FIELD(prefix, contains_type, oa->contains_type, ob->contains_type);
	CMP_FIELD(prefix, contains_id, oa->contains_id, ob->contains_id);
	CMP_FIELD(prefix, contains_count, oa->contains_count, ob->contains_count);

	/* Physics info (if physics object) */
	if (oa->movement_type == 1 || ob->movement_type == 1) { /* MT_PHYSICS */
		CMP_FIELD(prefix, phys.velocity.x, oa->mtype.phys_info.velocity.x, ob->mtype.phys_info.velocity.x);
		CMP_FIELD(prefix, phys.velocity.y, oa->mtype.phys_info.velocity.y, ob->mtype.phys_info.velocity.y);
		CMP_FIELD(prefix, phys.velocity.z, oa->mtype.phys_info.velocity.z, ob->mtype.phys_info.velocity.z);
		CMP_FIELD(prefix, phys.thrust.x, oa->mtype.phys_info.thrust.x, ob->mtype.phys_info.thrust.x);
		CMP_FIELD(prefix, phys.thrust.y, oa->mtype.phys_info.thrust.y, ob->mtype.phys_info.thrust.y);
		CMP_FIELD(prefix, phys.thrust.z, oa->mtype.phys_info.thrust.z, ob->mtype.phys_info.thrust.z);
		CMP_FIELD(prefix, phys.mass, oa->mtype.phys_info.mass, ob->mtype.phys_info.mass);
		CMP_FIELD(prefix, phys.drag, oa->mtype.phys_info.drag, ob->mtype.phys_info.drag);
		CMP_FIELD(prefix, phys.rotvel.x, oa->mtype.phys_info.rotvel.x, ob->mtype.phys_info.rotvel.x);
		CMP_FIELD(prefix, phys.rotvel.y, oa->mtype.phys_info.rotvel.y, ob->mtype.phys_info.rotvel.y);
		CMP_FIELD(prefix, phys.rotvel.z, oa->mtype.phys_info.rotvel.z, ob->mtype.phys_info.rotvel.z);
		CMP_FIELD(prefix, phys.rotthrust.x, oa->mtype.phys_info.rotthrust.x, ob->mtype.phys_info.rotthrust.x);
		CMP_FIELD(prefix, phys.rotthrust.y, oa->mtype.phys_info.rotthrust.y, ob->mtype.phys_info.rotthrust.y);
		CMP_FIELD(prefix, phys.rotthrust.z, oa->mtype.phys_info.rotthrust.z, ob->mtype.phys_info.rotthrust.z);
		CMP_FIELD(prefix, phys.turnroll, oa->mtype.phys_info.turnroll, ob->mtype.phys_info.turnroll);
		CMP_FIELD(prefix, phys.flags, oa->mtype.phys_info.flags, ob->mtype.phys_info.flags);
	}

	/* AI info (if AI-controlled) */
	if (oa->control_type == 2 || ob->control_type == 2) { /* CT_AI */
		CMP_FIELD(prefix, ai.behavior, oa->ctype.ai_info.behavior, ob->ctype.ai_info.behavior);
		CMP_FIELD(prefix, ai.hide_segment, oa->ctype.ai_info.hide_segment, ob->ctype.ai_info.hide_segment);
		CMP_FIELD(prefix, ai.hide_index, oa->ctype.ai_info.hide_index, ob->ctype.ai_info.hide_index);
		CMP_FIELD(prefix, ai.path_length, oa->ctype.ai_info.path_length, ob->ctype.ai_info.path_length);
		CMP_FIELD(prefix, ai.cur_path_index, oa->ctype.ai_info.cur_path_index, ob->ctype.ai_info.cur_path_index);
		CMP_FIELD(prefix, ai.danger_laser_num, oa->ctype.ai_info.danger_laser_num, ob->ctype.ai_info.danger_laser_num);
#ifdef BUILD_DESCENT2
		CMP_FIELD(prefix, ai.dying_start_time, oa->ctype.ai_info.dying_start_time, ob->ctype.ai_info.dying_start_time);
#endif
	}

	/* Laser info (if weapon) */
	if (oa->type == 7 || ob->type == 7) { /* OBJ_WEAPON */
		CMP_FIELD(prefix, laser.parent_type, oa->ctype.laser_info.parent_type, ob->ctype.laser_info.parent_type);
		CMP_FIELD(prefix, laser.parent_num, oa->ctype.laser_info.parent_num, ob->ctype.laser_info.parent_num);
		CMP_FIELD(prefix, laser.parent_signature, oa->ctype.laser_info.parent_signature, ob->ctype.laser_info.parent_signature);
		CMP_FIELD(prefix, laser.creation_time, oa->ctype.laser_info.creation_time, ob->ctype.laser_info.creation_time);
	}

	/* Deliberately skip: next, prev (linked list), attached_obj, render_type, rtype (render-only) */

	return divergences;
}

static int compare_ai_local(const ai_local *aa, const ai_local *ab, int idx)
{
	int divergences = 0;
	int a_val, b_val;
	char prefix[64];
	snprintf(prefix, sizeof(prefix), "Ai_local[%d]", idx);

	CMP_FIELD(prefix, player_awareness_type, aa->player_awareness_type, ab->player_awareness_type);
	CMP_FIELD(prefix, retry_count, aa->retry_count, ab->retry_count);
	CMP_FIELD(prefix, consecutive_retries, aa->consecutive_retries, ab->consecutive_retries);
	CMP_FIELD(prefix, mode, aa->mode, ab->mode);
	CMP_FIELD(prefix, previous_visibility, aa->previous_visibility, ab->previous_visibility);
	CMP_FIELD(prefix, rapidfire_count, aa->rapidfire_count, ab->rapidfire_count);
	CMP_FIELD(prefix, goal_segment, aa->goal_segment, ab->goal_segment);
#ifdef BUILD_DESCENT2
	CMP_FIELD(prefix, next_action_time, aa->next_action_time, ab->next_action_time);
#else
	CMP_FIELD(prefix, wait_time, aa->wait_time, ab->wait_time);
#endif
	CMP_FIELD(prefix, next_fire, aa->next_fire, ab->next_fire);
#ifdef BUILD_DESCENT2
	CMP_FIELD(prefix, next_fire2, aa->next_fire2, ab->next_fire2);
#endif
	CMP_FIELD(prefix, player_awareness_time, aa->player_awareness_time, ab->player_awareness_time);
	CMP_FIELD(prefix, time_player_seen, aa->time_player_seen, ab->time_player_seen);
	CMP_FIELD(prefix, time_player_sound_attacked, aa->time_player_sound_attacked, ab->time_player_sound_attacked);
	CMP_FIELD(prefix, next_misc_sound_time, aa->next_misc_sound_time, ab->next_misc_sound_time);
	CMP_FIELD(prefix, time_since_processed, aa->time_since_processed, ab->time_since_processed);

	for (int i = 0; i < 10; i++) { /* MAX_SUBMODELS = 10 */
		if (aa->goal_state[i] != ab->goal_state[i]) {
			parity_log("  %s.goal_state[%d]: OCaml=0x%X C=0x%X\n", prefix, i,
				(int)aa->goal_state[i], (int)ab->goal_state[i]);
			divergences++;
		}
		if (aa->achieved_state[i] != ab->achieved_state[i]) {
			parity_log("  %s.achieved_state[%d]: OCaml=0x%X C=0x%X\n", prefix, i,
				(int)aa->achieved_state[i], (int)ab->achieved_state[i]);
			divergences++;
		}
	}

	return divergences;
}

static int compare_player(const player *pa, const player *pb, int idx)
{
	int divergences = 0;
	int a_val, b_val;
	char prefix[64];
	snprintf(prefix, sizeof(prefix), "Players[%d]", idx);

	CMP_FIELD(prefix, flags, pa->flags, pb->flags);
	CMP_FIELD(prefix, energy, pa->energy, pb->energy);
	CMP_FIELD(prefix, shields, pa->shields, pb->shields);
	CMP_FIELD(prefix, lives, pa->lives, pb->lives);
	CMP_FIELD(prefix, laser_level, pa->laser_level, pb->laser_level);
	CMP_FIELD(prefix, score, pa->score, pb->score);
	CMP_FIELD(prefix, primary_weapon_flags, pa->primary_weapon_flags, pb->primary_weapon_flags);
	CMP_FIELD(prefix, secondary_weapon_flags, pa->secondary_weapon_flags, pb->secondary_weapon_flags);
	CMP_FIELD(prefix, cloak_time, pa->cloak_time, pb->cloak_time);
	CMP_FIELD(prefix, invulnerable_time, pa->invulnerable_time, pb->invulnerable_time);
	CMP_FIELD(prefix, hostages_on_board, pa->hostages_on_board, pb->hostages_on_board);

	for (int i = 0; i < 10; i++) { /* MAX_PRIMARY_WEAPONS */
		if (pa->primary_ammo[i] != pb->primary_ammo[i]) {
			parity_log("  %s.primary_ammo[%d]: OCaml=%u C=%u\n", prefix, i,
				pa->primary_ammo[i], pb->primary_ammo[i]);
			divergences++;
		}
	}
	for (int i = 0; i < 10; i++) { /* MAX_SECONDARY_WEAPONS */
		if (pa->secondary_ammo[i] != pb->secondary_ammo[i]) {
			parity_log("  %s.secondary_ammo[%d]: OCaml=%u C=%u\n", prefix, i,
				pa->secondary_ammo[i], pb->secondary_ammo[i]);
			divergences++;
		}
	}

	return divergences;
}

static int compare_wall(const wall *wa, const wall *wb, int idx)
{
	int divergences = 0;
	int a_val, b_val;
	char prefix[64];
	snprintf(prefix, sizeof(prefix), "Walls[%d]", idx);

	CMP_FIELD(prefix, hps, wa->hps, wb->hps);
	CMP_FIELD(prefix, type, wa->type, wb->type);
	CMP_FIELD(prefix, flags, wa->flags, wb->flags);
	CMP_FIELD(prefix, state, wa->state, wb->state);

	return divergences;
}

#undef CMP_FIELD

int parity_compare(const game_state_snapshot *a, const game_state_snapshot *b,
                   const char *fn_name, int frame, int objnum)
{
	int divergences = 0;

	if (!parity_initialized)
		parity_init();

	/* Compare objects up to the higher of the two highest indices */
	int max_obj = a->highest_object_index;
	if (b->highest_object_index > max_obj)
		max_obj = b->highest_object_index;

	if (a->highest_object_index != b->highest_object_index) {
		parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		parity_log("  Highest_object_index: OCaml=%d C=%d\n",
			a->highest_object_index, b->highest_object_index);
		divergences++;
	}

	int obj_divergences = 0;
	for (int i = 0; i <= max_obj && i < PARITY_MAX_OBJECTS; i++) {
		int d = compare_object(&a->objects[i], &b->objects[i], i, fn_name, frame);
		if (d > 0 && obj_divergences == 0) {
			/* Print header on first object divergence */
			if (divergences == 0)
				parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		}
		obj_divergences += d;

		/* Compare AI local for robots */
		if (a->objects[i].control_type == 2 || b->objects[i].control_type == 2) { /* CT_AI */
			int ad = compare_ai_local(&a->ai_local_info[i], &b->ai_local_info[i], i);
			if (ad > 0 && obj_divergences == 0 && divergences == 0)
				parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
			obj_divergences += ad;
		}
	}
	divergences += obj_divergences;

	/* Compare players */
	for (int i = 0; i < PARITY_MAX_PLAYERS; i++) {
		int d = compare_player(&a->players[i], &b->players[i], i);
		if (d > 0 && divergences == 0)
			parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		divergences += d;
	}

	/* Compare walls */
	int max_walls = a->num_walls;
	if (b->num_walls > max_walls)
		max_walls = b->num_walls;
	for (int i = 0; i < max_walls && i < PARITY_MAX_WALLS; i++) {
		int d = compare_wall(&a->walls[i], &b->walls[i], i);
		if (d > 0 && divergences == 0)
			parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		divergences += d;
	}

	/* Compare globals */
	if (a->player_is_dead != b->player_is_dead) {
		if (divergences == 0)
			parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		parity_log("  Player_is_dead: OCaml=%d C=%d\n", a->player_is_dead, b->player_is_dead);
		divergences++;
	}
	if (a->player_exploded != b->player_exploded) {
		if (divergences == 0)
			parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		parity_log("  Player_exploded: OCaml=%d C=%d\n", a->player_exploded, b->player_exploded);
		divergences++;
	}
	if (a->overall_agitation != b->overall_agitation) {
		if (divergences == 0)
			parity_log("PARITY DIVERGE frame=%d fn=%s obj=%d\n", frame, fn_name, objnum);
		parity_log("  Overall_agitation: OCaml=%d C=%d\n", a->overall_agitation, b->overall_agitation);
		divergences++;
	}

	/* Note: we do NOT compare rand_state here. RNG divergence is expected
	 * when OCaml calls P_Rand differently. Instead, we restore RNG state
	 * before each C run. */

	if (divergences > 0) {
		parity_total_divergences += divergences;
		parity_log("  [total %d divergent fields in this call, %d cumulative]\n",
			divergences, parity_total_divergences);

		if (parity_assert_on_diverge) {
			fprintf(stderr, "PARITY ASSERT: crashing due to OX_PARITY_ASSERT=1\n");
			abort();
		}
	}

	return divergences;
}

#endif /* USE_OX_BRIDGE */
