#include "c_oracle.h"

#include <stdlib.h>

#include "fix/fix.h"

static inline int32_t neg_i32_wrap(int32_t v)
{
    return (int32_t)(0u - (uint32_t)v);
}

static uint64_t c_oracle_sqrt_ceil_u64(uint64_t n, uint64_t hi)
{
    uint64_t lo = 0;
    uint64_t floor = 0;
    while (lo <= hi)
    {
        const uint64_t mid = lo + ((hi - lo) / 2);
        const __uint128_t sq = (__uint128_t)mid * (__uint128_t)mid;
        if (sq <= n)
        {
            floor = mid;
            lo = mid + 1;
        }
        else
        {
            hi = mid - 1;
        }
    }

    if ((int64_t)floor * (int64_t)floor == n)
    {
        return floor;
    }
    return floor + 1;
}

static int32_t c_oracle_long_sqrt_ceil(int32_t a)
{
    if (a <= 0)
    {
        return 0;
    }
    return (int32_t)c_oracle_sqrt_ceil_u64((uint64_t)a, 46341);
}

static int32_t c_oracle_quad_sqrt_ceil(int64_t q)
{
    if (q < 0)
    {
        return 0;
    }
    return (int32_t)c_oracle_sqrt_ceil_u64((uint64_t)q, 3037000500ULL);
}

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

extern "C" int32_t c_oracle_fix_sqrt(int32_t a)
{
    return c_oracle_long_sqrt_ceil(a) << 8;
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

extern "C" int32_t c_oracle_vm_vec_mag(const c_oracle_vec3* v)
{
    const int64_t q =
        (int64_t)v->x * (int64_t)v->x +
        (int64_t)v->y * (int64_t)v->y +
        (int64_t)v->z * (int64_t)v->z;
    return c_oracle_quad_sqrt_ceil(q);
}

extern "C" int32_t c_oracle_vm_vec_dist(const c_oracle_vec3* v0, const c_oracle_vec3* v1)
{
    const c_oracle_vec3 t = { v0->x - v1->x, v0->y - v1->y, v0->z - v1->z };
    return c_oracle_vm_vec_mag(&t);
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

extern "C" int32_t c_oracle_vm_vec_dot3(int32_t x, int32_t y, int32_t z, const c_oracle_vec3* v)
{
    const int64_t q =
        (int64_t)x * (int64_t)v->x +
        (int64_t)y * (int64_t)v->y +
        (int64_t)z * (int64_t)v->z;

    int32_t out = (int32_t)(q >> 16);
    int32_t vh = (int32_t)(q >> 48);
    const int signb = vh < 0;
    const int signv = out < 0;
    if (signb != signv)
    {
        out = (int32_t)0x7FFFFFFF;
        if (signb)
        {
            out = -out;
        }
    }
    return out;
}

extern "C" void c_oracle_vm_vec_crossprod(c_oracle_vec3* dest, const c_oracle_vec3* src0, const c_oracle_vec3* src1)
{
    const int64_t qx =
        (int64_t)src0->y * (int64_t)src1->z +
        (int64_t)neg_i32_wrap(src0->z) * (int64_t)src1->y;
    const int64_t qy =
        (int64_t)src0->z * (int64_t)src1->x +
        (int64_t)neg_i32_wrap(src0->x) * (int64_t)src1->z;
    const int64_t qz =
        (int64_t)src0->x * (int64_t)src1->y +
        (int64_t)neg_i32_wrap(src0->y) * (int64_t)src1->x;

    auto fixquadadjust_local = [](int64_t q) -> int32_t {
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
    };

    dest->x = fixquadadjust_local(qx);
    dest->y = fixquadadjust_local(qy);
    dest->z = fixquadadjust_local(qz);
}

extern "C" int32_t c_oracle_vm_vec_copy_normalize(c_oracle_vec3* dest, const c_oracle_vec3* src)
{
    const int32_t m = c_oracle_vm_vec_mag(src);
    if (m > 0)
    {
        dest->x = fixdiv(src->x, m);
        dest->y = fixdiv(src->y, m);
        dest->z = fixdiv(src->z, m);
    }
    else
    {
        dest->x = src->x;
        dest->y = src->y;
        dest->z = src->z;
    }
    return m;
}

extern "C" int32_t c_oracle_vm_vec_normalize(c_oracle_vec3* v)
{
    return c_oracle_vm_vec_copy_normalize(v, v);
}

extern "C" int32_t c_oracle_vm_vec_normalized_dir(
    c_oracle_vec3* dest,
    const c_oracle_vec3* end,
    const c_oracle_vec3* start)
{
    dest->x = end->x - start->x;
    dest->y = end->y - start->y;
    dest->z = end->z - start->z;
    return c_oracle_vm_vec_normalize(dest);
}

extern "C" int32_t c_oracle_vm_vec_copy_normalize_quick(c_oracle_vec3* dest, const c_oracle_vec3* src)
{
    const int32_t m = c_oracle_vm_vec_mag_quick(src);
    if (m > 0)
    {
        dest->x = fixdiv(src->x, m);
        dest->y = fixdiv(src->y, m);
        dest->z = fixdiv(src->z, m);
    }
    else
    {
        dest->x = src->x;
        dest->y = src->y;
        dest->z = src->z;
    }
    return m;
}

extern "C" int32_t c_oracle_vm_vec_normalize_quick(c_oracle_vec3* v)
{
    return c_oracle_vm_vec_copy_normalize_quick(v, v);
}

extern "C" int32_t c_oracle_vm_vec_normalized_dir_quick(
    c_oracle_vec3* dest,
    const c_oracle_vec3* end,
    const c_oracle_vec3* start)
{
    dest->x = end->x - start->x;
    dest->y = end->y - start->y;
    dest->z = end->z - start->z;
    return c_oracle_vm_vec_normalize_quick(dest);
}

extern "C" void c_oracle_vm_vec_make(c_oracle_vec3* v, int32_t x, int32_t y, int32_t z)
{
    v->x = x;
    v->y = y;
    v->z = z;
}

extern "C" void c_oracle_vm_angvec_make(c_oracle_ang3* v, int16_t p, int16_t b, int16_t h)
{
    v->p = p;
    v->b = b;
    v->h = h;
}

extern "C" int32_t c_oracle_vm_dist_to_plane(
    const c_oracle_vec3* checkp,
    const c_oracle_vec3* norm,
    const c_oracle_vec3* planep)
{
    const c_oracle_vec3 t = {
        checkp->x - planep->x,
        checkp->y - planep->y,
        checkp->z - planep->z
    };
    return c_oracle_vm_vec_dotprod(&t, norm);
}

static void c_oracle_check_vec(c_oracle_vec3* v)
{
    int32_t check = (int32_t)(labs(v->x) | labs(v->y) | labs(v->z));
    int cnt = 0;

    if (check == 0)
    {
        return;
    }

    if (check & 0xfffc0000)
    {
        while (check & 0xfff00000)
        {
            cnt += 4;
            check >>= 4;
        }

        while (check & 0xfffc0000)
        {
            cnt += 2;
            check >>= 2;
        }

        v->x >>= cnt;
        v->y >>= cnt;
        v->z >>= cnt;
    }
    else if ((check & 0xffff8000) == 0)
    {
        while ((check & 0xfffff000) == 0)
        {
            cnt += 4;
            check <<= 4;
        }

        while ((check & 0xffff8000) == 0)
        {
            cnt += 2;
            check <<= 2;
        }

        v->x >>= cnt;
        v->y >>= cnt;
        v->z >>= cnt;
    }
}

extern "C" void c_oracle_vm_vec_perp(
    c_oracle_vec3* dest,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    const c_oracle_vec3* p2)
{
    c_oracle_vec3 t0 = { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
    c_oracle_vec3 t1 = { p2->x - p1->x, p2->y - p1->y, p2->z - p1->z };

    c_oracle_check_vec(&t0);
    c_oracle_check_vec(&t1);

    c_oracle_vm_vec_crossprod(dest, &t0, &t1);
}

extern "C" void c_oracle_vm_vec_normal(
    c_oracle_vec3* dest,
    const c_oracle_vec3* p0,
    const c_oracle_vec3* p1,
    const c_oracle_vec3* p2)
{
    c_oracle_vm_vec_perp(dest, p0, p1, p2);
    c_oracle_vm_vec_normalize(dest);
}

extern "C" void c_oracle_vm_vec_rotate(c_oracle_vec3* dest, const c_oracle_vec3* src, const c_oracle_mat3* m)
{
    dest->x = c_oracle_vm_vec_dot3(src->x, src->y, src->z, &m->rvec);
    dest->y = c_oracle_vm_vec_dot3(src->x, src->y, src->z, &m->uvec);
    dest->z = c_oracle_vm_vec_dot3(src->x, src->y, src->z, &m->fvec);
}

extern "C" void c_oracle_vm_transpose_matrix(c_oracle_mat3* m)
{
    int32_t t;

    t = m->uvec.x; m->uvec.x = m->rvec.y; m->rvec.y = t;
    t = m->fvec.x; m->fvec.x = m->rvec.z; m->rvec.z = t;
    t = m->fvec.y; m->fvec.y = m->uvec.z; m->uvec.z = t;
}

extern "C" void c_oracle_vm_copy_transpose_matrix(c_oracle_mat3* dest, const c_oracle_mat3* src)
{
    dest->rvec.x = src->rvec.x;
    dest->rvec.y = src->uvec.x;
    dest->rvec.z = src->fvec.x;

    dest->uvec.x = src->rvec.y;
    dest->uvec.y = src->uvec.y;
    dest->uvec.z = src->fvec.y;

    dest->fvec.x = src->rvec.z;
    dest->fvec.y = src->uvec.z;
    dest->fvec.z = src->fvec.z;
}

extern "C" void c_oracle_vm_matrix_x_matrix(
    c_oracle_mat3* dest,
    const c_oracle_mat3* src0,
    const c_oracle_mat3* src1)
{
    dest->rvec.x = c_oracle_vm_vec_dot3(src0->rvec.x, src0->uvec.x, src0->fvec.x, &src1->rvec);
    dest->uvec.x = c_oracle_vm_vec_dot3(src0->rvec.x, src0->uvec.x, src0->fvec.x, &src1->uvec);
    dest->fvec.x = c_oracle_vm_vec_dot3(src0->rvec.x, src0->uvec.x, src0->fvec.x, &src1->fvec);

    dest->rvec.y = c_oracle_vm_vec_dot3(src0->rvec.y, src0->uvec.y, src0->fvec.y, &src1->rvec);
    dest->uvec.y = c_oracle_vm_vec_dot3(src0->rvec.y, src0->uvec.y, src0->fvec.y, &src1->uvec);
    dest->fvec.y = c_oracle_vm_vec_dot3(src0->rvec.y, src0->uvec.y, src0->fvec.y, &src1->fvec);

    dest->rvec.z = c_oracle_vm_vec_dot3(src0->rvec.z, src0->uvec.z, src0->fvec.z, &src1->rvec);
    dest->uvec.z = c_oracle_vm_vec_dot3(src0->rvec.z, src0->uvec.z, src0->fvec.z, &src1->uvec);
    dest->fvec.z = c_oracle_vm_vec_dot3(src0->rvec.z, src0->uvec.z, src0->fvec.z, &src1->fvec);
}
