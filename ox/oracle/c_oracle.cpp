#include "c_oracle.h"

#include <stdlib.h>

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

extern "C" void c_oracle_vm_vec_add(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1)
{
    dest->x = src0->x + src1->x;
    dest->y = src0->y + src1->y;
    dest->z = src0->z + src1->z;
}

extern "C" void c_oracle_vm_vec_sub(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1)
{
    dest->x = src0->x - src1->x;
    dest->y = src0->y - src1->y;
    dest->z = src0->z - src1->z;
}

extern "C" void c_oracle_vm_vec_add2(c_oracle_vec3* dest, const c_oracle_vec3* src)
{
    dest->x += src->x;
    dest->y += src->y;
    dest->z += src->z;
}

extern "C" void c_oracle_vm_vec_sub2(c_oracle_vec3* dest, const c_oracle_vec3* src)
{
    dest->x -= src->x;
    dest->y -= src->y;
    dest->z -= src->z;
}

extern "C" void c_oracle_vm_vec_avg(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1)
{
    dest->x = (src0->x + src1->x) / 2;
    dest->y = (src0->y + src1->y) / 2;
    dest->z = (src0->z + src1->z) / 2;
}

extern "C" void c_oracle_vm_vec_avg4(
    c_oracle_vec3* dest,
    const c_oracle_vec3* src0,
    const c_oracle_vec3* src1,
    const c_oracle_vec3* src2,
    const c_oracle_vec3* src3)
{
    dest->x = (src0->x + src1->x + src2->x + src3->x) / 4;
    dest->y = (src0->y + src1->y + src2->y + src3->y) / 4;
    dest->z = (src0->z + src1->z + src2->z + src3->z) / 4;
}

extern "C" void c_oracle_vm_vec_copy_scale(c_oracle_vec3* dest, const c_oracle_vec3* src, int32_t k)
{
    dest->x = fixmul(src->x, k);
    dest->y = fixmul(src->y, k);
    dest->z = fixmul(src->z, k);
}

extern "C" void c_oracle_vm_vec_scale(c_oracle_vec3* dest, int32_t k)
{
    dest->x = fixmul(dest->x, k);
    dest->y = fixmul(dest->y, k);
    dest->z = fixmul(dest->z, k);
}

extern "C" int32_t c_oracle_vm_vec_mag_quick(const c_oracle_vec3* v)
{
    int32_t a = labs(v->x);
    int32_t b = labs(v->y);
    int32_t c = labs(v->z);

    if (a < b)
    {
        int32_t t = a;
        a = b;
        b = t;
    }

    if (b < c)
    {
        int32_t t = b;
        b = c;
        c = t;

        if (a < b)
        {
            int32_t t2 = a;
            a = b;
            b = t2;
        }
    }

    int32_t bc = (b >> 2) + (c >> 3);
    return a + bc + (bc >> 1);
}

extern "C" int32_t c_oracle_vm_vec_dist_quick(const c_oracle_vec3* v0, const c_oracle_vec3* v1)
{
    c_oracle_vec3 t = { v0->x - v1->x, v0->y - v1->y, v0->z - v1->z };
    return c_oracle_vm_vec_mag_quick(&t);
}

extern "C" int32_t c_oracle_vm_vec_dotprod(const c_oracle_vec3* v0, const c_oracle_vec3* v1)
{
    const int64_t q =
        (int64_t)v0->x * (int64_t)v1->x +
        (int64_t)v0->y * (int64_t)v1->y +
        (int64_t)v0->z * (int64_t)v1->z;

    int32_t v = (int32_t)(q >> 16);
    int32_t vh = (int32_t)(q >> 48);
    const int signb = vh < 0;
    const int signv = v < 0;
    if (signb != signv)
    {
        v = (int32_t)0x7FFFFFFF;
        if (signb)
        {
            v = -v;
        }
    }
    return v;
}
