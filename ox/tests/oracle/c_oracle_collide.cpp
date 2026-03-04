#include "c_oracle_collide.h"
#include "c_oracle.h"

/* Object type constants matching Descent */
#define OBJ_ROBOT    2
#define OBJ_PLAYER   4
#define OBJ_CLUTTER  11
#define OBJ_CNTRLCEN 9

/* Physics flags */
#define PF_PERSISTENT 0x20

/* Movement type */
#define MT_PHYSICS 1

/* F1_0 = 0x10000 */
#define F1_0 0x10000

/* ---- bump_one_object ---- */
extern "C" void c_oracle_bump_one_object(
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t hit_dir_x, int32_t hit_dir_y, int32_t hit_dir_z,
    int32_t damage, int32_t mass,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    /* hit_vec = hit_dir * damage */
    c_oracle_vec3 hit_vec = { hit_dir_x, hit_dir_y, hit_dir_z };
    c_oracle_vm_vec_scale(&hit_vec, damage);

    /* phys_apply_force(obj, hit_vec) */
    c_oracle_phys_apply_force(
        vel_x, vel_y, vel_z,
        hit_vec.x, hit_vec.y, hit_vec.z,
        mass,
        out_vx, out_vy, out_vz);
}

/* ---- bump_this_object (no damage) ---- */
extern "C" void c_oracle_bump_this_object_no_damage(
    int32_t obj_type, int32_t phys_flags, int32_t robot_boss,
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t rotvel_x, int32_t rotvel_y, int32_t rotvel_z,
    int32_t mass, int32_t difficulty,
    int32_t force_x, int32_t force_y, int32_t force_z,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz)
{
    /* Default: unchanged */
    *out_vx = vel_x; *out_vy = vel_y; *out_vz = vel_z;
    *out_rx = rotvel_x; *out_ry = rotvel_y; *out_rz = rotvel_z;

    if (phys_flags & PF_PERSISTENT)
        return;

    if (obj_type == OBJ_PLAYER)
    {
        /* force2 = force / 4 */
        int32_t f2x = force_x / 4;
        int32_t f2y = force_y / 4;
        int32_t f2z = force_z / 4;
        c_oracle_phys_apply_force(
            vel_x, vel_y, vel_z,
            f2x, f2y, f2z, mass,
            out_vx, out_vy, out_vz);
        /* no damage, rotvel unchanged */
    }
    else if (obj_type == OBJ_ROBOT || obj_type == OBJ_CLUTTER || obj_type == OBJ_CNTRLCEN)
    {
        if (robot_boss)
            return;

        int32_t divisor = 4 + difficulty;
        int32_t f2x = force_x / divisor;
        int32_t f2y = force_y / divisor;
        int32_t f2z = force_z / divisor;

        /* phys_apply_force with full force */
        c_oracle_phys_apply_force(
            vel_x, vel_y, vel_z,
            force_x, force_y, force_z, mass,
            out_vx, out_vy, out_vz);

        /* phys_apply_rot with scaled force
           fvec = (0, 0, F1_0) as placeholder */
        int skip_ai;
        c_oracle_phys_apply_rot(
            f2x, f2y, f2z,
            mass, (obj_type == OBJ_ROBOT) ? 1 : 0,
            0, 0, F1_0,
            0, /* is_morph */
            rotvel_x, rotvel_y, rotvel_z,
            out_rx, out_ry, out_rz,
            &skip_ai);
    }
}

/* ---- bump_two_objects (no damage) ---- */
extern "C" void c_oracle_bump_two_objects_no_damage(
    int32_t this_type, int32_t this_phys_flags, int32_t this_robot_boss,
    int32_t this_vel_x, int32_t this_vel_y, int32_t this_vel_z,
    int32_t this_rotvel_x, int32_t this_rotvel_y, int32_t this_rotvel_z,
    int32_t this_mass, int32_t this_movement_type,
    int32_t hit_type, int32_t hit_phys_flags, int32_t hit_robot_boss,
    int32_t hit_vel_x, int32_t hit_vel_y, int32_t hit_vel_z,
    int32_t hit_rotvel_x, int32_t hit_rotvel_y, int32_t hit_rotvel_z,
    int32_t hit_mass, int32_t hit_movement_type,
    int32_t difficulty,
    int32_t* out_buf)
{
    /* out_buf layout: [tv_x, tv_y, tv_z, tr_x, tr_y, tr_z,
                        hv_x, hv_y, hv_z, hr_x, hr_y, hr_z] */

    /* Default: unchanged */
    out_buf[0] = this_vel_x; out_buf[1] = this_vel_y; out_buf[2] = this_vel_z;
    out_buf[3] = this_rotvel_x; out_buf[4] = this_rotvel_y; out_buf[5] = this_rotvel_z;
    out_buf[6] = hit_vel_x; out_buf[7] = hit_vel_y; out_buf[8] = hit_vel_z;
    out_buf[9] = hit_rotvel_x; out_buf[10] = hit_rotvel_y; out_buf[11] = hit_rotvel_z;

    /* If one object is not MT_PHYSICS, only bump that one */
    if (this_movement_type != MT_PHYSICS)
    {
        /* t = this; force = -vel * mass; apply to self */
        c_oracle_vec3 this_v = { this_vel_x, this_vel_y, this_vel_z };
        c_oracle_vec3 force;
        c_oracle_vm_vec_copy_scale(&force, &this_v, -this_mass);
        c_oracle_phys_apply_force(
            this_vel_x, this_vel_y, this_vel_z,
            force.x, force.y, force.z, this_mass,
            &out_buf[0], &out_buf[1], &out_buf[2]);
        return;
    }
    if (hit_movement_type != MT_PHYSICS)
    {
        c_oracle_vec3 hit_v = { hit_vel_x, hit_vel_y, hit_vel_z };
        c_oracle_vec3 force;
        c_oracle_vm_vec_copy_scale(&force, &hit_v, -hit_mass);
        c_oracle_phys_apply_force(
            hit_vel_x, hit_vel_y, hit_vel_z,
            force.x, force.y, force.z, hit_mass,
            &out_buf[6], &out_buf[7], &out_buf[8]);
        return;
    }

    /* Both are MT_PHYSICS: compute collision force */
    c_oracle_vec3 v0 = { this_vel_x, this_vel_y, this_vel_z };
    c_oracle_vec3 v1 = { hit_vel_x, hit_vel_y, hit_vel_z };
    c_oracle_vec3 force;
    c_oracle_vm_vec_sub(&force, &v0, &v1);
    int32_t n = 2 * c_oracle_fixmul(this_mass, hit_mass);
    int32_t d = this_mass + hit_mass;
    c_oracle_vm_vec_scale2(&force, n, d);

    /* bump hit object with +force */
    c_oracle_bump_this_object_no_damage(
        hit_type, hit_phys_flags, hit_robot_boss,
        hit_vel_x, hit_vel_y, hit_vel_z,
        hit_rotvel_x, hit_rotvel_y, hit_rotvel_z,
        hit_mass, difficulty,
        force.x, force.y, force.z,
        &out_buf[6], &out_buf[7], &out_buf[8],
        &out_buf[9], &out_buf[10], &out_buf[11]);

    /* bump this object with -force */
    c_oracle_bump_this_object_no_damage(
        this_type, this_phys_flags, this_robot_boss,
        this_vel_x, this_vel_y, this_vel_z,
        this_rotvel_x, this_rotvel_y, this_rotvel_z,
        this_mass, difficulty,
        -force.x, -force.y, -force.z,
        &out_buf[0], &out_buf[1], &out_buf[2],
        &out_buf[3], &out_buf[4], &out_buf[5]);
}
