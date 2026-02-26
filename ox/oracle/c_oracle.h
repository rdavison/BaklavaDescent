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
int32_t c_oracle_fix_sqrt(int32_t a);

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
void c_oracle_vm_vec_perp(
    c_oracle_vec3* dest,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    const c_oracle_vec3* p2);
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
