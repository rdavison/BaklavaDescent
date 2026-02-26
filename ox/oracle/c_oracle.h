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

typedef struct c_oracle_vec3
{
    int32_t x;
    int32_t y;
    int32_t z;
} c_oracle_vec3;

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
int32_t c_oracle_vm_vec_mag_quick(const c_oracle_vec3* v);

#ifdef __cplusplus
}
#endif
