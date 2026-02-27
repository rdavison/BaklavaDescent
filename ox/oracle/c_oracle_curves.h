#pragma once

#include <stdint.h>
#include "c_oracle.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct c_oracle_vms_equation
{
    int32_t x3, x2, x1, x0;
    int32_t y3, y2, y1, y0;
    int32_t z3, z2, z1, z0;
} c_oracle_vms_equation;

void c_oracle_create_curve(
    const c_oracle_vec3* p1, const c_oracle_vec3* p4,
    const c_oracle_vec3* r1, const c_oracle_vec3* r4,
    c_oracle_vms_equation* coeffs);

void c_oracle_evaluate_curve(
    const c_oracle_vms_equation* coeffs, int32_t t,
    c_oracle_vec3* result);

int32_t c_oracle_curve_dist(
    const c_oracle_vms_equation* coeffs,
    int32_t t0, const c_oracle_vec3* p0, int32_t dist);

void c_oracle_curve_dir(
    const c_oracle_vms_equation* coeffs, int32_t t0,
    c_oracle_vec3* dir);

#ifdef __cplusplus
}
#endif
