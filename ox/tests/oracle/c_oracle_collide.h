#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* bump_one_object: scale hit_dir by damage, apply as force.
   Returns new velocity. */
void c_oracle_bump_one_object(
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t hit_dir_x, int32_t hit_dir_y, int32_t hit_dir_z,
    int32_t damage, int32_t mass,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz);

/* bump_this_object (D1, no damage): apply force and rotation to one object.
   Returns (new_vel, new_rotvel).  Damage path omitted for purity.
   obj_type: OBJ_PLAYER=4, OBJ_ROBOT=2, OBJ_CLUTTER=11, OBJ_CNTRLCEN=9
   phys_flags: PF_PERSISTENT=0x20
   robot_boss: 0 = not boss */
void c_oracle_bump_this_object_no_damage(
    int32_t obj_type, int32_t phys_flags, int32_t robot_boss,
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t rotvel_x, int32_t rotvel_y, int32_t rotvel_z,
    int32_t mass, int32_t difficulty,
    int32_t force_x, int32_t force_y, int32_t force_z,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz);

/* bump_two_objects (no damage): compute collision force and bump both.
   Returns (this_vel, this_rotvel, hit_vel, hit_rotvel). */
void c_oracle_bump_two_objects_no_damage(
    /* this object */
    int32_t this_type, int32_t this_phys_flags, int32_t this_robot_boss,
    int32_t this_vel_x, int32_t this_vel_y, int32_t this_vel_z,
    int32_t this_rotvel_x, int32_t this_rotvel_y, int32_t this_rotvel_z,
    int32_t this_mass, int32_t this_movement_type,
    /* hit object */
    int32_t hit_type, int32_t hit_phys_flags, int32_t hit_robot_boss,
    int32_t hit_vel_x, int32_t hit_vel_y, int32_t hit_vel_z,
    int32_t hit_rotvel_x, int32_t hit_rotvel_y, int32_t hit_rotvel_z,
    int32_t hit_mass, int32_t hit_movement_type,
    /* context */
    int32_t difficulty,
    /* outputs: this_vel, this_rotvel, hit_vel, hit_rotvel */
    int32_t* out_buf);

#ifdef __cplusplus
}
#endif
