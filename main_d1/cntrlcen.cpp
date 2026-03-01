/*
THE COMPUTER CODE CONTAINED HEREIN IS THE SOLE PROPERTY OF PARALLAX
SOFTWARE CORPORATION ("PARALLAX").  PARALLAX, IN DISTRIBUTING THE CODE TO
END-USERS, AND SUBJECT TO ALL OF THE TERMS AND CONDITIONS HEREIN, GRANTS A
ROYALTY-FREE, PERPETUAL LICENSE TO SUCH END-USERS FOR USE BY SUCH END-USERS
IN USING, DISPLAYING,  AND CREATING DERIVATIVE WORKS THEREOF, SO LONG AS
SUCH USE, DISPLAY OR CREATION IS FOR NON-COMMERCIAL, ROYALTY OR REVENUE
FREE PURPOSES.  IN NO EVENT SHALL THE END-USER USE THE COMPUTER CODE
CONTAINED HEREIN FOR REVENUE-BEARING PURPOSES.  THE END-USER UNDERSTANDS
AND AGREES TO THE TERMS HEREIN AND ACCEPTS THE SAME BY USE OF THIS FILE.
COPYRIGHT 1993-1998 PARALLAX SOFTWARE CORPORATION.  ALL RIGHTS RESERVED.
*/

#include <stdlib.h>
#include "misc/rand.h"
#include "misc/error.h"
#include "platform/mono.h"
#include "inferno.h"
#include "cntrlcen.h"
#include "game.h"
#include "laser.h"
#include "gameseq.h"
#include "ai.h"
#include "multi.h"
#include "fuelcen.h"
#include "wall.h"
#include "object.h"
#include "robot.h"

#ifdef USE_OX_BRIDGE
#include "ox/bridge.h"
#endif

vms_vector controlcen_gun_points[MAX_CONTROLCEN_GUNS];
vms_vector controlcen_gun_dirs[MAX_CONTROLCEN_GUNS];
int	N_controlcen_guns;
int	Control_center_been_hit;
int	Control_center_player_been_seen;
int	Control_center_next_fire_time;
int	Control_center_present;

vms_vector	Gun_pos[MAX_CONTROLCEN_GUNS], Gun_dir[MAX_CONTROLCEN_GUNS];

//	-----------------------------------------------------------------------------
//return the position & orientation of a gun on the control center object 
void calc_controlcen_gun_point(vms_vector* gun_point, vms_vector* gun_dir, object* obj, int gun_num)
{
#ifdef USE_OX_BRIDGE
	Assert(obj->type == OBJ_CNTRLCEN);
	Assert(obj->render_type == RT_POLYOBJ);
	Assert(gun_num < N_controlcen_guns);
	cd_ox_calc_controlcen_gun_point(
		controlcen_gun_points[gun_num].x, controlcen_gun_points[gun_num].y, controlcen_gun_points[gun_num].z,
		controlcen_gun_dirs[gun_num].x, controlcen_gun_dirs[gun_num].y, controlcen_gun_dirs[gun_num].z,
		obj->orient.rvec.x, obj->orient.rvec.y, obj->orient.rvec.z,
		obj->orient.uvec.x, obj->orient.uvec.y, obj->orient.uvec.z,
		obj->orient.fvec.x, obj->orient.fvec.y, obj->orient.fvec.z,
		obj->pos.x, obj->pos.y, obj->pos.z,
		&gun_point->x, &gun_point->y, &gun_point->z,
		&gun_dir->x, &gun_dir->y, &gun_dir->z);
#else
	vms_matrix m;

	Assert(obj->type == OBJ_CNTRLCEN);
	Assert(obj->render_type == RT_POLYOBJ);

	Assert(gun_num < N_controlcen_guns);

	vm_copy_transpose_matrix(&m, &obj->orient);

	vm_vec_rotate(gun_point, &controlcen_gun_points[gun_num], &m);
	vm_vec_add2(gun_point, &obj->pos);
	vm_vec_rotate(gun_dir, &controlcen_gun_dirs[gun_num], &m);
#endif
}

//	-----------------------------------------------------------------------------
//	Look at control center guns, find best one to fire at *objp.
//	Return best gun number (one whose direction dotted with vector to player is largest).
//	If best gun has negative dot, return -1, meaning no gun is good.
int calc_best_gun(int num_guns, vms_vector* gun_pos, vms_vector* gun_dir, vms_vector* objpos)
{
#ifdef USE_OX_BRIDGE
	/* packed: [num_guns, gun_pos(3*n), gun_dir(3*n), objpos(3)] */
	int32_t packed[4 + 6 * MAX_CONTROLCEN_GUNS];
	packed[0] = num_guns;
	for (int i = 0; i < num_guns; i++) {
		packed[1 + 3*i + 0] = gun_pos[i].x;
		packed[1 + 3*i + 1] = gun_pos[i].y;
		packed[1 + 3*i + 2] = gun_pos[i].z;
	}
	int dir_off = 1 + 3 * num_guns;
	for (int i = 0; i < num_guns; i++) {
		packed[dir_off + 3*i + 0] = gun_dir[i].x;
		packed[dir_off + 3*i + 1] = gun_dir[i].y;
		packed[dir_off + 3*i + 2] = gun_dir[i].z;
	}
	int obj_off = 1 + 6 * num_guns;
	packed[obj_off + 0] = objpos->x;
	packed[obj_off + 1] = objpos->y;
	packed[obj_off + 2] = objpos->z;
	return cd_ox_calc_best_gun(packed, obj_off + 3);
#else
	int	i;
	fix	best_dot;
	int	best_gun;

	best_dot = -F1_0 * 2;
	best_gun = -1;

	for (i = 0; i < num_guns; i++)
	{
		fix			dot;
		vms_vector	gun_vec;

		vm_vec_sub(&gun_vec, objpos, &gun_pos[i]);
		vm_vec_normalize_quick(&gun_vec);
		dot = vm_vec_dot(&gun_dir[i], &gun_vec);

		if (dot > best_dot)
		{
			best_dot = dot;
			best_gun = i;
		}
	}

	Assert(best_gun != -1);		// Contact Mike.  This is impossible.  Or maybe you're getting an unnormalized vector somewhere.

	if (best_dot < 0)
		return -1;
	else
		return best_gun;
#endif
}

extern fix Player_time_of_death;		//	object.c

int	Dead_controlcen_object_num = -1;

//	-----------------------------------------------------------------------------
//	Called every frame.  If control center been destroyed, then actually do something.
void do_controlcen_dead_frame(void)
{
	if (!Control_center_present)
		return;

	if ((Dead_controlcen_object_num != -1) && (Fuelcen_seconds_left > 0))
		if (P_Rand() < FrameTime * 4)
			create_small_fireball_on_object(&Objects[Dead_controlcen_object_num], F1_0 * 3, 1);
}

//	-----------------------------------------------------------------------------
//	Called when control center gets destroyed.
//	This code is common to whether control center is implicitly imbedded in a boss,
//	or is an object of its own.
//	if objp == NULL that means the boss was the control center and don't set Dead_controlcen_object_num
void do_controlcen_destroyed_stuff(object* objp)
{
	int	i;

	// Must toggle walls whether it is a boss or control center.
	for (i = 0; i < ControlCenterTriggers.num_links; i++)
		wall_toggle(&Segments[ControlCenterTriggers.seg[i]], ControlCenterTriggers.side[i]);

	// And start the countdown stuff.
	Fuelcen_control_center_destroyed = 1;


	if (!Control_center_present)
		return;

	if (objp != NULL)
		Dead_controlcen_object_num = objp - Objects;

}

//	-----------------------------------------------------------------------------
//do whatever this thing does in a frame
void do_controlcen_frame(object* obj)
{
#ifdef USE_OX_BRIDGE
	//	If a boss level, then Control_center_present will be 0.
	if (!Control_center_present)
		return;

	if (!Robot_firing_enabled)
		return;

	// Multiplayer believed_pos sync (stays on C side)
	if (Game_mode & GM_MULTI)
		Believed_player_pos = Objects[Players[Player_num].objnum].pos;

	// Precompute has_children
	int has_children = 0;
	segment *segp = &Segments[obj->segnum];
	for (int i = 0; i < MAX_SIDES_PER_SEGMENT; i++)
		if (segp->children[i] != -1) { has_children = 1; break; }

	// One-time registration of effect callbacks
	{
		static int reg = 0;
		if (!reg) {
			reg = 1;
			cd_ox_register_controlcen_frame_effects(
				[](int px, int py, int pz, int seg, int vx, int vy, int vz) -> int {
					extern bool g_ox_nested_ocaml_guard;
					vms_vector objpos = {px, py, pz};
					vms_vector vec = {vx, vy, vz};
					// Build a temporary object-like struct for the call
					object tmpobj = *(&Objects[0]); // dummy init
					tmpobj.pos = objpos;
					tmpobj.segnum = seg;
					// Guard: we're inside OCaml controlcen effects, prevent nested OCaml calls
					g_ox_nested_ocaml_guard = true;
					int result = player_is_visible_from_object(&tmpobj, &objpos, 0, &vec);
					g_ox_nested_ocaml_guard = false;
					return result;
				},
				[](int dx, int dy, int dz, int px, int py, int pz, int parent_id, int make_sound) {
					vms_vector dir = {dx, dy, dz};
					vms_vector pos = {px, py, pz};
					Laser_create_new_easy(&dir, &pos, parent_id, CONTROLCEN_WEAPON_NUM, make_sound);
				},
				[](int dx, int dy, int dz, int gun_num, int obj_id) {
					vms_vector dir = {dx, dy, dz};
#ifdef NETWORK
					multi_send_controlcen_fire(&dir, gun_num, obj_id);
#else
					(void)gun_num; (void)obj_id;
#endif
				},
				[](int32_t* rx, int32_t* ry, int32_t* rz) {
					vms_vector v;
					make_random_vector(&v);
					*rx = v.x; *ry = v.y; *rz = v.z;
				},
				[]() -> int { return P_Rand(); });
		}
	}

	// Pack gun arrays (n_guns * 3 each)
	int32_t gun_pos_flat[MAX_CONTROLCEN_GUNS * 3];
	int32_t gun_dir_flat[MAX_CONTROLCEN_GUNS * 3];
	for (int i = 0; i < N_controlcen_guns; i++) {
		gun_pos_flat[i*3]   = Gun_pos[i].x;
		gun_pos_flat[i*3+1] = Gun_pos[i].y;
		gun_pos_flat[i*3+2] = Gun_pos[i].z;
		gun_dir_flat[i*3]   = Gun_dir[i].x;
		gun_dir_flat[i*3+1] = Gun_dir[i].y;
		gun_dir_flat[i*3+2] = Gun_dir[i].z;
	}

	int32_t result[3];
	cd_ox_do_controlcen_frame_d1(
		Control_center_been_hit, Control_center_player_been_seen,
		Control_center_next_fire_time,
		N_controlcen_guns, gun_pos_flat, gun_dir_flat,
		FrameCount, FrameTime,
		Game_mode, Difficulty_level,
		Players[Player_num].flags, Player_is_dead,
		GameTime, Player_time_of_death,
		obj->pos.x, obj->pos.y, obj->pos.z, obj->segnum,
		ConsoleObject->pos.x, ConsoleObject->pos.y, ConsoleObject->pos.z,
		Believed_player_pos.x, Believed_player_pos.y, Believed_player_pos.z,
		has_children, (int)(obj - Objects),
		result);

	Control_center_been_hit = result[0];
	Control_center_player_been_seen = result[1];
	Control_center_next_fire_time = result[2];
#else
	int			best_gun_num;

	//	If a boss level, then Control_center_present will be 0.
	if (!Control_center_present)
		return;

#ifndef NDEBUG
	if (!Robot_firing_enabled || (Game_suspended & SUSP_ROBOTS))
		return;
#else
	if (!Robot_firing_enabled)
		return;
#endif

	if (!(Control_center_been_hit || Control_center_player_been_seen))
	{
		if (!(FrameCount % 8)) //	Do every so often...
		{
			vms_vector	vec_to_player;
			fix			dist_to_player;
			int			i;
			segment* segp = &Segments[obj->segnum];

			// This is a hack.  Since the control center is not processed by
			// ai_do_frame, it doesn't know to deal with cloaked dudes.  It
			// seems to work in single-player mode because it is actually using
			// the value of Believed_player_position that was set by the last
			// person to go through ai_do_frame.  But since a no-robots game
			// never goes through ai_do_frame, I'm making it so the control
			// center can spot cloaked dudes.

			if (Game_mode & GM_MULTI)
				Believed_player_pos = Objects[Players[Player_num].objnum].pos;

			//	Hack for special control centers which are isolated and not reachable because the
			//	real control center is inside the boss.
			for (i = 0; i < MAX_SIDES_PER_SEGMENT; i++)
				if (segp->children[i] != -1)
					break;
			if (i == MAX_SIDES_PER_SEGMENT)
				return;

			vm_vec_sub(&vec_to_player, &ConsoleObject->pos, &obj->pos);
			dist_to_player = vm_vec_normalize_quick(&vec_to_player);
			if (dist_to_player < F1_0 * 200)
			{
				Control_center_player_been_seen = player_is_visible_from_object(obj, &obj->pos, 0, &vec_to_player);
				Control_center_next_fire_time = 0;
			}
		}

		return;
	}

	if ((Control_center_next_fire_time < 0) && !(Player_is_dead && (GameTime > Player_time_of_death + F1_0 * 2)))
	{
		if (Players[Player_num].flags & PLAYER_FLAGS_CLOAKED)
			best_gun_num = calc_best_gun(N_controlcen_guns, Gun_pos, Gun_dir, &Believed_player_pos);
		else
			best_gun_num = calc_best_gun(N_controlcen_guns, Gun_pos, Gun_dir, &ConsoleObject->pos);

		if (best_gun_num != -1) {
			vms_vector	vec_to_goal;
			fix			dist_to_player;
			fix			delta_fire_time;

			if (Players[Player_num].flags & PLAYER_FLAGS_CLOAKED)
			{
				vm_vec_sub(&vec_to_goal, &Believed_player_pos, &Gun_pos[best_gun_num]);
				dist_to_player = vm_vec_normalize_quick(&vec_to_goal);
			}
			else
			{
				vm_vec_sub(&vec_to_goal, &ConsoleObject->pos, &Gun_pos[best_gun_num]);
				dist_to_player = vm_vec_normalize_quick(&vec_to_goal);
			}

			if (dist_to_player > F1_0 * 300)
			{
				Control_center_been_hit = 0;
				Control_center_player_been_seen = 0;
				return;
			}

#ifdef NETWORK
			if (Game_mode & GM_MULTI)
				multi_send_controlcen_fire(&vec_to_goal, best_gun_num, obj - Objects);
#endif
			Laser_create_new_easy(&vec_to_goal, &Gun_pos[best_gun_num], obj - Objects, CONTROLCEN_WEAPON_NUM, 1);

			//	1/4 of time, fire another thing, not directly at player, so it might hit him if he's constantly moving.
			if (P_Rand() < 32767 / 4)
			{
				vms_vector	randvec;

				make_random_vector(&randvec);
				vm_vec_scale_add2(&vec_to_goal, &randvec, F1_0 / 4);
				vm_vec_normalize_quick(&vec_to_goal);
#ifdef NETWORK
				if (Game_mode & GM_MULTI)
					multi_send_controlcen_fire(&vec_to_goal, best_gun_num, obj - Objects);
#endif
				Laser_create_new_easy(&vec_to_goal, &Gun_pos[best_gun_num], obj - Objects, CONTROLCEN_WEAPON_NUM, 1);
			}

			delta_fire_time = (NDL - Difficulty_level) * F1_0 / 4;
			if (Game_mode & GM_MULTI) // slow down rate of fire in multi player
				delta_fire_time *= 2;

			Control_center_next_fire_time = delta_fire_time;

		}
	}
	else
		Control_center_next_fire_time -= FrameTime;
#endif
}

//	-----------------------------------------------------------------------------
//	This must be called at the start of each level.
//	If this level contains a boss and mode != multiplayer, don't do control center stuff.  (Ghost out control center object.)
//	If this level contains a boss and mode == multiplayer, do control center stuff.
void init_controlcen_for_level(void)
{
	int		i;
	object* objp;
	int		cntrlcen_objnum = -1, boss_objnum = -1;

	for (i = 0; i <= Highest_object_index; i++) 
	{
		objp = &Objects[i];
		if (objp->type == OBJ_CNTRLCEN)
			if (cntrlcen_objnum != -1)
				mprintf((1, "Warning: Two or more control centers including %i and %i\n", i, cntrlcen_objnum));
			else
				cntrlcen_objnum = i;

		if ((objp->type == OBJ_ROBOT) && (Robot_info[objp->id].boss_flag)) 
		{
			//		 	mprintf((0, "Found boss robot %d.\n", objp->id));
			if (boss_objnum != -1)
				mprintf((1, "Warning: Two or more bosses including %i and %i\n", i, boss_objnum));
			else
				boss_objnum = i;
		}
	}

#ifndef NDEBUG //[ISB] buy why
	if (cntrlcen_objnum == -1) 
	{
		mprintf((1, "Warning: No control center.\n"));
		return;
	}

#endif
	if ((boss_objnum != -1) && !((Game_mode & GM_MULTI) && !(Game_mode & GM_MULTI_ROBOTS))) 
	{
		if (cntrlcen_objnum != -1) 
		{
			//			mprintf((0, "Ghosting control center\n"));
			Objects[cntrlcen_objnum].type = OBJ_GHOST;
			Objects[cntrlcen_objnum].render_type = RT_NONE;
			Control_center_present = 0;
		}
	}
	else 
	{
		if (cntrlcen_objnum != -1) //[ISB] Resolve memory corruption. 
		{
			//	Compute all gun positions.
			objp = &Objects[cntrlcen_objnum];
			for (i = 0; i < N_controlcen_guns; i++)
				calc_controlcen_gun_point(&Gun_pos[i], &Gun_dir[i], objp, i);
			Control_center_present = 1;

			//	Boost control center strength at higher levels.
			if (Current_level_num >= 0)
				objp->shields = F1_0 * 200 + (F1_0 * 200 / 4) * Current_level_num;
			else
				objp->shields = F1_0 * 200 - Current_level_num * F1_0 * 100;
		}
	}

	//	Say the control center has not yet been hit.
	Control_center_been_hit = 0;
	Control_center_player_been_seen = 0;
	Control_center_next_fire_time = 0;

	Dead_controlcen_object_num = -1;
}
