#include "c_oracle.h"

#include "fix/fix.h"

extern "C" int32_t c_oracle_i2f(int32_t i)
{
    return i2f(i);
}

extern "C" int32_t c_oracle_f2i(int32_t f)
{
    return f2i(f);
}

extern "C" int32_t c_oracle_fixmul(int32_t a, int32_t b)
{
    return fixmul(a, b);
}

extern "C" int32_t c_oracle_fixdiv(int32_t a, int32_t b)
{
    return fixdiv(a, b);
}

extern "C" int32_t c_oracle_fixmuldiv(int32_t a, int32_t b, int32_t c)
{
    return fixmuldiv(a, b, c);
}

extern "C" void c_oracle_vm_vec_scale_add2(c_oracle_vec3* dest, const c_oracle_vec3* src, int32_t k)
{
    dest->x += fixmul(src->x, k);
    dest->y += fixmul(src->y, k);
    dest->z += fixmul(src->z, k);
}

extern "C" void c_oracle_vm_vec_scale_add(
    c_oracle_vec3* dest,
    const c_oracle_vec3* src1,
    const c_oracle_vec3* src2,
    int32_t k)
{
    dest->x = src1->x + fixmul(src2->x, k);
    dest->y = src1->y + fixmul(src2->y, k);
    dest->z = src1->z + fixmul(src2->z, k);
}

extern "C" void c_oracle_vm_vec_scale2(c_oracle_vec3* dest, int32_t n, int32_t d)
{
    if (d == 0)
    {
        return;
    }
    dest->x = fixmuldiv(dest->x, n, d);
    dest->y = fixmuldiv(dest->y, n, d);
    dest->z = fixmuldiv(dest->z, n, d);
}
