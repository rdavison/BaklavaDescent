#include "c_oracle_curves.h"

#define F1_0 0x10000
#define ACCURACY (int32_t)(0.1 * F1_0)

extern "C" void c_oracle_create_curve(
    const c_oracle_vec3* p1, const c_oracle_vec3* p4,
    const c_oracle_vec3* r1, const c_oracle_vec3* r4,
    c_oracle_vms_equation* coeffs)
{
    coeffs->x3 = c_oracle_fixmul(2*F1_0, p1->x) - c_oracle_fixmul(2*F1_0, p4->x) + r1->x + r4->x;
    coeffs->x2 = c_oracle_fixmul(-3*F1_0, p1->x) + c_oracle_fixmul(3*F1_0, p4->x) - c_oracle_fixmul(2*F1_0, r1->x) - c_oracle_fixmul(1*F1_0, r4->x);
    coeffs->x1 = r1->x;
    coeffs->x0 = p1->x;
    coeffs->y3 = c_oracle_fixmul(2*F1_0, p1->y) - c_oracle_fixmul(2*F1_0, p4->y) + r1->y + r4->y;
    coeffs->y2 = c_oracle_fixmul(-3*F1_0, p1->y) + c_oracle_fixmul(3*F1_0, p4->y) - c_oracle_fixmul(2*F1_0, r1->y) - c_oracle_fixmul(1*F1_0, r4->y);
    coeffs->y1 = r1->y;
    coeffs->y0 = p1->y;
    coeffs->z3 = c_oracle_fixmul(2*F1_0, p1->z) - c_oracle_fixmul(2*F1_0, p4->z) + r1->z + r4->z;
    coeffs->z2 = c_oracle_fixmul(-3*F1_0, p1->z) + c_oracle_fixmul(3*F1_0, p4->z) - c_oracle_fixmul(2*F1_0, r1->z) - c_oracle_fixmul(1*F1_0, r4->z);
    coeffs->z1 = r1->z;
    coeffs->z0 = p1->z;
}

extern "C" void c_oracle_evaluate_curve(
    const c_oracle_vms_equation* coeffs, int32_t t,
    c_oracle_vec3* result)
{
    int32_t t2 = c_oracle_fixmul(t, t);
    int32_t t3 = c_oracle_fixmul(t2, t);

    result->x = c_oracle_fixmul(coeffs->x3, t3) + c_oracle_fixmul(coeffs->x2, t2) + c_oracle_fixmul(coeffs->x1, t) + coeffs->x0;
    result->y = c_oracle_fixmul(coeffs->y3, t3) + c_oracle_fixmul(coeffs->y2, t2) + c_oracle_fixmul(coeffs->y1, t) + coeffs->y0;
    result->z = c_oracle_fixmul(coeffs->z3, t3) + c_oracle_fixmul(coeffs->z2, t2) + c_oracle_fixmul(coeffs->z1, t) + coeffs->z0;
}

extern "C" int32_t c_oracle_curve_dist(
    const c_oracle_vms_equation* coeffs,
    int32_t t0, const c_oracle_vec3* p0, int32_t dist)
{
    int32_t step = (int32_t)(0.001 * F1_0); /* 65 */
    for (int32_t t = t0; t < 1 * F1_0; t += step)
    {
        c_oracle_vec3 coord;
        c_oracle_evaluate_curve(coeffs, t, &coord);
        int32_t diff = dist - c_oracle_vm_vec_dist(&coord, p0);
        if (diff < ACCURACY)
            return t;
    }
    return -1 * F1_0;
}

extern "C" void c_oracle_curve_dir(
    const c_oracle_vms_equation* coeffs, int32_t t0,
    c_oracle_vec3* dir)
{
    int32_t t2 = c_oracle_fixmul(t0, t0);

    dir->x = c_oracle_fixmul(3*F1_0, c_oracle_fixmul(coeffs->x3, t2)) + c_oracle_fixmul(2*F1_0, c_oracle_fixmul(coeffs->x2, t0)) + coeffs->x1;
    dir->y = c_oracle_fixmul(3*F1_0, c_oracle_fixmul(coeffs->y3, t2)) + c_oracle_fixmul(2*F1_0, c_oracle_fixmul(coeffs->y2, t0)) + coeffs->y1;
    dir->z = c_oracle_fixmul(3*F1_0, c_oracle_fixmul(coeffs->z3, t2)) + c_oracle_fixmul(2*F1_0, c_oracle_fixmul(coeffs->z2, t0)) + coeffs->z1;
    c_oracle_vm_vec_normalize(dir);
}
