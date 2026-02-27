#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

int32_t c_oracle_i2f(int32_t i);
int32_t c_oracle_f2i(int32_t f);
int32_t c_oracle_fixmul(int32_t a, int32_t b);
int32_t c_oracle_fixdiv(int32_t a, int32_t b);
int32_t c_oracle_fixmuldiv(int32_t a, int32_t b, int32_t c);
int32_t c_oracle_long_sqrt(int32_t a);
int32_t c_oracle_quad_sqrt(int64_t q);
int32_t c_oracle_fixquadadjust(int64_t q);
int64_t c_oracle_fixmulaccum(int64_t q, int32_t a, int32_t b);
int32_t c_oracle_fixdivquadlong(int64_t n, int32_t d);
void c_oracle_fixquadnegate(int32_t* low, int32_t* high);
int32_t c_oracle_ufixdivquadlong(int32_t nl, int32_t nh, int32_t d);
int32_t c_oracle_fix_sqrt(int32_t a);
int32_t c_oracle_fix_isqrt(int32_t a);
void c_oracle_fix_sincos(int32_t a, int32_t* s, int32_t* c);
void c_oracle_fix_fastsincos(int32_t a, int32_t* s, int32_t* c);
int16_t c_oracle_fix_acos(int32_t v);
int16_t c_oracle_fix_asin(int32_t v);
int16_t c_oracle_fix_atan2(int32_t cosv, int32_t sinv);

typedef struct c_oracle_vec3
{
    int32_t x;
    int32_t y;
    int32_t z;
} c_oracle_vec3;

typedef struct c_oracle_ang3
{
    int16_t p;
    int16_t b;
    int16_t h;
} c_oracle_ang3;

typedef struct c_oracle_mat3
{
    c_oracle_vec3 rvec;
    c_oracle_vec3 uvec;
    c_oracle_vec3 fvec;
} c_oracle_mat3;

void c_oracle_vm_vec_scale_add2(c_oracle_vec3* dest, const c_oracle_vec3* src, int32_t k);
void c_oracle_vm_vec_scale_add(
    c_oracle_vec3* dest,
    const c_oracle_vec3* src1,
    const c_oracle_vec3* src2,
    int32_t k);
void c_oracle_vm_vec_scale2(c_oracle_vec3* dest, int32_t n, int32_t d);
void c_oracle_vm_vec_add(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1);
void c_oracle_vm_vec_sub(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1);
void c_oracle_vm_vec_add2(c_oracle_vec3* dest, const c_oracle_vec3* src);
void c_oracle_vm_vec_sub2(c_oracle_vec3* dest, const c_oracle_vec3* src);
void c_oracle_vm_vec_avg(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1);
void c_oracle_vm_vec_avg4(
    c_oracle_vec3* dest,
    const c_oracle_vec3* src0,
    const c_oracle_vec3* src1,
    const c_oracle_vec3* src2,
    const c_oracle_vec3* src3);
void c_oracle_vm_vec_copy_scale(c_oracle_vec3* dest, const c_oracle_vec3* src, int32_t k);
void c_oracle_vm_vec_scale(c_oracle_vec3* dest, int32_t k);
int32_t c_oracle_vm_vec_mag(const c_oracle_vec3* v);
int32_t c_oracle_vm_vec_dist(const c_oracle_vec3* v0, const c_oracle_vec3* v1);
int32_t c_oracle_vm_vec_mag_quick(const c_oracle_vec3* v);
int32_t c_oracle_vm_vec_dist_quick(const c_oracle_vec3* v0, const c_oracle_vec3* v1);
int32_t c_oracle_vm_vec_dotprod(const c_oracle_vec3* v0, const c_oracle_vec3* v1);
int32_t c_oracle_vm_vec_dot3(int32_t x, int32_t y, int32_t z, const c_oracle_vec3* v);
void c_oracle_vm_vec_crossprod(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1);
int32_t c_oracle_vm_vec_copy_normalize(c_oracle_vec3* dest, const c_oracle_vec3* src);
int32_t c_oracle_vm_vec_normalize(c_oracle_vec3* v);
int32_t c_oracle_vm_vec_normalized_dir(
    c_oracle_vec3* dest,
    const c_oracle_vec3* end,
    const c_oracle_vec3* start);
int32_t c_oracle_vm_vec_copy_normalize_quick(c_oracle_vec3* dest, const c_oracle_vec3* src);
int32_t c_oracle_vm_vec_normalize_quick(c_oracle_vec3* v);
int32_t c_oracle_vm_vec_normalized_dir_quick(
    c_oracle_vec3* dest,
    const c_oracle_vec3* end,
    const c_oracle_vec3* start);
void c_oracle_vm_vec_make(c_oracle_vec3* v, int32_t x, int32_t y, int32_t z);
void c_oracle_vm_angvec_make(c_oracle_ang3* v, int16_t p, int16_t b, int16_t h);
int32_t c_oracle_vm_dist_to_plane(
    const c_oracle_vec3* checkp,
    const c_oracle_vec3* norm,
    const c_oracle_vec3* planep);
void c_oracle_vm_check_vec(c_oracle_vec3* v);
void c_oracle_vm_vec_perp(
    c_oracle_vec3* dest,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    const c_oracle_vec3* p2);
void c_oracle_vm_vec_normal(
    c_oracle_vec3* dest,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    const c_oracle_vec3* p2);
int16_t c_oracle_vm_vec_delta_ang(
    const c_oracle_vec3* v0,
    const c_oracle_vec3* v1,
    const c_oracle_vec3* fvec);
int16_t c_oracle_vm_vec_delta_ang_norm(
    const c_oracle_vec3* v0,
    const c_oracle_vec3* v1,
    const c_oracle_vec3* fvec);
void c_oracle_sincos_2_matrix(
    c_oracle_mat3* dest,
    int32_t sinp,
    int32_t cosp,
    int32_t sinb,
    int32_t cosb,
    int32_t sinh,
    int32_t cosh);
void c_oracle_vm_angles_2_matrix(c_oracle_mat3* dest, const c_oracle_ang3* a);
void c_oracle_vm_vec_ang_2_matrix(c_oracle_mat3* dest, const c_oracle_vec3* v, int16_t a);
void c_oracle_vm_extract_angles_matrix(c_oracle_ang3* dest, const c_oracle_mat3* m);
void c_oracle_vm_extract_angles_vector_normalized(c_oracle_ang3* dest, const c_oracle_vec3* v);
void c_oracle_vm_extract_angles_vector(c_oracle_ang3* dest, const c_oracle_vec3* v);
void c_oracle_vm_vector_2_matrix(
    c_oracle_mat3* dest,
    const c_oracle_vec3* fvec,
    const c_oracle_vec3* uvec,
    const c_oracle_vec3* rvec);
void c_oracle_vm_vector_2_matrix_norm(
    c_oracle_mat3* dest,
    const c_oracle_vec3* fvec,
    const c_oracle_vec3* uvec,
    const c_oracle_vec3* rvec);
void c_oracle_vm_vec_rotate(c_oracle_vec3* dest, const c_oracle_vec3* src, const c_oracle_mat3* m);
void c_oracle_vm_transpose_matrix(c_oracle_mat3* m);
void c_oracle_vm_copy_transpose_matrix(c_oracle_mat3* dest, const c_oracle_mat3* src);
void c_oracle_vm_matrix_x_matrix(
    c_oracle_mat3* dest,
    const c_oracle_mat3* src0,
    const c_oracle_mat3* src1);

/* 3D pipeline functions */
uint8_t c_oracle_g3_code_point(int32_t x, int32_t y, int32_t z);
int c_oracle_checkmuldiv(int32_t* r, int32_t a, int32_t b, int32_t c);
void c_oracle_g3_rotate_point(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz, uint8_t* codes);
int c_oracle_g3_project_point(
    int32_t x, int32_t y, int32_t z,
    int32_t canv_w2, int32_t canv_h2,
    int32_t* sx, int32_t* sy);
void c_oracle_g3_rotate_delta_x(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dx, int32_t* rx, int32_t* ry, int32_t* rz);
void c_oracle_g3_rotate_delta_y(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dy, int32_t* rx, int32_t* ry, int32_t* rz);
void c_oracle_g3_rotate_delta_z(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dz, int32_t* rx, int32_t* ry, int32_t* rz);
int32_t c_oracle_g3_calc_point_depth(
    int32_t px, int32_t py, int32_t pz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t fx, int32_t fy, int32_t fz);
void c_oracle_scale_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t wsx, int32_t wsy, int32_t wsz,
    int32_t zoom,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3,
    int32_t* msx, int32_t* msy, int32_t* msz);
void c_oracle_g3_start_instance_matrix(
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
void c_oracle_g3_point_2_vec(
    int32_t sx, int32_t sy,
    int32_t canv_w2, int32_t canv_h2,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t ur1, int32_t ur2, int32_t ur3,
    int32_t uu1, int32_t uu2, int32_t uu3,
    int32_t uf1, int32_t uf2, int32_t uf3,
    int32_t* vx, int32_t* vy, int32_t* vz);

/* Drawing helpers */
void c_oracle_clip_edge(
    int32_t plane_flag,
    int32_t on_x, int32_t on_y, int32_t on_z,
    int32_t on_u, int32_t on_v, int32_t on_l, int32_t on_flags,
    int32_t off_x, int32_t off_y, int32_t off_z,
    int32_t off_u, int32_t off_v, int32_t off_l,
    int32_t* nx, int32_t* ny, int32_t* nz,
    int32_t* nu, int32_t* nv, int32_t* nl,
    int32_t* nflags, uint8_t* ncodes);
int c_oracle_g3_check_normal_facing(
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t nx, int32_t ny, int32_t nz);
void c_oracle_calc_rod_corners(
    int32_t bx, int32_t by, int32_t bz, int32_t bw,
    int32_t tx, int32_t ty, int32_t tz, int32_t tw,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t* c0x, int32_t* c0y, int32_t* c0z,
    int32_t* c1x, int32_t* c1y, int32_t* c1z,
    int32_t* c2x, int32_t* c2y, int32_t* c2z,
    int32_t* c3x, int32_t* c3y, int32_t* c3z,
    uint8_t* codes_and);
void c_oracle_clip_line(
    int32_t p0x, int32_t p0y, int32_t p0z, int32_t p0_codes,
    int32_t p1x, int32_t p1y, int32_t p1z, int32_t p1_codes,
    int32_t codes_or,
    int32_t* out_p0x, int32_t* out_p0y, int32_t* out_p0z, int32_t* out_p0_codes,
    int32_t* out_p1x, int32_t* out_p1y, int32_t* out_p1z, int32_t* out_p1_codes,
    int32_t* out_clipped);
int c_oracle_do_facing_check_computed(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z);
void c_oracle_clip_polygon(
    int32_t codes_or, int32_t codes_and,
    int nv, const int32_t* flat_in,
    int* out_nv, int32_t* flat_out,
    int32_t* out_codes_or, int32_t* out_codes_and);

#ifdef __cplusplus
}
#endif
