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

#ifdef __cplusplus
}
#endif
