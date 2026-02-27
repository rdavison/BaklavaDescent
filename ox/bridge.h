#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

int cd_ox_init_runtime(const char* executable_path);
int cd_ox_is_ready(void);
int32_t cd_ox_i2f(int32_t i);
int32_t cd_ox_f2i(int32_t f);
int32_t cd_ox_fixmul(int32_t a, int32_t b);
int32_t cd_ox_fixdiv(int32_t a, int32_t b);
int32_t cd_ox_fix_sqrt(int32_t a);
int32_t cd_ox_fix_isqrt(int32_t a);
int32_t cd_ox_fix_asin(int32_t v);
int32_t cd_ox_fix_acos(int32_t v);
int32_t cd_ox_fix_atan2(int32_t cosv, int32_t sinv);
void cd_ox_fix_sincos(int32_t a, int32_t* s, int32_t* c);
void cd_ox_fix_fastsincos(int32_t a, int32_t* s, int32_t* c);
void cd_ox_vm_vec_add(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_sub(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_add2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_sub2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_avg(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_avg4(
    int32_t a1,
    int32_t a2,
    int32_t a3,
    int32_t b1,
    int32_t b2,
    int32_t b3,
    int32_t c1,
    int32_t c2,
    int32_t c3,
    int32_t d1,
    int32_t d2,
    int32_t d3,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_copy_scale(int32_t sx, int32_t sy, int32_t sz, int32_t k, int32_t* x, int32_t* y, int32_t* z);
void cd_ox_vm_vec_scale_add(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t k,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_scale_add2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t k,
    int32_t* x,
    int32_t* y,
    int32_t* z);
void cd_ox_vm_vec_scale2(int32_t dx, int32_t dy, int32_t dz, int32_t n, int32_t d, int32_t* x, int32_t* y, int32_t* z);
int32_t cd_ox_vm_vec_mag(int32_t x, int32_t y, int32_t z);
int32_t cd_ox_vm_vec_dist(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1);
int32_t cd_ox_vm_vec_dotprod(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1);
int32_t cd_ox_vm_vec_dot3(int32_t x, int32_t y, int32_t z, int32_t vx, int32_t vy, int32_t vz);
void cd_ox_vm_vec_crossprod(
    int32_t x0, int32_t y0, int32_t z0,
    int32_t x1, int32_t y1, int32_t z1,
    int32_t* rx, int32_t* ry, int32_t* rz);
void cd_ox_vm_vec_perp(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z,
    int32_t* rx, int32_t* ry, int32_t* rz);
int32_t cd_ox_vm_vec_copy_normalize(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t* nx, int32_t* ny, int32_t* nz);
void cd_ox_vm_vec_rotate(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz);
void cd_ox_sincos_2_matrix(
    int32_t sinp, int32_t cosp, int32_t sinb, int32_t cosb, int32_t sinh, int32_t cosh,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3);
void cd_ox_vm_angles_2_matrix(
    int32_t p, int32_t b, int32_t h,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3);
void cd_ox_vm_vec_ang_2_matrix(
    int32_t vx, int32_t vy, int32_t vz, int32_t a,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3);
void cd_ox_vm_transpose_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3);
void cd_ox_vm_matrix_x_matrix(
    int32_t s0r1, int32_t s0r2, int32_t s0r3,
    int32_t s0u1, int32_t s0u2, int32_t s0u3,
    int32_t s0f1, int32_t s0f2, int32_t s0f3,
    int32_t s1r1, int32_t s1r2, int32_t s1r3,
    int32_t s1u1, int32_t s1u2, int32_t s1u3,
    int32_t s1f1, int32_t s1f2, int32_t s1f3,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3);
void cd_ox_vm_vector_2_matrix(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t has_uvec, int32_t ux, int32_t uy, int32_t uz,
    int32_t has_rvec, int32_t rx, int32_t ry, int32_t rz,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3);
void cd_ox_vm_vector_2_matrix_norm(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t has_uvec, int32_t ux, int32_t uy, int32_t uz,
    int32_t has_rvec, int32_t rx, int32_t ry, int32_t rz,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3);
void cd_ox_vm_extract_angles_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* p, int32_t* b, int32_t* h);
void cd_ox_vm_extract_angles_vector_normalized(
    int32_t x, int32_t y, int32_t z,
    int32_t* p, int32_t* b, int32_t* h);
void cd_ox_vm_extract_angles_vector(
    int32_t ip, int32_t ib, int32_t ih,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t* p, int32_t* b, int32_t* h);
int32_t cd_ox_vm_vec_delta_ang_norm(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t has_fvec, int32_t fx, int32_t fy, int32_t fz);
int32_t cd_ox_vm_vec_mag_quick(int32_t x, int32_t y, int32_t z);
int32_t cd_ox_vm_vec_dist_quick(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1);
int32_t cd_ox_vm_vec_copy_normalize_quick(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t* nx, int32_t* ny, int32_t* nz);
int32_t cd_ox_vm_vec_delta_ang(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t has_fvec, int32_t fx, int32_t fy, int32_t fz);

/* 3D pipeline functions */
uint8_t cd_ox_g3_code_point(int32_t x, int32_t y, int32_t z);
int cd_ox_checkmuldiv(int32_t* r, int32_t a, int32_t b, int32_t c);
void cd_ox_g3_rotate_point(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz, uint8_t* codes);
int cd_ox_g3_project_point(
    int32_t x, int32_t y, int32_t z,
    int32_t canv_w2, int32_t canv_h2,
    int32_t* sx, int32_t* sy);
void cd_ox_g3_rotate_delta_x(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dx,
    int32_t* rx, int32_t* ry, int32_t* rz);
void cd_ox_g3_rotate_delta_y(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dy,
    int32_t* rx, int32_t* ry, int32_t* rz);
void cd_ox_g3_rotate_delta_z(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dz,
    int32_t* rx, int32_t* ry, int32_t* rz);
int32_t cd_ox_g3_calc_point_depth(
    int32_t px, int32_t py, int32_t pz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t fx, int32_t fy, int32_t fz);
void cd_ox_scale_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t wsx, int32_t wsy, int32_t wsz,
    int32_t zoom,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3,
    int32_t* msx, int32_t* msy, int32_t* msz);
void cd_ox_g3_start_instance_matrix(
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t px, int32_t py, int32_t pz,
    int32_t has_orient,
    int32_t mr1, int32_t mr2, int32_t mr3,
    int32_t mu1, int32_t mu2, int32_t mu3,
    int32_t mf1, int32_t mf2, int32_t mf3,
    int32_t* nvpx, int32_t* nvpy, int32_t* nvpz,
    int32_t* nr1, int32_t* nr2, int32_t* nr3,
    int32_t* nu1, int32_t* nu2, int32_t* nu3,
    int32_t* nf1, int32_t* nf2, int32_t* nf3);
void cd_ox_g3_point_2_vec(
    int32_t sx, int32_t sy,
    int32_t canv_w2, int32_t canv_h2,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t ur1, int32_t ur2, int32_t ur3,
    int32_t uu1, int32_t uu2, int32_t uu3,
    int32_t uf1, int32_t uf2, int32_t uf3,
    int32_t* vx, int32_t* vy, int32_t* vz);
void cd_ox_clip_edge(
    int32_t plane_flag,
    int32_t on_x, int32_t on_y, int32_t on_z,
    int32_t on_u, int32_t on_v, int32_t on_l, int32_t on_flags,
    int32_t off_x, int32_t off_y, int32_t off_z,
    int32_t off_u, int32_t off_v, int32_t off_l,
    int32_t* nx, int32_t* ny, int32_t* nz,
    int32_t* nu, int32_t* nv, int32_t* nl,
    int32_t* nflags, uint8_t* ncodes);
void cd_ox_clip_line(
    int32_t p0x, int32_t p0y, int32_t p0z, int32_t p0_codes,
    int32_t p1x, int32_t p1y, int32_t p1z, int32_t p1_codes,
    int32_t codes_or,
    int32_t* out_p0x, int32_t* out_p0y, int32_t* out_p0z, uint8_t* out_p0_codes,
    int32_t* out_p1x, int32_t* out_p1y, int32_t* out_p1z, uint8_t* out_p1_codes,
    int* out_clipped);
void cd_ox_clip_polygon(
    int32_t codes_or, int32_t codes_and,
    int nv, const int32_t* flat_in,
    int* out_nv, int32_t* out_flat,
    int32_t* out_codes_or, int32_t* out_codes_and);
int cd_ox_do_facing_check_computed(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z);
int cd_ox_g3_check_normal_facing(
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t nx, int32_t ny, int32_t nz);
int cd_ox_calc_rod_corners(
    int32_t bx, int32_t by, int32_t bz, int32_t bw,
    int32_t tx, int32_t ty, int32_t tz, int32_t tw,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t* c0x, int32_t* c0y, int32_t* c0z,
    int32_t* c1x, int32_t* c1y, int32_t* c1z,
    int32_t* c2x, int32_t* c2y, int32_t* c2z,
    int32_t* c3x, int32_t* c3y, int32_t* c3z,
    uint8_t* codes_and);

/* Collide / damage functions.
   Calls OCaml, returns flat effect-tree buffer in out_buf (max 32 ints).
   Layout: [new_shields, boss_been_hit, tree_node...]
   Tree node encoding:
     Leaf:  [0, return_val, num_effects, effect_tag, args...]
     Query: [1, obj_id, killer, then_len, then_node..., else_node...]
   Effect tags: 0=Increment_kills, 1=Start_boss_death(obj_id),
     2=Explode_object(obj_id), 3=Send_net_robot_explode(obj_id,killer) */
void cd_ox_apply_damage_to_robot_d1(
    int32_t flags, int32_t shields, int32_t damage,
    int is_boss, int is_multiplayer,
    int obj_id, int killer_objnum,
    int32_t* out_buf, int* out_len);

/* Gameseg functions */
void cd_ox_compute_center_point_on_side(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t v2x, int32_t v2y, int32_t v2z,
    int32_t v3x, int32_t v3y, int32_t v3z,
    int32_t* cx, int32_t* cy, int32_t* cz);
void cd_ox_compute_segment_center(
    const int32_t* verts_24, int32_t* cx, int32_t* cy, int32_t* cz);
void cd_ox_get_verts_for_normal(
    int32_t va, int32_t vb, int32_t vc, int32_t vd,
    int32_t* v0, int32_t* v1, int32_t* v2, int32_t* v3, int32_t* negate_flag);
void cd_ox_create_abs_vertex_lists(
    int32_t side_type, const int32_t* seg_verts_8, int32_t sidenum,
    int32_t* num_faces, int32_t* vertices_6);
void cd_ox_get_seg_masks(
    const int32_t* packed, int32_t packed_len,
    int32_t* facemask, int32_t* sidemask, int32_t* centermask);
void cd_ox_get_side_dists(
    const int32_t* packed, int32_t packed_len,
    int32_t* mask, int32_t* side_dists_6);
void cd_ox_extract_vector_from_segment(
    const int32_t* verts_24, int32_t start_side, int32_t end_side,
    int32_t* vx, int32_t* vy, int32_t* vz);
void cd_ox_extract_orient_from_segment(
    const int32_t* verts_24,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3);

/* FVI functions */
void cd_ox_check_line_to_face(
    const int32_t* packed, int32_t packed_len,
    int32_t* hit_type, int32_t* npx, int32_t* npy, int32_t* npz);
void cd_ox_special_check_line_to_face(
    const int32_t* packed, int32_t packed_len,
    int32_t* hit_type, int32_t* npx, int32_t* npy, int32_t* npz);
int32_t cd_ox_check_vector_to_sphere_1(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t spx, int32_t spy, int32_t spz,
    int32_t srad,
    int32_t* ix, int32_t* iy, int32_t* iz);

void cd_ox_physics_turn_towards_vector(
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t rate, int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz);

/* phys_apply_force: applies instantaneous force to velocity.
   Returns new velocity in out_vx/vy/vz. */
void cd_ox_phys_apply_force(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz);

/* phys_apply_rot: applies rotational whack (D1 version).
   Returns new rotvel in out_rx/ry/rz, and set_skip_ai flag. */
void cd_ox_phys_apply_rot(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass, int is_robot,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz,
    int* out_set_skip_ai);

/* calc_gun_point: computes world-space gun position via bone hierarchy.
   packed[] is 86 ints (see physics_bridge.ml for layout).
   Writes result to out_x/y/z. */
void cd_ox_calc_gun_point(
    const int32_t* packed, int packed_len,
    int32_t* out_x, int32_t* out_y, int32_t* out_z);

/* Returns 0 if no rotation needed (early exit), 1 if rotation applied.
   When returning 1, fills out_orient[9], out_rotvel[3], out_turnroll. */
int cd_ox_do_physics_sim_rot(
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t rtx, int32_t rty, int32_t rtz,
    int32_t o_rx, int32_t o_ry, int32_t o_rz,
    int32_t o_ux, int32_t o_uy, int32_t o_uz,
    int32_t o_fx, int32_t o_fy, int32_t o_fz,
    int32_t drag, int32_t mass, int32_t flags,
    int32_t turnroll, int32_t frame_time,
    int32_t* out_orient,
    int32_t* out_rvx, int32_t* out_rvy, int32_t* out_rvz,
    int32_t* out_turnroll);

/* ai_turn_towards_vector: AI smooth turn interpolation.
   Baby spider check done at callsite (delegates to physics_turn_towards_vector).
   For D1: seismic_mag=0, robot_mass=0, rand_vec=(0,0,0).
   For D2: pass Seismic_tremor_magnitude, Robot_info[id].mass, and pre-generated rand_vec.
   Returns new orient in out_orient[9] (rvec, uvec, fvec). */
void cd_ox_ai_turn_towards_vector(
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t rx, int32_t ry, int32_t rz,
    int32_t rate, int32_t frame_time,
    int32_t seismic_mag, int32_t robot_mass,
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t* out_orient);

/* set_thrust_from_velocity: compute thrust to maintain velocity.
   Returns thrust in out_tx/ty/tz. */
void cd_ox_set_thrust_from_velocity(
    int32_t mass, int32_t drag,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t* out_tx, int32_t* out_ty, int32_t* out_tz);

/* AI movement: move velocity towards goal vector.
   D1: dot_based=1, is_thief=0, is_kamikaze=0.
   D2: adds dot_based flag, thief/kamikaze max_speed doubling. */
void cd_ox_move_towards_vector(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t frame_time, int32_t difficulty,
    int32_t max_speed, int32_t attack_type,
    int dot_based, int is_thief, int is_kamikaze,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz);

/* AI movement: circle around player with evasion.
   packed is 19 ints (see physics_bridge.ml). */
void cd_ox_move_around_player(
    const int32_t* packed, int packed_len,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz);

/* AI movement: move velocity away from player.
   attack_type enables directional juke using uvec/rvec. */
void cd_ox_move_away_from_player(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t px, int32_t py, int32_t pz,
    int32_t ux, int32_t uy, int32_t uz,
    int32_t rx, int32_t ry, int32_t rz,
    int32_t frame_time, int32_t frame_count,
    int32_t objnum, int32_t attack_type, int32_t max_speed,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz);

/* set_object_turnroll: compute new turnroll from rotvel_y.
   Pure computation, returns new turnroll value. */
int32_t cd_ox_set_object_turnroll(
    int32_t rotvel_y, int32_t turnroll, int32_t frame_time);

/* lead_player: compute lead-firing direction (D2 only).
   Returns 1 on success (out_fx/fy/fz set), 0 on failure. */
int cd_ox_lead_player(
    int32_t fpx, int32_t fpy, int32_t fpz,
    int32_t bpx, int32_t bpy, int32_t bpz,
    int32_t pvx, int32_t pvy, int32_t pvz,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int player_cloaked, int32_t max_weapon_speed,
    int is_matter, int32_t difficulty_level,
    int32_t* out_fx, int32_t* out_fy, int32_t* out_fz);

/* homing_missile_turn_towards_velocity: blend velocity into orient.
   out_orient is 9 ints: rvec(3), uvec(3), fvec(3). */
void cd_ox_homing_missile_turn_towards_velocity(
    int32_t nvx, int32_t nvy, int32_t nvz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t frame_time,
    int32_t* out_orient);

#ifdef __cplusplus
}
#endif
