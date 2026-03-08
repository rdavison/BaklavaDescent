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

/* Collide / damage effect callback typedefs */
typedef void (*cd_effect_increment_kills_fn)(void);
typedef void (*cd_effect_start_boss_death_fn)(int obj_id);
typedef void (*cd_effect_explode_object_fn)(int obj_id);
typedef void (*cd_effect_send_net_robot_explode_fn)(int obj_id, int killer);
typedef int  (*cd_effect_multi_explode_robot_sub_fn)(int obj_id, int killer);

/* Register collide effect callbacks (call once before first use) */
void cd_ox_register_collide_effects(
    cd_effect_increment_kills_fn increment_kills,
    cd_effect_start_boss_death_fn start_boss_death,
    cd_effect_explode_object_fn explode_object,
    cd_effect_send_net_robot_explode_fn send_net_robot_explode,
    cd_effect_multi_explode_robot_sub_fn multi_explode_robot_sub);

/* Collide / damage: returns new_shields, boss_been_hit flag, and return value.
   Effect callbacks are invoked during execution via OCaml algebraic effects. */
void cd_ox_apply_damage_to_robot_d1(
    int32_t flags, int32_t shields, int32_t damage,
    int is_boss, int is_multiplayer,
    int obj_id, int killer_objnum,
    int32_t* out_new_shields, int* out_boss_been_hit, int* out_return_value);

/* D2 collide effect callback typedefs */
typedef void (*cd_effect_set_boss_hit_time_fn)(void);
typedef int  (*cd_effect_query_player_dead_or_no_shields_fn)(void);
typedef int  (*cd_effect_query_multi_all_players_alive_fn)(void);
typedef void (*cd_effect_do_final_boss_hacks_fn)(void);
typedef void (*cd_effect_multi_send_finish_game_fn)(void);
typedef void (*cd_effect_save_stolen_items_fn)(void);
typedef void (*cd_effect_restore_stolen_items_fn)(void);
typedef void (*cd_effect_clear_stolen_items_fn)(void);
typedef int  (*cd_effect_multi_explode_d2_fn)(int obj_id, int killer, int is_thief);
typedef void (*cd_effect_multi_send_robot_explode_d2_fn)(int obj_id, int killer, int is_thief);
typedef void (*cd_effect_start_robot_death_sequence_fn)(int obj_id);
typedef void (*cd_effect_special_reactor_stuff_fn)(void);
typedef void (*cd_effect_explode_object_delay_fn)(int obj_id, int delay);

/* Register D2 collide effect callbacks (call once before first use) */
void cd_ox_register_collide_effects_d2(
    cd_effect_increment_kills_fn increment_kills,
    cd_effect_start_boss_death_fn start_boss_death,
    cd_effect_set_boss_hit_time_fn set_boss_hit_time,
    cd_effect_query_player_dead_or_no_shields_fn query_player_dead_or_no_shields,
    cd_effect_query_multi_all_players_alive_fn query_multi_all_players_alive,
    cd_effect_do_final_boss_hacks_fn do_final_boss_hacks,
    cd_effect_multi_send_finish_game_fn multi_send_finish_game,
    cd_effect_save_stolen_items_fn save_stolen_items,
    cd_effect_restore_stolen_items_fn restore_stolen_items,
    cd_effect_clear_stolen_items_fn clear_stolen_items,
    cd_effect_multi_explode_d2_fn multi_explode_d2,
    cd_effect_multi_send_robot_explode_d2_fn multi_send_robot_explode_d2,
    cd_effect_start_robot_death_sequence_fn start_robot_death_sequence,
    cd_effect_special_reactor_stuff_fn special_reactor_stuff,
    cd_effect_explode_object_delay_fn explode_object_delay);

/* D2 collide / damage: returns new_shields and return value.
   Effect callbacks are invoked during execution via OCaml algebraic effects. */
void cd_ox_apply_damage_to_robot_d2(
    int32_t flags, int32_t shields, int32_t damage,
    int is_boss, int is_companion, int is_thief, int is_death_roll, int is_kamikaze,
    int robot_id,
    int is_multiplayer, int is_final_level,
    int obj_id, int killer_objnum,
    int32_t* out_new_shields, int* out_return_value);

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

/* phys_apply_rot_d2: applies rotational whack (D2 version).
   Returns new rotvel in out_rx/ry/rz, and skip_ai_addval (amount to add to SKIP_AI_COUNT). */
void cd_ox_phys_apply_rot_d2(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass, int is_robot,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int is_thief, int is_attack_type,
    int skip_ai_count, int32_t frame_time, int p_rand,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz,
    int* out_skip_ai_addval);

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

/* do_physics_align_object: align object orientation to segment floor.
   packed: 54-int array (side normals, num_faces, orient, turnroll, floor_levelling, FrameTime)
   out_buf: 11-int array [tag, rvec(3), uvec(3), fvec(3), floor_levelling]
   tag=0: orient unchanged, tag=1: orient modified */
void cd_ox_do_physics_align_object(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* ai_frame_animation: interpolate robot joint angles toward goal.
   packed[2+9*N] input, out_buf[3*N] output: updated angles per joint */
void cd_ox_ai_frame_animation(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int out_len);

/* ai_move_relative_to_player: decide and apply AI movement relative to player.
   packed[56] input, out_buf[6] output: [vx,vy,vz, ai_evaded, danger_laser_num, prand_state] */
void cd_ox_ai_move_relative_to_player(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* ai_path_set_orient_and_vel: compute velocity and orientation for path-following robots.
   packed[27] input, out_buf[12] output: [vx,vy,vz, orient(9)] */
void cd_ox_ai_path_set_orient_and_vel(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* do_silly_animation: compute goal and delta angles for robot animation joints.
   Variable-length packed input, variable-length output. */
void cd_ox_do_silly_animation(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int out_len);

/* set_next_fire_time D1: compute next fire timing.
   Returns new_rapidfire_count and new_next_fire. */
void cd_ox_set_next_fire_time_d1(
    int32_t rapidfire_count, int32_t rapidfire_count_limit,
    int32_t firing_wait,
    int32_t* out_rapidfire_count, int32_t* out_next_fire);

/* set_next_fire_time D2: compute next fire timing (more complex).
   Returns new_rapidfire_count, new_next_fire, nf2_valid, new_next_fire2. */
void cd_ox_set_next_fire_time_d2(
    int32_t rapidfire_count, int32_t rapidfire_count_limit,
    int32_t firing_wait, int32_t firing_wait2,
    int gun_num, int weapon_type2, int behavior, int p_rand_val,
    int32_t* out_rapidfire_count, int32_t* out_next_fire,
    int* out_nf2_valid, int32_t* out_next_fire2);

/* compute_headlight_light D1: compute headlight illumination at a point.
   Returns fix light intensity. */
int32_t cd_ox_compute_headlight_light_d1(
    int32_t point_x, int32_t point_y, int32_t point_z,
    int32_t face_light, int32_t beam_brightness, int use_beam);

/* get_explosion_vclip: returns vclip index based on object type/stage.
   Callsite extracts Robot_info/Player_ship fields as scalar args. */
int cd_ox_get_explosion_vclip(
    int obj_type, int stage,
    int exp1_vclip_num, int exp2_vclip_num, int expl_vclip_num);

/* ai_behavior_to_mode D1: convert behavior enum to mode enum. */
int cd_ox_ai_behavior_to_mode_d1(int behavior);

/* ai_behavior_to_mode D2: convert behavior enum to mode enum. */
int cd_ox_ai_behavior_to_mode_d2(int behavior);

/* ai_turn_randomly D1: compute new rotvel from current rotvel.
   Returns new rotvel in out_rx/ry/rz. */
void cd_ox_ai_turn_randomly(
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz);

/* compute_headlight_light D2: compute headlight illumination at a point.
   Computes use_beam internally from player state.
   Returns fix light intensity. */
int32_t cd_ox_compute_headlight_light_d2(
    int32_t point_x, int32_t point_y, int32_t point_z,
    int32_t face_light, int32_t beam_brightness,
    int32_t player_flags, int32_t player_energy, int is_viewer);

/* compute_object_light: smooth light transitions for rendered objects.
   packed[8] in, out_buf[2] out (final_light, new_object_light). */
void cd_ox_compute_object_light(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* do_physics_drag: velocity integration with thrust and drag.
   packed[10] in, out_buf[3] out (new velocity vx, vy, vz). */
void cd_ox_do_physics_drag(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* do_homing_weapon_frame: homing missile velocity/orientation computation.
   packed[14] in, out_buf[14] out. */
void cd_ox_do_homing_weapon_frame(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* -- Clutter damage (shared D1/D2) ------------------------------------ */
typedef void (*cd_effect_explode_object_delay_clutter_fn)(int obj_id, int delay);
void cd_ox_register_clutter_effects(
    cd_effect_explode_object_delay_clutter_fn explode_object_delay);
void cd_ox_apply_damage_to_clutter(
    int32_t flags, int32_t shields, int32_t damage, int obj_id,
    int32_t* out_new_shields, int* out_return_value);

/* -- Control center damage (shared D1/D2) ----------------------------- */
typedef void (*cd_effect_show_hud_invul_message_fn)(void);
typedef void (*cd_effect_controlcen_been_hit_fn)(void);
typedef void (*cd_effect_do_controlcen_destroyed_fn)(int obj_id);
typedef void (*cd_effect_add_controlcen_score_fn)(void);
typedef void (*cd_effect_multi_send_destroy_controlcen_fn)(int obj_id, int who_id);
typedef void (*cd_effect_sound_controlcen_destroyed_fn)(int obj_id);
typedef void (*cd_effect_explode_object_delay_controlcen_fn)(int obj_id, int delay);
void cd_ox_register_controlcen_effects(
    cd_effect_show_hud_invul_message_fn show_hud_invul_message,
    cd_effect_controlcen_been_hit_fn controlcen_been_hit,
    cd_effect_do_controlcen_destroyed_fn do_controlcen_destroyed,
    cd_effect_add_controlcen_score_fn add_controlcen_score,
    cd_effect_multi_send_destroy_controlcen_fn multi_send_destroy_controlcen,
    cd_effect_sound_controlcen_destroyed_fn sound_controlcen_destroyed,
    cd_effect_explode_object_delay_controlcen_fn explode_object_delay);
void cd_ox_apply_damage_to_controlcen(
    int32_t shields, int32_t flags, int32_t damage,
    int who_is_player, int who_is_local_player,
    int who_objnum, int local_player_objnum,
    int is_multiplayer, int is_coop, int time_level_ok,
    int obj_id, int who_id,
    int32_t* out_new_shields);

/* -- Player damage D1 ------------------------------------------------- */
typedef void (*cd_effect_palette_flash_fn)(int r, int g, int b);
typedef void (*cd_effect_set_player_dead_fn)(int killer_objnum);
void cd_ox_register_player_damage_effects_d1(
    cd_effect_palette_flash_fn palette_flash,
    cd_effect_set_player_dead_fn set_player_dead);
void cd_ox_apply_damage_to_player_d1(
    int is_dead, int is_invulnerable, int is_endlevel, int is_local_player,
    int32_t player_shields, int32_t damage, int killer_objnum,
    int32_t* out_new_shields, int* out_should_be_dead);

/* -- Player damage D2 ------------------------------------------------- */
typedef void (*cd_effect_set_buddy_sorry_time_fn)(void);
void cd_ox_register_player_damage_effects_d2(
    cd_effect_palette_flash_fn palette_flash,
    cd_effect_set_player_dead_fn set_player_dead,
    cd_effect_set_buddy_sorry_time_fn set_buddy_sorry_time);
void cd_ox_apply_damage_to_player_d2(
    int is_dead, int is_invulnerable, int is_endlevel, int is_local_player,
    int32_t player_shields, int32_t damage, int killer_objnum,
    int killer_is_companion,
    int32_t* out_new_shields, int* out_should_be_dead);

/* -- maybe_kill_weapon (pure, no effects) ----------------------------- */
void cd_ox_maybe_kill_weapon_d1(
    int weapon_id, int32_t phys_flags, int32_t weapon_shields,
    int other_type, int32_t other_shields,
    int32_t* out_new_shields, int* out_should_be_dead);
void cd_ox_maybe_kill_weapon_d2(
    int weapon_id, int32_t phys_flags, int32_t weapon_shields,
    int other_type, int32_t other_shields, int is_shareware,
    int32_t* out_new_shields, int* out_should_be_dead);

/* calc_best_gun: find best control center gun to fire at player.
   packed layout: [num_guns, gun_pos(3*n), gun_dir(3*n), objpos(3)]
   Returns gun index or -1 if no good gun. */
int cd_ox_calc_best_gun(const int32_t* packed, int packed_len);

/* chase_angles: smooth angle interpolation for endlevel camera.
   Returns mask of angles at destination (bits 0,1,2 = p,b,h). */
void cd_ox_chase_angles(
    int32_t cur_p, int32_t cur_b, int32_t cur_h,
    int32_t desired_p, int32_t desired_b, int32_t desired_h,
    int32_t frame_time,
    int32_t* out_p, int32_t* out_b, int32_t* out_h, int* out_mask);

/* laser_are_related: check if two objects should be exempt from collision.
   packed: [o1_idx, o1_type, o1_id, o1_sig, o1_parent_num, o1_parent_sig, o1_creation_time,
            o2_idx, o2_type, o2_id, o2_sig, o2_parent_num, o2_parent_sig, o2_creation_time,
            game_time] = 15 ints
   Returns 1 if related (skip collision), 0 if not. */
int cd_ox_laser_are_related_d1(const int32_t* packed, int packed_len);
int cd_ox_laser_are_related_d2(const int32_t* packed, int packed_len);

/* calc_controlcen_gun_point: compute world-space gun position & direction.
   Takes gun local pos/dir, object orient (9 ints), object world pos.
   Writes world-space gun pos/dir. */
void cd_ox_calc_controlcen_gun_point(
    int32_t glpx, int32_t glpy, int32_t glpz,
    int32_t gldx, int32_t gldy, int32_t gldz,
    int32_t or1, int32_t or2, int32_t or3,
    int32_t ou1, int32_t ou2, int32_t ou3,
    int32_t of1, int32_t of2, int32_t of3,
    int32_t opx, int32_t opy, int32_t opz,
    int32_t* out_gpx, int32_t* out_gpy, int32_t* out_gpz,
    int32_t* out_gdx, int32_t* out_gdy, int32_t* out_gdz);

/* -- Additional gameseg functions ------------------------------------- */
int cd_ox_find_connect_side(
    int32_t c0, int32_t c1, int32_t c2, int32_t c3, int32_t c4, int32_t c5,
    int32_t base_seg_num);
void cd_ox_create_shortpos(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);
void cd_ox_extract_shortpos(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);
void cd_ox_create_walls_on_side(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);
int cd_ox_check_norms(
    int32_t n0x, int32_t n0y, int32_t n0z,
    int32_t n1x, int32_t n1y, int32_t n1z);
void cd_ox_create_all_vertex_lists(
    int32_t side_type, int32_t sidenum,
    int32_t* num_faces, int32_t* vertices_6);
void cd_ox_create_all_vertnum_lists(
    int32_t side_type,
    int32_t* num_faces, int32_t* vertnums_6);

/* -- AI door logic ---------------------------------------------------- */
int cd_ox_ai_door_is_openable_d1(
    int is_console_object, int robot_id, int ai_behavior,
    int wall_num, int wall_type, int wall_keys, int wall_flags);
int cd_ox_ai_door_is_openable_d2(
    int is_child, int is_console_object,
    int wall_num, int wall_type, int wall_keys, int wall_flags,
    int wall_state, int wall_clip_num, int wall_controlling_trigger,
    int wallanim_flags,
    int objp_is_null, int is_companion,
    int robot_id, int ai_behavior, int player_flags, int ailp_mode);

/* openable_doors_in_segment: scan sides for openable doors.
   D1: packed is 30 ints (6 sides × 5 fields), D2: 36 ints (6 sides × 6 fields).
   Returns side index (0-5) or -1. */
int cd_ox_openable_doors_in_segment_d1(const int32_t* packed, int packed_len);
int cd_ox_openable_doors_in_segment_d2(const int32_t* packed, int packed_len);

/* do_firing_stuff: decide firing state based on player visibility and facing.
   packed[12] input, out_buf[3] output: [new_GOAL_STATE, new_awareness_type, new_awareness_time] */
void cd_ox_do_firing_stuff(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* init_ai_object D1: initialize AI state for a single robot.
   packed[6] input, out_buf[18] output. */
void cd_ox_init_ai_object_d1(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* init_ai_object D2: initialize AI state for a single robot.
   packed[9] input, out_buf[21] output. */
void cd_ox_init_ai_object_d2(
    const int32_t* packed, int packed_len,
    int32_t* out_buf);

/* find_point_seg: find segment containing a point.
   packed layout: header(6) + n_segments × 80 ints per segment.
   Header: p.xyz, segnum(hint,-1), n_segments, doing_lighting_hack.
   Returns segment number or -1. */
int cd_ox_find_point_seg(const int32_t* packed, int packed_len);

/* find_connected_distance: BFS distance between two points via segment connectivity.
   packed layout: header(12) + n_segments × 15 ints per segment.
   Header: p0.xyz, seg0, p1.xyz, seg1, max_depth, wid_flag, n_segments, check_wid_on_adjacency.
   Per-segment: children(6), wid(6), center.xyz.
   Writes distance (fix, or -1) to out_dist, path length count to out_csd. */
void cd_ox_find_connected_distance(const int32_t* packed, int packed_len,
                                    int32_t* out_dist, int32_t* out_csd);

/* -- FVI check_trans_wall callback ------------------------------------ */
/* Callback type for pixel-level transparency check on walls.
   Called from OCaml FVI when FQ_TRANSPOINT is set.
   Args: segnum, sidenum, facenum, hit_x, hit_y, hit_z
   Returns: 1 if pixel is transparent (passable), 0 if solid */
typedef int (*cd_check_trans_wall_fn)(int segnum, int sidenum, int facenum,
                                      int32_t hit_x, int32_t hit_y, int32_t hit_z);
void cd_ox_register_check_trans_wall(cd_check_trans_wall_fn fn);

/* FVI on-demand data fetch callbacks.
   These are called from OCaml via effects to fetch segment/object data
   for only the segments/objects actually visited, instead of pre-packing all data. */
typedef void (*cd_fvi_fetch_segment_data_fn)(int segnum, int32_t* out87);
typedef void (*cd_fvi_fetch_object_data_fn)(int objnum, int32_t* out14);
typedef void (*cd_fvi_fetch_collision_table_fn)(int32_t* out256);
void cd_ox_register_fvi_data_callbacks(
    cd_fvi_fetch_segment_data_fn fetch_seg,
    cd_fvi_fetch_object_data_fn fetch_obj,
    cd_fvi_fetch_collision_table_fn fetch_ct);

/* find_vector_intersection v2: on-demand data fetching via effects.
   header is just the 18+N int FVI header (no segments/objects/collision table).
   The OCaml side fetches data via registered callbacks as needed.
   Output format is identical to cd_ox_find_vector_intersection. */
void cd_ox_find_vector_intersection_v2(const int32_t* header, int header_len,
                                        int32_t* out_buf, int* out_len);

/* object_intersects_wall v2: on-demand segment data via effects.
   header: [pnt.xyz, rad, segnum, n_segments] (6 ints). */
int cd_ox_object_intersects_wall_v2(const int32_t* header, int header_len);

/* find_homing_object_complete v2: on-demand data via effects.
   header: FVI header(18) + homing header(19) + homing per-object(n_objects*5). */
int cd_ox_find_homing_object_complete_v2(const int32_t* packed, int packed_len);

/* find_homing_object v2: on-demand data via effects. */
int cd_ox_find_homing_object_v2(const int32_t* packed, int packed_len);

/* track_track_goal v2: on-demand data via effects. */
void cd_ox_track_track_goal_v2(const int32_t* packed, int packed_len,
                                int* out_result, int* out_dot);

/* player_is_visible_from_object v2: on-demand data via effects. */
void cd_ox_player_is_visible_from_object_v2(const int32_t* packed, int packed_len, int32_t* out);

/* compute_vis_and_vec v2: on-demand data via effects. */
void cd_ox_compute_vis_and_vec_v2(int32_t* packed, int packed_len, int32_t* out);

/* -- Robot animation functions ---------------------------------------- */

/* robot_get_anim_state: look up joint positions for a gun/state combo.
   packed layout: [anim_states..., robot_joints..., n_guns, gun_num, state,
                   anim_states_len, robot_joints_len]
   out_buf: receives flat (jointnum,p,b,h) * n_joints
   out_count: receives number of joints */
void cd_ox_robot_get_anim_state(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int* out_count);

/* set_robot_state: compute updated anim_angles for a robot in a given state.
   packed layout: [anim_states..., robot_joints..., n_guns, anim_angles(30), state,
                   anim_states_len, robot_joints_len]
   out_angles_30: receives 30 ints (10 * (p,b,h)) */
void cd_ox_set_robot_state(
    const int32_t* packed, int packed_len,
    int32_t* out_angles_30);

/* robot_set_angles: build anim_states table and joint entries.
   packed layout: [n_guns, gun_submodels(8), n_models, submodel_parents(10),
                   angs(150), joint_offset] = 171 ints
   out_buf: receives [anim_states_flat..., n_new_joints, joints_flat...]
   out_len: total number of ints written to out_buf */
void cd_ox_robot_set_angles(
    const int32_t* packed, int packed_len,
    int32_t* out_buf, int* out_len);

/* -- Control center frame (do_controlcen_frame) ----------------------- */
/* Effect callback typedefs for control center frame AI */
typedef void (*cd_effect_cc_fire_weapon_fn)(int dx, int dy, int dz,
                                             int px, int py, int pz,
                                             int parent_id, int make_sound);
typedef void (*cd_effect_cc_send_controlcen_fire_fn)(int dx, int dy, int dz,
                                                      int gun_num, int obj_id);
typedef void (*cd_effect_cc_make_random_vector_fn)(int32_t* rx, int32_t* ry, int32_t* rz);
typedef int  (*cd_effect_cc_p_rand_fn)(void);

void cd_ox_register_controlcen_frame_effects(
    cd_effect_cc_fire_weapon_fn fire_weapon,
    cd_effect_cc_send_controlcen_fire_fn send_controlcen_fire,
    cd_effect_cc_make_random_vector_fn make_random_vector,
    cd_effect_cc_p_rand_fn p_rand);

/* D1: do_controlcen_frame.
   gun_pos_flat/gun_dir_flat are n_guns*3 int arrays.
   result[3] receives: [cc_been_hit, cc_player_seen, cc_next_fire_time] */
void cd_ox_do_controlcen_frame_d1(
    int32_t cc_been_hit, int32_t cc_player_seen, int32_t cc_next_fire_time,
    int n_guns, const int32_t* gun_pos_flat, const int32_t* gun_dir_flat,
    int32_t frame_count, int32_t frame_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t player_flags, int player_is_dead,
    int32_t game_time, int32_t player_time_of_death,
    int32_t obj_x, int32_t obj_y, int32_t obj_z, int32_t obj_segnum,
    int32_t console_x, int32_t console_y, int32_t console_z,
    int32_t believed_x, int32_t believed_y, int32_t believed_z,
    int has_children, int obj_id, int player_objnum,
    int32_t* result);

/* D2: do_controlcen_frame.
   result[4] receives: [cc_been_hit, cc_player_seen, cc_next_fire_time, last_time_cc_vis_check] */
void cd_ox_do_controlcen_frame_d2(
    int32_t cc_been_hit, int32_t cc_player_seen, int32_t cc_next_fire_time,
    int n_guns, const int32_t* gun_pos_flat, const int32_t* gun_dir_flat,
    int32_t frame_count, int32_t frame_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t player_flags, int player_is_dead,
    int32_t game_time, int32_t player_time_of_death,
    int32_t obj_x, int32_t obj_y, int32_t obj_z, int32_t obj_segnum,
    int32_t console_x, int32_t console_y, int32_t console_z,
    int32_t believed_x, int32_t believed_y, int32_t believed_z,
    int has_children, int obj_id, int player_objnum,
    int32_t current_level_num, int32_t last_time_cc_vis_check,
    int32_t* result);

/* -- Weapon decision logic -------------------------------------------- */
/* player_has_weapon: check if player has weapon+energy+ammo.
   Returns bitmask: HAS_WEAPON_FLAG=1, HAS_ENERGY_FLAG=2, HAS_AMMO_FLAG=4. */
int cd_ox_player_has_weapon_d1(
    int weapon_flags, int32_t ammo, int32_t energy,
    int32_t ammo_usage, int32_t energy_usage);
int cd_ox_player_has_weapon_d2(
    int weapon_flags, int32_t ammo, int32_t energy,
    int32_t ammo_usage, int32_t energy_usage,
    int is_gauss, int32_t vulcan_ammo,
    int is_omega, int32_t omega_charge);

/* POrderList / SOrderList: search weapon order array for priority index.
   order points to 11-element uint8_t array (MAX_PRIMARY/SECONDARY_WEAPONS + 1). */
int cd_ox_p_order_list(const uint8_t* order, int num);
int cd_ox_s_order_list(const uint8_t* order, int num);

/* -- AI frame logic --------------------------------------------------- */

/* Effect function pointer types for do_ai_frame */
typedef int  (*cd_effect_af_multiplayer_awareness_fn)(int agitation);
typedef void (*cd_effect_af_robot_hit_attack_fn)(void);
typedef void (*cd_effect_af_fire_laser_fn)(int gpx, int gpy, int gpz,
                                            int gun_num,
                                            int fpx, int fpy, int fpz);
typedef void (*cd_effect_af_calc_gun_point_fn)(int gun_num,
                                                int32_t* gx, int32_t* gy, int32_t* gz);
typedef void (*cd_effect_af_create_path_to_player_fn)(int max_length, int safety_flag);
typedef void (*cd_effect_af_create_path_to_station_fn)(int max_time);
typedef void (*cd_effect_af_create_n_segment_path_fn)(int length, int avoid_seg);
typedef void (*cd_effect_af_create_n_segment_path_to_door_fn)(int length, int avoid_seg);
typedef void (*cd_effect_af_attempt_to_resume_path_fn)(void);
typedef void (*cd_effect_af_ai_follow_path_fn)(int vis, int prev_vis,
                                                int vtpx, int vtpy, int vtpz);
typedef void (*cd_effect_af_move_towards_segment_center_fn)(void);
typedef void (*cd_effect_af_compute_vis_and_vec_fn)(int gpx, int gpy, int gpz,
                                                     int32_t* pv, int32_t* vtpx,
                                                     int32_t* vtpy, int32_t* vtpz,
                                                     int32_t* sound_flag);
typedef void (*cd_effect_af_multi_send_robot_position_fn)(int flag);
typedef void (*cd_effect_af_do_boss_stuff_fn)(int pv);
typedef int  (*cd_effect_af_p_rand_fn)(void);
typedef void (*cd_effect_af_make_random_vector_fn)(int32_t* rx, int32_t* ry, int32_t* rz);
typedef int  (*cd_effect_af_object_to_object_visibility_fn)(void);
typedef void (*cd_effect_af_do_snipe_frame_fn)(int dist, int vis,
                                                int vtpx, int vtpy, int vtpz,
                                                int mode);
typedef int (*cd_effect_af_do_escort_frame_fn)(int dist, int vis);  /* returns updated mode */
typedef void (*cd_effect_af_do_thief_frame_fn)(int dist, int vis,
                                                int vtpx, int vtpy, int vtpz,
                                                int pat, int pat_time);
typedef int  (*cd_effect_af_do_any_robot_dying_frame_fn)(void);
typedef void (*cd_effect_af_make_nearby_robot_snipe_fn)(void);
typedef void (*cd_effect_af_move_away_from_player_fn)(void);
typedef void (*cd_effect_af_invalidate_escort_goal_fn)(void);
typedef void (*cd_effect_af_laser_create_new_easy_fn)(int fvx, int fvy, int fvz,
                                                       int fpx, int fpy, int fpz,
                                                       int objnum, int weapon_id);
/* Do_companion_extras: danger laser evasion + flare firing for companion.
   Returns updated next_fire. */
typedef int (*cd_effect_af_do_companion_extras_fn)(int dist, int vis,
                                                    int vtpx, int vtpy, int vtpz,
                                                    int mode);
/* Do_thief_extras: flare firing for thief.
   Returns updated next_fire. */
typedef int (*cd_effect_af_do_thief_extras_fn)(int dist, int vis,
                                                int vtpx, int vtpy, int vtpz);

void cd_ox_register_ai_frame_effects(
    cd_effect_af_multiplayer_awareness_fn multiplayer_awareness,
    cd_effect_af_robot_hit_attack_fn robot_hit_attack,
    cd_effect_af_fire_laser_fn fire_laser,
    cd_effect_af_calc_gun_point_fn calc_gun_point,
    cd_effect_af_create_path_to_player_fn create_path_to_player,
    cd_effect_af_create_path_to_station_fn create_path_to_station,
    cd_effect_af_create_n_segment_path_fn create_n_segment_path,
    cd_effect_af_create_n_segment_path_to_door_fn create_n_segment_path_to_door,
    cd_effect_af_attempt_to_resume_path_fn attempt_to_resume_path,
    cd_effect_af_ai_follow_path_fn ai_follow_path,
    cd_effect_af_move_towards_segment_center_fn move_towards_segment_center,
    cd_effect_af_compute_vis_and_vec_fn compute_vis_and_vec,
    cd_effect_af_multi_send_robot_position_fn multi_send_robot_position,
    cd_effect_af_do_boss_stuff_fn do_boss_stuff,
    cd_effect_af_p_rand_fn p_rand,
    cd_effect_af_make_random_vector_fn make_random_vector,
    cd_effect_af_object_to_object_visibility_fn object_to_object_visibility,
    cd_effect_af_do_snipe_frame_fn do_snipe_frame,
    cd_effect_af_do_escort_frame_fn do_escort_frame,
    cd_effect_af_do_thief_frame_fn do_thief_frame,
    cd_effect_af_do_any_robot_dying_frame_fn do_any_robot_dying_frame,
    cd_effect_af_make_nearby_robot_snipe_fn make_nearby_robot_snipe,
    cd_effect_af_move_away_from_player_fn move_away_from_player,
    cd_effect_af_invalidate_escort_goal_fn invalidate_escort_goal,
    cd_effect_af_laser_create_new_easy_fn laser_create_new_easy,
    cd_effect_af_do_companion_extras_fn do_companion_extras,
    cd_effect_af_do_thief_extras_fn do_thief_extras);

/* Read-back for path state after effect callbacks.
   Packs 10 ints: hide_index, path_length, cur_path_index, path_dir,
   mode, goal_segment, time_player_seen, player_awareness_type,
   behavior, hide_segment */
typedef void (*cd_effect_af_read_path_state_fn)(int32_t* out);  /* out[11] */

void cd_ox_register_read_path_state(cd_effect_af_read_path_state_fn fn);

/* Read-back for fire timer state after Ai_fire_laser_at_player effect.
   Packs 3 ints: next_fire, next_fire2, rapidfire_count */
typedef void (*cd_effect_af_read_fire_state_fn)(int32_t* out);  /* out[3] */

void cd_ox_register_read_fire_state(cd_effect_af_read_fire_state_fn fn);
void cd_ox_register_write_fire_timers(void (*fn)(int32_t, int32_t));

/* openable_doors_in_segment effect: returns side index or -1 */
void cd_ox_register_af_openable_doors(int (*fn)(void));

/* Pathfinding effects for OCaml-authoritative path creation */
/* Fetch wall data for ai_door_is_openable: (segnum, sidenum) -> 8 ints */
typedef void (*cd_fetch_wall_data_fn)(int segnum, int sidenum, int32_t* out);
/* FVI query for path: 9 ints in -> 5 ints out */
typedef void (*cd_path_fvi_query_fn)(const int32_t* params, int32_t* out);
/* Object relink: set object pos and relink to segment */
typedef void (*cd_path_obj_relink_fn)(int objnum, int32_t x, int32_t y, int32_t z, int segnum);
/* Find object seg: returns segnum or -1 */
typedef int (*cd_path_find_object_seg_fn)(int32_t x, int32_t y, int32_t z);

void cd_ox_register_path_callbacks(
    cd_fetch_wall_data_fn fetch_wall_data,
    cd_path_fvi_query_fn path_fvi_query,
    cd_path_obj_relink_fn path_obj_relink,
    cd_path_find_object_seg_fn path_find_object_seg);

/* D1: do_ai_frame.
   ai_state is packed array (~43 ints), rinfo is packed array (~29 ints).
   result receives updated ai_state. */
void cd_ox_do_ai_frame_d1(
    const int32_t* ai_state, int ai_state_len,
    const int32_t* rinfo, int rinfo_len,
    int32_t frame_time, int32_t frame_count, int32_t game_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t overall_agitation, int player_is_dead, int player_exploded,
    int32_t player_flags,
    int32_t obj_x, int32_t obj_y, int32_t obj_z,
    int32_t obj_segnum, int32_t obj_size, int32_t obj_id, int objnum,
    int32_t console_x, int32_t console_y, int32_t console_z, int32_t console_size,
    int32_t believed_x, int32_t believed_y, int32_t believed_z, int32_t believed_seg,
    const int32_t* orient, const int32_t* gun_point_in, int32_t seg_special,
    const int32_t* cloak_last_pos, int32_t cloak_last_time, int32_t ai_evaded_in,
    int32_t velocity_x, int32_t velocity_y, int32_t velocity_z,
    int32_t* result);

/* D2: do_ai_frame.
   Same as D1 plus extra D2 parameters. */
void cd_ox_do_ai_frame_d2(
    const int32_t* ai_state, int ai_state_len,
    const int32_t* rinfo, int rinfo_len,
    int32_t frame_time, int32_t frame_count, int32_t game_time,
    int32_t game_mode, int32_t difficulty_level,
    int32_t overall_agitation, int player_is_dead, int player_exploded,
    int32_t player_flags,
    int32_t obj_x, int32_t obj_y, int32_t obj_z,
    int32_t obj_segnum, int32_t obj_size, int32_t obj_id, int objnum,
    int32_t console_x, int32_t console_y, int32_t console_z, int32_t console_size,
    int32_t believed_x, int32_t believed_y, int32_t believed_z, int32_t believed_seg,
    const int32_t* orient, const int32_t* gun_point_in, int32_t seg_special,
    const int32_t* cloak_last_pos, int32_t cloak_last_time, int32_t ai_evaded_in,
    int animation_enabled, int32_t current_level_num, int32_t last_missile_camera,
    int robots_kill_robots_cheat, int32_t boss_dying_start_time,
    int32_t phys_flags_in, const int32_t* rotthrust_in,
    int32_t dist_to_last_fired_upon, int32_t fire_at_nearby_threshold,
    int32_t seg_station_enabled,
    int32_t console_segnum,
    int32_t velocity_x, int32_t velocity_y, int32_t velocity_z,
    int32_t* result);

/* -- Physics sim logic ------------------------------------------------ */

/* Effect function pointer types for do_physics_sim */
typedef void (*cd_effect_ps_find_vector_intersection_fn)(
    const int32_t* query, int query_len, int32_t* result, int* result_len);
typedef int  (*cd_effect_ps_collide_object_with_wall_fn)(
    int hit_speed, int wall_seg, int wall_side,
    int hit_px, int hit_py, int hit_pz, int obj_flags);
typedef int  (*cd_effect_ps_scrape_object_on_wall_fn)(
    int wall_seg, int wall_side, int hit_px, int hit_py, int hit_pz);
typedef void (*cd_effect_ps_collide_two_objects_fn)(
    int hit_objnum, int pos_hit_x, int pos_hit_y, int pos_hit_z,
    int32_t* obj_flags_out, int32_t* new_vx, int32_t* new_vy, int32_t* new_vz);
typedef void (*cd_effect_ps_obj_relink_fn)(int objnum, int new_seg);
typedef int  (*cd_effect_ps_find_object_seg_fn)(int objnum);
typedef void (*cd_effect_ps_update_object_seg_fn)(int objnum);
typedef int  (*cd_effect_ps_find_point_seg_fn)(int px, int py, int pz, int seg);
typedef int  (*cd_effect_ps_get_seg_masks_fn)(int px, int py, int pz, int seg);
typedef void (*cd_effect_ps_compute_segment_center_fn)(int seg,
                                                        int32_t* cx, int32_t* cy, int32_t* cz);
typedef void (*cd_effect_ps_add_stuck_object_fn)(int wall_seg, int wall_side);
typedef int  (*cd_effect_ps_find_connect_side_fn)(int seg1, int seg2);
typedef void (*cd_effect_ps_fetch_doorway_info_fn)(int seg, int side, int32_t* out);
typedef void (*cd_effect_ps_create_abs_vertex_lists_and_dist_fn)(
    int seg, int side, int spx, int spy, int spz,
    int32_t* dist, int32_t* nx, int32_t* ny, int32_t* nz);
typedef int  (*cd_effect_ps_tmap_is_force_field_fn)(int seg, int side);
typedef void (*cd_effect_ps_vm_vector_2_matrix_orient_fn)(
    int vx, int vy, int vz, int ux, int uy, int uz,
    int32_t* out);

void cd_ox_register_physics_sim_effects(
    cd_effect_ps_find_vector_intersection_fn find_vector_intersection,
    cd_effect_ps_collide_object_with_wall_fn collide_object_with_wall,
    cd_effect_ps_scrape_object_on_wall_fn scrape_object_on_wall,
    cd_effect_ps_collide_two_objects_fn collide_two_objects,
    cd_effect_ps_obj_relink_fn obj_relink,
    cd_effect_ps_find_object_seg_fn find_object_seg,
    cd_effect_ps_update_object_seg_fn update_object_seg,
    cd_effect_ps_find_point_seg_fn find_point_seg,
    cd_effect_ps_get_seg_masks_fn get_seg_masks,
    cd_effect_ps_compute_segment_center_fn compute_segment_center,
    cd_effect_ps_add_stuck_object_fn add_stuck_object,
    cd_effect_ps_find_connect_side_fn find_connect_side,
    cd_effect_ps_fetch_doorway_info_fn fetch_doorway_info,
    cd_effect_ps_create_abs_vertex_lists_and_dist_fn create_abs_vertex_lists_and_dist,
    cd_effect_ps_tmap_is_force_field_fn tmap_is_force_field,
    cd_effect_ps_vm_vector_2_matrix_orient_fn vm_vector_2_matrix_orient);

/* -- Collision handler effects (called from OCaml collision dispatch) ------ */

/* Fetch collision data: packs both objects' fields into int array.
   out[] must have at least 48 elements. */
typedef void (*cd_effect_ps_fetch_collision_data_fn)(
    int hit_objnum, int32_t* out, int out_len);

/* Write back hit object state after OCaml collision handler.
   packed: [objnum, vel_x, vel_y, vel_z, rotvel_x, rotvel_y, rotvel_z, shields, flags] */
typedef void (*cd_effect_ps_write_back_hit_object_fn)(
    const int32_t* packed, int len);

/* Write back this-object (ps_obj) shields+flags after OCaml collision handler. */
typedef void (*cd_effect_ps_write_back_this_object_fn)(
    int32_t shields, int32_t flags);

/* digi_link_sound_to_pos(sound_id, seg, 0, &pos, 0, F1_0) */
typedef void (*cd_effect_ps_play_collision_sound_fn)(
    int sound_id, int seg, int px, int py, int pz);

/* add_points_to_score(score) */
typedef void (*cd_effect_ps_add_points_to_score_fn)(int score);

/* create_awareness_event / ai_do_cloak_stuff */
typedef void (*cd_effect_ps_create_awareness_event_fn)(int objnum, int type);

/* apply_damage_to_player(player_obj, killer_obj, damage) — calls C function directly */
typedef void (*cd_effect_ps_apply_damage_to_player_fn)(
    int player_objnum, int killer_objnum, int32_t damage);

void cd_ox_register_collision_effects(
    cd_effect_ps_fetch_collision_data_fn fetch_collision_data,
    cd_effect_ps_write_back_hit_object_fn write_back_hit_object,
    cd_effect_ps_write_back_this_object_fn write_back_this_object,
    cd_effect_ps_play_collision_sound_fn play_collision_sound,
    cd_effect_ps_add_points_to_score_fn add_points_to_score,
    cd_effect_ps_create_awareness_event_fn create_awareness_event,
    cd_effect_ps_apply_damage_to_player_fn apply_damage_to_player);

/* Phase 2 collision effect typedefs */
typedef int (*cd_effect_ps_create_object_explosion_fn)(
    int seg, int px, int py, int pz, int size, int vclip);
typedef void (*cd_effect_ps_explode_badass_weapon_fn)(int weapon_objnum);
typedef void (*cd_effect_ps_obj_attach_fn)(int parent, int child);
typedef void (*cd_effect_ps_do_ai_robot_hit_fn)(int robot, int awareness);
typedef void (*cd_effect_ps_do_ai_robot_hit_attack_fn)(
    int robot, int player, int px, int py, int pz);
typedef void (*cd_effect_ps_ai_do_cloak_stuff_fn)(void);
typedef void (*cd_effect_ps_hostage_rescue_fn)(int hostage_id);
typedef void (*cd_effect_ps_multi_robot_request_change_fn)(int robot, int player_id);
typedef void (*cd_effect_ps_multi_send_remobj_fn)(int objnum);
typedef void (*cd_effect_ps_multi_send_play_sound_fn)(int sound_id, int volume);
typedef void (*cd_effect_ps_set_weapon_last_hitobj_fn)(int weapon, int hit_objnum);
typedef void (*cd_effect_ps_set_boss_hit_this_frame_fn)(void);
typedef void (*cd_effect_ps_set_weapon_flags_fn)(int weapon, int flags);
typedef void (*cd_effect_ps_set_weapon_lifeleft_fn)(int weapon, int lifeleft);
typedef void (*cd_effect_ps_detect_escort_goal_fn)(int objnum);
typedef void (*cd_effect_ps_attempt_to_steal_fn)(int robot, int player_id);
typedef void (*cd_effect_ps_create_smart_children_fn)(int robot, int num);
typedef void (*cd_effect_ps_smega_rock_stuff_fn)(void);
typedef void (*cd_effect_ps_set_robot_gauss_spin_fn)(int robot);
typedef void (*cd_effect_ps_set_bump_skip_ai_count_fn)(int robot);
typedef int (*cd_effect_ps_do_boss_weapon_collision_fn)(int robot, int weapon);
typedef void (*cd_effect_ps_create_badass_explosion_for_boss_fn)(
    int weapon, int seg, int px, int py, int pz);

void cd_ox_register_collision_effects_phase2(
    cd_effect_ps_create_object_explosion_fn create_object_explosion,
    cd_effect_ps_explode_badass_weapon_fn explode_badass_weapon,
    cd_effect_ps_obj_attach_fn obj_attach,
    cd_effect_ps_do_ai_robot_hit_fn do_ai_robot_hit,
    cd_effect_ps_do_ai_robot_hit_attack_fn do_ai_robot_hit_attack,
    cd_effect_ps_ai_do_cloak_stuff_fn ai_do_cloak_stuff,
    cd_effect_ps_hostage_rescue_fn hostage_rescue,
    cd_effect_ps_multi_robot_request_change_fn multi_robot_request_change,
    cd_effect_ps_multi_send_remobj_fn multi_send_remobj,
    cd_effect_ps_multi_send_play_sound_fn multi_send_play_sound,
    cd_effect_ps_set_weapon_last_hitobj_fn set_weapon_last_hitobj,
    cd_effect_ps_set_boss_hit_this_frame_fn set_boss_hit_this_frame,
    cd_effect_ps_set_weapon_flags_fn set_weapon_flags,
    cd_effect_ps_set_weapon_lifeleft_fn set_weapon_lifeleft,
    cd_effect_ps_detect_escort_goal_fn detect_escort_goal,
    cd_effect_ps_attempt_to_steal_fn attempt_to_steal,
    cd_effect_ps_create_smart_children_fn create_smart_children,
    cd_effect_ps_smega_rock_stuff_fn smega_rock_stuff,
    cd_effect_ps_set_robot_gauss_spin_fn set_robot_gauss_spin,
    cd_effect_ps_do_boss_weapon_collision_fn do_boss_weapon_collision,
    cd_effect_ps_create_badass_explosion_for_boss_fn create_badass_explosion_for_boss);

void cd_ox_register_collision_effects_phase3(
    cd_effect_ps_set_bump_skip_ai_count_fn set_bump_skip_ai_count);

/* D1: do_physics_sim.
   result[25] receives: [pos xyz, vel xyz, orient 9, segnum, obj_flags,
   phys_flags, turnroll, rotvel xyz, retry_count, n_phys_segs, needs_levelling] */
void cd_ox_do_physics_sim_d1(
    int32_t pos_x, int32_t pos_y, int32_t pos_z,
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t thrust_x, int32_t thrust_y, int32_t thrust_z,
    const int32_t* orient,
    int32_t rotvel_x, int32_t rotvel_y, int32_t rotvel_z,
    int32_t rotthrust_x, int32_t rotthrust_y, int32_t rotthrust_z,
    int32_t size, int32_t mass, int32_t drag,
    int32_t phys_flags, int32_t obj_flags, int obj_type, int obj_id,
    int32_t obj_segnum, int objnum, int32_t turnroll,
    int32_t last_pos_x, int32_t last_pos_y, int32_t last_pos_z,
    int32_t frame_time, int32_t physics_cheat_flag,
    int32_t* result);

/* D2: do_physics_sim.
   Same as D1 plus D2 extras. */
void cd_ox_do_physics_sim_d2(
    int32_t pos_x, int32_t pos_y, int32_t pos_z,
    int32_t vel_x, int32_t vel_y, int32_t vel_z,
    int32_t thrust_x, int32_t thrust_y, int32_t thrust_z,
    const int32_t* orient,
    int32_t rotvel_x, int32_t rotvel_y, int32_t rotvel_z,
    int32_t rotthrust_x, int32_t rotthrust_y, int32_t rotthrust_z,
    int32_t size, int32_t mass, int32_t drag,
    int32_t phys_flags, int32_t obj_flags, int obj_type, int obj_id,
    int32_t obj_segnum, int objnum, int32_t turnroll,
    int32_t last_pos_x, int32_t last_pos_y, int32_t last_pos_z,
    int32_t orient_uvec_x, int32_t orient_uvec_y, int32_t orient_uvec_z,
    int32_t seg_special,
    int32_t frame_time, int32_t physics_cheat_flag,
    int32_t* result);

/* init_ai_for_ship: initialize AI cloak info for new ship.
   result must have room for 40 ints (8 entries × 5 fields each:
   last_time, last_segment, pos_x, pos_y, pos_z). */
void cd_ox_init_ai_for_ship(
    int32_t game_time, int32_t segnum,
    int32_t pos_x, int32_t pos_y, int32_t pos_z,
    int32_t* result);

/* init_robots_for_level D1: result must have room for 1 int [overall_agitation]. */
void cd_ox_init_robots_for_level_d1(int32_t* result);

/* init_robots_for_level D2: result must have room for 6 ints
   [overall_agitation, final_boss_is_dead, buddy_objnum,
    buddy_allowed_to_talk, boss_invulnerable_dot, boss_dying_start_time]. */
void cd_ox_init_robots_for_level_d2(int difficulty_level, int32_t* result);

/* -- Escort/thief logic ----------------------------------------------- */
/* init_thief_for_level: initialize stolen items for a new level (D2 only).
   result must have room for 11 ints: [stolen_items[0..9], stolen_item_index]. */
void cd_ox_init_thief_for_level(int game_mode, int32_t* result);

/* create_bfs_list: BFS of reachable segments from start_seg (D2 only).
   buddy_ailp_mode = Ai_local_info[Buddy_objnum].mode
   player_flags = Players[Player_num].flags
   bfs_list must have room for max_segs shorts.
   Returns the number of segments found. */
int cd_ox_create_bfs_list(int start_seg, int max_segs, int buddy_ailp_mode,
                          int player_flags, short* bfs_list);

/* -- Gameseq logic ---------------------------------------------------- */
/* bash_to_shield: Replace powerup object with shield boost (D2 only). */
void cd_ox_bash_to_shield(int objnum);

/* clear_stuck_objects: Clear all stuck objects (D2 only). */
void cd_ox_clear_stuck_objects(void);

/* filter_objects_from_level: Remove flag powerups from single-player levels (D2 only). */
void cd_ox_filter_objects_from_level(void);
typedef void (*cd_effect_gs_fetch_filter_objects_data_fn)(int32_t* out, int* out_len);
void cd_ox_register_filter_objects_effects(
    cd_effect_gs_fetch_filter_objects_data_fn fetch_data);

/* Gameseq effect registration */
typedef void (*cd_effect_gs_fetch_bash_to_shield_data_fn)(int objnum, int32_t* out);
typedef void (*cd_effect_gs_write_bash_to_shield_fn)(const int32_t* packed, int len);
typedef void (*cd_effect_gs_fetch_stuck_objects_data_fn)(int32_t* out, int* out_len);
typedef void (*cd_effect_gs_write_clear_stuck_objects_fn)(const int32_t* packed, int len);
void cd_ox_register_gameseq_effects(
    cd_effect_gs_fetch_bash_to_shield_data_fn fetch_bash_data,
    cd_effect_gs_write_bash_to_shield_fn write_bash_data);
void cd_ox_register_stuck_objects_effects(
    cd_effect_gs_fetch_stuck_objects_data_fn fetch_stuck_data,
    cd_effect_gs_write_clear_stuck_objects_fn write_clear_stuck);

/* init_ammo_and_energy: Ensure minimum energy/shields/ammo for new level. */
void cd_ox_init_ammo_and_energy(void);

/* init_ammo_and_energy effect registration */
typedef void (*cd_effect_gs_fetch_init_ammo_energy_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_init_ammo_energy_fn)(const int32_t* packed, int len);
void cd_ox_register_init_ammo_energy_effects(
    cd_effect_gs_fetch_init_ammo_energy_data_fn fetch_data,
    cd_effect_gs_write_init_ammo_energy_fn write_data);

/* update_player_stats: Update time_level/time_total, rolling over hours. */
void cd_ox_update_player_stats(void);

/* update_player_stats effect registration */
typedef void (*cd_effect_gs_fetch_update_player_stats_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_update_player_stats_fn)(const int32_t* packed, int len);
void cd_ox_register_update_player_stats_effects(
    cd_effect_gs_fetch_update_player_stats_data_fn fetch_data,
    cd_effect_gs_write_update_player_stats_fn write_data);

/* special_reset_objects: Rebuild free object list and Highest_object_index. */
void cd_ox_special_reset_objects(void);

/* special_reset_objects effect registration */
typedef void (*cd_effect_gs_fetch_special_reset_objects_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_special_reset_objects_fn)(const int32_t* packed, int len);
void cd_ox_register_special_reset_objects_effects(
    cd_effect_gs_fetch_special_reset_objects_data_fn fetch_data,
    cd_effect_gs_write_special_reset_objects_fn write_data);

/* free_object_slots: Scan object list, freeing down to num_used objects. */
int cd_ox_free_object_slots(int num_used);
void cd_ox_set_free_object_slots_retval(int rv);

/* free_object_slots effect registration */
typedef void (*cd_effect_gs_fetch_free_object_slots_data_fn)(int32_t* out, int* out_len);
typedef void (*cd_effect_gs_write_free_object_slots_fn)(const int32_t* packed, int len);
void cd_ox_register_free_object_slots_effects(
    cd_effect_gs_fetch_free_object_slots_data_fn fetch_data,
    cd_effect_gs_write_free_object_slots_fn write_data);

/* init_player_object: Set up Player_num & ConsoleObject. */
void cd_ox_init_player_object(void);

/* init_player_object effect registration */
typedef void (*cd_effect_gs_fetch_init_player_object_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_init_player_object_fn)(const int32_t* packed, int len);
void cd_ox_register_init_player_object_effects(
    cd_effect_gs_fetch_init_player_object_data_fn fetch_data,
    cd_effect_gs_write_init_player_object_fn write_data);

/* verify_console_object: Verify and set ConsoleObject pointer. */
void cd_ox_verify_console_object(void);

/* verify_console_object effect registration */
typedef void (*cd_effect_gs_fetch_verify_console_object_data_fn)(int32_t* out);
typedef void (*cd_effect_gs_write_verify_console_object_fn)(int objnum);
void cd_ox_register_verify_console_object_effects(
    cd_effect_gs_fetch_verify_console_object_data_fn fetch_data,
    cd_effect_gs_write_verify_console_object_fn write_data);

/* copy_defaults_to_robot: Set robot shields from Robot_info defaults. */
void cd_ox_copy_defaults_to_robot(int objnum);

/* copy_defaults_to_robot_all: Set shields for all robot objects. */
void cd_ox_copy_defaults_to_robot_all(void);

/* copy_defaults_to_robot effect registration */
typedef void (*cd_effect_gs_fetch_copy_defaults_to_robot_data_fn)(int objnum, int32_t* out);
typedef void (*cd_effect_gs_write_copy_defaults_to_robot_fn)(const int32_t* packed, int len);
void cd_ox_register_copy_defaults_to_robot_effects(
    cd_effect_gs_fetch_copy_defaults_to_robot_data_fn fetch_data,
    cd_effect_gs_write_copy_defaults_to_robot_fn write_data);

/* -- Switch logic ---------------------------------------------------- */
/* do_lock_doors: Lock all doors linked to a trigger (D2 only). */
void cd_ox_do_lock_doors(int trigger_num);
/* do_unlock_doors: Unlock all doors linked to a trigger (D2 only). */
void cd_ox_do_unlock_doors(int trigger_num);
/* door_is_wall_switched: Return trigger number if wall is switch-controlled, else -1. */
int cd_ox_door_is_wall_switched(int wall_num);

/* flag_wall_switched_doors: Mark all wall-switched doors (D2 only). */
void cd_ox_flag_wall_switched_doors(void);
/* do_il_on: Turn on illusion walls for all links of a trigger. */
void cd_ox_do_il_on(int trigger_num);

/* Switch effect registration */
typedef void (*cd_effect_sw_fetch_trigger_links_fn)(int trigger_num, int32_t* out, int* out_len);
typedef void (*cd_effect_sw_fetch_trigger_seg_sides_fn)(int trigger_num, int32_t* out, int* out_len);
typedef void (*cd_effect_sw_lock_wall_door_fn)(int wall_num);
typedef void (*cd_effect_sw_unlock_wall_door_fn)(int wall_num);
typedef int (*cd_effect_sw_get_num_triggers_fn)(void);
typedef int (*cd_effect_sw_get_num_walls_fn)(void);
typedef void (*cd_effect_sw_set_wall_flag_wall_switch_fn)(int wall_num);
void cd_ox_register_switch_effects(
    cd_effect_sw_fetch_trigger_links_fn fetch_links,
    cd_effect_sw_lock_wall_door_fn lock_door,
    cd_effect_sw_unlock_wall_door_fn unlock_door,
    cd_effect_sw_get_num_triggers_fn get_num_triggers,
    cd_effect_sw_get_num_walls_fn get_num_walls,
    cd_effect_sw_set_wall_flag_wall_switch_fn set_wall_flag);
void cd_ox_register_switch_seg_side_effect(
    cd_effect_sw_fetch_trigger_seg_sides_fn fetch_seg_sides);

/* -- Wall logic --------------------------------------------------------- */

/* reset_walls: Tidy up Walls array for load/save purposes. */
void cd_ox_reset_walls(void);

/* Wall effect callbacks */
typedef void (*cd_effect_wall_fetch_reset_walls_info_fn)(int32_t* out);
typedef void (*cd_effect_wall_write_reset_walls_fn)(const int32_t* packed, int len);

void cd_ox_register_wall_effects(
    cd_effect_wall_fetch_reset_walls_info_fn fetch_info,
    cd_effect_wall_write_reset_walls_fn write_reset);

/* kill_stuck_objects: Door opening, kill all objects stuck in it. */
void cd_ox_kill_stuck_objects(int wallnum);

/* kill_stuck_objects effect callbacks */
typedef void (*cd_effect_wall_fetch_kill_stuck_data_fn)(int wallnum, int32_t* out);
typedef void (*cd_effect_wall_write_kill_stuck_objects_fn)(const int32_t* packed, int len);
typedef void (*cd_effect_wall_flush_fcd_cache_fn)(void);

void cd_ox_register_wall_kill_stuck_effects(
    cd_effect_wall_fetch_kill_stuck_data_fn fetch_data,
    cd_effect_wall_write_kill_stuck_objects_fn write_back,
    cd_effect_wall_flush_fcd_cache_fn flush_fcd);

/* wall_illusion_on / wall_illusion_off */
void cd_ox_wall_illusion_on(int segnum, int side);
void cd_ox_wall_illusion_off(int segnum, int side);

/* wall_illusion effect callbacks */
typedef void (*cd_effect_wall_fetch_seg_children_and_wall_nums_fn)(int segnum, int32_t* out);
typedef void (*cd_effect_wall_set_flags_fn)(int wall_num, int flags);
typedef void (*cd_effect_wall_clear_flags_fn)(int wall_num, int flags);

void cd_ox_register_wall_illusion_effects(
    cd_effect_wall_fetch_seg_children_and_wall_nums_fn fetch_seg,
    cd_effect_wall_set_flags_fn set_flags,
    cd_effect_wall_clear_flags_fn clear_flags);

/* add_awareness_event: port of C add_awareness_event to OCaml.
   out_buf[7]: [0]=result, [1]=should_store, [2..6]=event data.
   Returns result (0=filtered, 1=not filtered). */
int cd_ox_add_awareness_event(
    int atype, int obj_id, int obj_segnum,
    int obj_pos_x, int obj_pos_y, int obj_pos_z,
    int num_awareness_events, int is_d2,
    int32_t* out_buf);

/* create_awareness_event: wraps add_awareness_event with multiplayer check
   and Overall_agitation update.
   out_buf[7]: [0]=new_overall_agitation, [1]=should_store, [2..6]=event data. */
void cd_ox_create_awareness_event(
    int atype, int obj_id, int obj_segnum,
    int obj_pos_x, int obj_pos_y, int obj_pos_z,
    int num_awareness_events, int is_d2, int game_mode, int overall_agitation,
    int32_t* out_buf);

/* init_ai_frame: per-frame AI global setup.
   out_buf[6]: [0]=dist_to_last_fired_upon, [1]=should_update_believed,
   [2]=believed_seg, [3..5]=believed_pos xyz. */
void cd_ox_init_ai_frame(
    int32_t lfup_x, int32_t lfup_y, int32_t lfup_z,
    int32_t bp_x, int32_t bp_y, int32_t bp_z,
    int is_shareware, int32_t player_flags,
    int32_t console_x, int32_t console_y, int32_t console_z, int32_t console_segnum,
    int32_t afterburner_charge, int afterburner_state,
    int32_t* out_buf);

/* Object detach effects */
typedef void (*cd_obj_detach_one_fn)(int objnum);
typedef int (*cd_get_attached_obj_fn)(int objnum);
void cd_ox_register_obj_detach_effects(
    cd_obj_detach_one_fn detach_one,
    cd_get_attached_obj_fn get_attached);

/* -- Object segment search effects -------------------------------------- */
typedef int (*cd_get_seg_first_object_fn)(int segnum);
typedef int (*cd_get_obj_next_fn)(int objnum);
typedef int (*cd_get_highest_segment_index_fn)(void);
void cd_ox_register_obj_search_effects(
    cd_get_seg_first_object_fn get_seg_first_object,
    cd_get_obj_next_fn get_obj_next,
    cd_get_highest_segment_index_fn get_highest_segment_index);

/* C entry point: OCaml search_all_segments_for_object */
int cd_ox_search_all_segments_for_object(int objnum);

/* C entry point: OCaml spin_object.
   Takes spin_rate (3), orient (9), frame_time (1) = 13 args.
   Writes new orient into out_orient (9 ints).  */
void cd_ox_spin_object(
    int32_t spin_rx, int32_t spin_ry, int32_t spin_rz,
    int32_t o_rx, int32_t o_ry, int32_t o_rz,
    int32_t o_ux, int32_t o_uy, int32_t o_uz,
    int32_t o_fx, int32_t o_fy, int32_t o_fz,
    int32_t frame_time,
    int32_t* out_orient);

/* -- Morph effects ----------------------------------------------------- */

/* Fetch submodel vertices from polymodel bytecode.
   out_verts: flat array [x0,y0,z0, x1,y1,z1, ...], out_count: number of vertices */
typedef void (*cd_effect_morph_fetch_submodel_vertices_fn)(
    int model_num, int submodel_num, int32_t* out_verts, int* out_count);
void cd_ox_register_morph_effects(
    cd_effect_morph_fetch_submodel_vertices_fn fetch_verts);

/* find_min_max: compute bounding box of polymodel submodel vertices.
   Returns min/max via out_min[3] and out_max[3]. */
void cd_ox_find_min_max(int model_num, int submodel_num,
    int32_t* out_min, int32_t* out_max);

/* update_points: advance morph animation for one submodel.
   Reads morph state from morph_data, computes in OCaml, writes back. */
void cd_ox_update_points(int morph_slot, int submodel_num,
    int32_t frame_time,
    int nverts, int start_index,
    int32_t* n_morphing_points,
    int32_t* morph_times,
    int32_t* morph_vecs,     /* [nverts*3] x,y,z */
    int32_t* morph_deltas,   /* [nverts*3] x,y,z */
    int32_t* final_verts);   /* [nverts*3] x,y,z */

/* set_robot_location_info: check if robot near screen center while player fired.
   Returns 1 if danger_laser fields should be updated, 0 otherwise.
   On return=1, out_danger_num and out_danger_sig are set. */
int cd_ox_set_robot_location_info(
    int32_t player_fired_laser, int32_t obj_px, int32_t obj_py, int32_t obj_pz,
    int32_t vp_x, int32_t vp_y, int32_t vp_z,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t laser_sig,
    int32_t* out_danger_num, int32_t* out_danger_sig);

/* -- wake_up_rendered_objects (D2 only) --------------------------------- */
/* C entry point: calls OCaml wake_up_rendered_objects */
void cd_ox_wake_up_rendered_objects(int viewer_objnum, int window_num);

/* wake_up effect registration */
typedef void (*cd_effect_fetch_wake_up_context_fn)(int window_num, int32_t* out, int* out_len);
typedef int (*cd_effect_fetch_ai_local_awareness_fn)(int objnum);
typedef void (*cd_effect_apply_wake_up_fn)(const int32_t* packed, int len);
void cd_ox_register_wake_up_effects(
    cd_effect_fetch_wake_up_context_fn fetch_ctx,
    cd_effect_fetch_ai_local_awareness_fn fetch_awareness,
    cd_effect_apply_wake_up_fn apply_wake_up);

/* -- obj_allocate -------------------------------------------------------- */
/* Effect callback types */
typedef void (*cd_effect_fetch_obj_allocate_data_fn)(int32_t* out, int* out_len);
typedef void (*cd_effect_write_obj_allocate_result_fn)(const int32_t* packed, int len);
typedef void (*cd_effect_call_free_object_slots_fn)(int num_used);

void cd_ox_register_obj_allocate_effects(
    cd_effect_fetch_obj_allocate_data_fn fetch,
    cd_effect_write_obj_allocate_result_fn write,
    cd_effect_call_free_object_slots_fn call_fos);

/* C entry point: calls OCaml obj_allocate, returns objnum or -1 */
int cd_ox_obj_allocate(void);

/* -- fuelcen_create ------------------------------------------------------ */

/* C entry point: calls OCaml fuelcen_create */
void cd_ox_fuelcen_create(int segnum);

/* Fuelcen effect registration */
typedef void (*cd_effect_fc_fetch_fuelcen_create_data_fn)(int segnum, int32_t* out);
typedef void (*cd_effect_fc_write_fuelcen_create_fn)(const int32_t* packed, int len);
void cd_ox_register_fuelcen_create_effects(
    cd_effect_fc_fetch_fuelcen_create_data_fn fetch_data,
    cd_effect_fc_write_fuelcen_create_fn write_data);

/* -- matcen_create ------------------------------------------------------- */

/* C entry point: calls OCaml matcen_create */
void cd_ox_matcen_create(int segnum);

/* Matcen effect registration */
typedef void (*cd_effect_fc_fetch_matcen_create_data_fn)(int segnum, int32_t* out);
typedef void (*cd_effect_fc_write_matcen_create_fn)(const int32_t* packed, int len);
void cd_ox_register_matcen_create_effects(
    cd_effect_fc_fetch_matcen_create_data_fn fetch_data,
    cd_effect_fc_write_matcen_create_fn write_data);

/* -- check_volatile_wall ------------------------------------------------- */

typedef void (*cd_effect_cvw_apply_damage_fn)(int objnum, int damage);
typedef void (*cd_effect_cvw_palette_flash_fn)(int r, int g, int b);

void cd_ox_register_cvw_effects(
    cd_effect_cvw_apply_damage_fn apply_damage,
    cd_effect_cvw_palette_flash_fn palette_flash);

void cd_ox_check_volatile_wall(
    int obj_id, int player_num, int obj_objnum,
    int32_t tmap_damage, int tmap_water,
    int32_t frame_time, int difficulty_level, int player_invulnerable,
    int* out_apply_rotvel, int* out_ret_code,
    int32_t* out_rotvel_x, int32_t* out_rotvel_z);

#ifdef __cplusplus
}
#endif
