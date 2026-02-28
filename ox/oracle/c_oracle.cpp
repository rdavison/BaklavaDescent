#include "c_oracle.h"

#include <cmath>
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

    const __uint128_t sq = (__uint128_t)floor * (__uint128_t)floor;
    if (sq == n)
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

static int32_t c_oracle_sincos_lut_entry(int i)
{
    const double pi = 3.14159265358979323846;
    const double angle = (double)i * pi / 128.0;
    return (int32_t)llround(sin(angle) * 16384.0);
}

static int32_t c_oracle_acos_lut_entry(int i)
{
    const double pi = 3.14159265358979323846;
    return (int32_t)llround(acos((double)i / 256.0) * 32768.0 / pi);
}

static int32_t c_oracle_asin_lut_entry(int i)
{
    const double pi = 3.14159265358979323846;
    return (int32_t)llround(asin((double)i / 256.0) * 32768.0 / pi);
}

static int32_t c_oracle_isqrt_guess_lut_entry(int i)
{
    if (i == 0)
    {
        return (int32_t)0x80000000u;
    }

    return (int32_t)(16777216.0 / sqrt((double)i));
}

extern "C" void c_oracle_fix_sincos(int32_t a, int32_t* s, int32_t* c)
{
    const int i = (a >> 8) & 0xFF;
    const int f = a & 0xFF;

    const int32_t ss = c_oracle_sincos_lut_entry(i);
    *s = (ss + (((c_oracle_sincos_lut_entry(i + 1) - ss) * f) >> 8)) << 2;

    const int32_t cc = c_oracle_sincos_lut_entry(i + 64);
    *c = (cc + (((c_oracle_sincos_lut_entry(i + 65) - cc) * f) >> 8)) << 2;
}

extern "C" int16_t c_oracle_fix_acos(int32_t v)
{
    int32_t vv = (int32_t)labs(v);

    if (vv >= f1_0)
    {
        return 0;
    }

    const int i = (vv >> 8) & 0xFF;
    const int f = vv & 0xFF;

    int32_t aa = c_oracle_acos_lut_entry(i);
    aa = aa + (((c_oracle_acos_lut_entry(i + 1) - aa) * f) >> 8);

    if (v < 0)
    {
        aa = 0x8000 - aa;
    }

    return (int16_t)aa;
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

extern "C" int32_t c_oracle_long_sqrt(int32_t a)
{
    return c_oracle_long_sqrt_ceil(a);
}

extern "C" int32_t c_oracle_quad_sqrt(int64_t q)
{
    return c_oracle_quad_sqrt_ceil(q);
}

extern "C" int32_t c_oracle_fixquadadjust(int64_t q)
{
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

extern "C" int64_t c_oracle_fixmulaccum(int64_t q, int32_t a, int32_t b)
{
    return q + ((int64_t)a * (int64_t)b);
}

extern "C" int32_t c_oracle_fixdivquadlong(int64_t n, int32_t d)
{
    const uint32_t den = (uint32_t)d;
    if (den == 0u)
    {
        return 1;
    }
    return (int32_t)(n / den);
}

extern "C" void c_oracle_fixquadnegate(int32_t* low, int32_t* high)
{
    const uint32_t old_low = (uint32_t)(*low);
    const uint32_t new_low = (uint32_t)(0u - old_low);
    const int32_t new_high = (int32_t)(0 - *high - (new_low != 0u));
    *low = (int32_t)new_low;
    *high = new_high;
}

extern "C" int32_t c_oracle_ufixdivquadlong(int32_t nl, int32_t nh, int32_t d)
{
    const uint32_t den = (uint32_t)d;
    if (den == 0u)
    {
        return 0;
    }

    const uint64_t num = (((uint64_t)(uint32_t)nh << 32) + (uint64_t)(uint32_t)nl);
    return (int32_t)((uint32_t)(num / den));
}

extern "C" int32_t c_oracle_fix_sqrt(int32_t a)
{
    return c_oracle_long_sqrt_ceil(a) << 8;
}

extern "C" int32_t c_oracle_fix_isqrt(int32_t a)
{
    constexpr int table_size = 1024;
    int b = a;
    int cnt = 0;
    int r = 0;

    if (a <= 0)
    {
        return 0;
    }

    while (b >= table_size)
    {
        b >>= 1;
        cnt++;
    }

    r = c_oracle_isqrt_guess_lut_entry(b) >> ((cnt + 1) / 2);

    for (int i = 0; i < 3; i++)
    {
        const int old_r = r;
        r = fixmul(((3 * 65536) - fixmul(fixmul(r, r), a)), r) / 2;
        if (old_r >= r)
        {
            return (r + old_r) / 2;
        }
    }

    return r;
}

extern "C" void c_oracle_fix_fastsincos(int32_t a, int32_t* s, int32_t* c)
{
    const int i = (a >> 8) & 0xFF;
    *s = c_oracle_sincos_lut_entry(i) << 2;
    *c = c_oracle_sincos_lut_entry(i + 64) << 2;
}

extern "C" int16_t c_oracle_fix_asin(int32_t v)
{
    int32_t vv = (int32_t)labs(v);

    if (vv >= f1_0)
    {
        return 0x4000;
    }

    const int i = (vv >> 8) & 0xFF;
    const int f = vv & 0xFF;

    int32_t aa = c_oracle_asin_lut_entry(i);
    aa = aa + (((c_oracle_asin_lut_entry(i + 1) - aa) * f) >> 8);

    if (v < 0)
    {
        aa = -aa;
    }

    return (int16_t)aa;
}

extern "C" int16_t c_oracle_fix_atan2(int32_t cosv, int32_t sinv)
{
    const int64_t q = (int64_t)sinv * (int64_t)sinv + (int64_t)cosv * (int64_t)cosv;
    const int32_t m = c_oracle_quad_sqrt_ceil(q);

    if (m == 0)
    {
        return 0;
    }

    if (labs(sinv) < labs(cosv))
    {
        int16_t t = c_oracle_fix_asin(fixdiv(sinv, m));
        if (cosv < 0)
        {
            t = (int16_t)(0x8000 - t);
        }
        return (int16_t)t;
    }
    else
    {
        int16_t t = c_oracle_fix_acos(fixdiv(cosv, m));
        if (sinv < 0)
        {
            t = (int16_t)(-t);
        }
        return (int16_t)t;
    }
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

extern "C" void c_oracle_vm_check_vec(c_oracle_vec3* v)
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

    c_oracle_vm_check_vec(&t0);
    c_oracle_vm_check_vec(&t1);

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

extern "C" int16_t c_oracle_vm_vec_delta_ang_norm(
    const c_oracle_vec3* v0,
    const c_oracle_vec3* v1,
    const c_oracle_vec3* fvec)
{
    int16_t a = c_oracle_fix_acos(c_oracle_vm_vec_dotprod(v0, v1));

    if (fvec != nullptr)
    {
        c_oracle_vec3 t = { 0, 0, 0 };
        c_oracle_vm_vec_crossprod(&t, v0, v1);
        if (c_oracle_vm_vec_dotprod(&t, fvec) < 0)
        {
            a = (int16_t)(-a);
        }
    }

    return a;
}

extern "C" int16_t c_oracle_vm_vec_delta_ang(
    const c_oracle_vec3* v0,
    const c_oracle_vec3* v1,
    const c_oracle_vec3* fvec)
{
    c_oracle_vec3 t0 = { 0, 0, 0 };
    c_oracle_vec3 t1 = { 0, 0, 0 };

    c_oracle_vm_vec_copy_normalize(&t0, v0);
    c_oracle_vm_vec_copy_normalize(&t1, v1);

    return c_oracle_vm_vec_delta_ang_norm(&t0, &t1, fvec);
}

extern "C" void c_oracle_sincos_2_matrix(
    c_oracle_mat3* dest,
    int32_t sinp,
    int32_t cosp,
    int32_t sinb,
    int32_t cosb,
    int32_t sinh,
    int32_t cosh)
{
    const int32_t sbsh = fixmul(sinb, sinh);
    const int32_t cbch = fixmul(cosb, cosh);
    const int32_t cbsh = fixmul(cosb, sinh);
    const int32_t sbch = fixmul(sinb, cosh);

    dest->rvec.x = cbch + fixmul(sinp, sbsh);
    dest->uvec.z = sbsh + fixmul(sinp, cbch);

    dest->uvec.x = fixmul(sinp, cbsh) - sbch;
    dest->rvec.z = fixmul(sinp, sbch) - cbsh;

    dest->fvec.x = fixmul(sinh, cosp);
    dest->rvec.y = fixmul(sinb, cosp);
    dest->uvec.y = fixmul(cosb, cosp);
    dest->fvec.z = fixmul(cosh, cosp);

    dest->fvec.y = -sinp;
}

extern "C" void c_oracle_vm_angles_2_matrix(c_oracle_mat3* dest, const c_oracle_ang3* a)
{
    int32_t sinp, cosp, sinb, cosb, sinh, cosh;
    c_oracle_fix_sincos(a->p, &sinp, &cosp);
    c_oracle_fix_sincos(a->b, &sinb, &cosb);
    c_oracle_fix_sincos(a->h, &sinh, &cosh);
    c_oracle_sincos_2_matrix(dest, sinp, cosp, sinb, cosb, sinh, cosh);
}

extern "C" void c_oracle_vm_vec_ang_2_matrix(c_oracle_mat3* dest, const c_oracle_vec3* v, int16_t a)
{
    int32_t sinb, cosb, sinp, cosp, sinh, cosh;

    c_oracle_fix_sincos(a, &sinb, &cosb);

    sinp = -v->y;
    cosp = c_oracle_fix_sqrt(f1_0 - fixmul(sinp, sinp));

    sinh = fixdiv(v->x, cosp);
    cosh = fixdiv(v->z, cosp);

    c_oracle_sincos_2_matrix(dest, sinp, cosp, sinb, cosb, sinh, cosh);
}

extern "C" void c_oracle_vm_extract_angles_matrix(c_oracle_ang3* dest, const c_oracle_mat3* m)
{
    int16_t h;
    int16_t p;
    int16_t b;
    int32_t sinh;
    int32_t cosh;
    int32_t cosp;

    if (m->fvec.x == 0 && m->fvec.z == 0)
    {
        h = 0;
    }
    else
    {
        h = c_oracle_fix_atan2(m->fvec.z, m->fvec.x);
    }

    c_oracle_fix_sincos(h, &sinh, &cosh);

    if (abs(sinh) > abs(cosh))
    {
        cosp = fixdiv(m->fvec.x, sinh);
    }
    else
    {
        cosp = fixdiv(m->fvec.z, cosh);
    }

    if (cosp == 0 && m->fvec.y == 0)
    {
        p = 0;
    }
    else
    {
        p = c_oracle_fix_atan2(cosp, neg_i32_wrap(m->fvec.y));
    }

    if (cosp == 0)
    {
        b = 0;
    }
    else
    {
        const int32_t sinb = fixdiv(m->rvec.y, cosp);
        const int32_t cosb = fixdiv(m->uvec.y, cosp);

        if (sinb == 0 && cosb == 0)
        {
            b = 0;
        }
        else
        {
            b = c_oracle_fix_atan2(cosb, sinb);
        }
    }

    dest->p = p;
    dest->b = b;
    dest->h = h;
}

extern "C" void c_oracle_vm_extract_angles_vector_normalized(c_oracle_ang3* dest, const c_oracle_vec3* v)
{
    dest->b = 0;
    dest->p = c_oracle_fix_asin(neg_i32_wrap(v->y));

    if (v->x == 0 && v->z == 0)
    {
        dest->h = 0;
    }
    else
    {
        dest->h = c_oracle_fix_atan2(v->z, v->x);
    }
}

extern "C" void c_oracle_vm_extract_angles_vector(c_oracle_ang3* dest, const c_oracle_vec3* v)
{
    c_oracle_vec3 t = { 0, 0, 0 };
    if (c_oracle_vm_vec_copy_normalize(&t, v) != 0)
    {
        c_oracle_vm_extract_angles_vector_normalized(dest, &t);
    }
}

extern "C" void c_oracle_vm_vector_2_matrix(
    c_oracle_mat3* dest,
    const c_oracle_vec3* fvec,
    const c_oracle_vec3* uvec,
    const c_oracle_vec3* rvec)
{
    c_oracle_vec3* xvec = &dest->rvec;
    c_oracle_vec3* yvec = &dest->uvec;
    c_oracle_vec3* zvec = &dest->fvec;

    if (c_oracle_vm_vec_copy_normalize(zvec, fvec) == 0)
    {
        goto bad_vector2;
    }

    if (uvec == nullptr)
    {
        if (rvec == nullptr)
        {
            goto bad_vector2;
        }
        else
        {
            if (c_oracle_vm_vec_copy_normalize(xvec, rvec) == 0)
            {
                goto bad_vector2;
            }

            c_oracle_vm_vec_crossprod(yvec, zvec, xvec);

            if (c_oracle_vm_vec_normalize(yvec) == 0)
            {
                goto bad_vector2;
            }

            c_oracle_vm_vec_crossprod(xvec, yvec, zvec);
        }
    }
    else
    {
        if (c_oracle_vm_vec_copy_normalize(yvec, uvec) == 0)
        {
            goto bad_vector2;
        }

        c_oracle_vm_vec_crossprod(xvec, yvec, zvec);

        if (c_oracle_vm_vec_normalize(xvec) == 0)
        {
            goto bad_vector2;
        }

        c_oracle_vm_vec_crossprod(yvec, zvec, xvec);
    }

    return;

bad_vector2:
    if (zvec->x == 0 && zvec->z == 0)
    {
        dest->rvec.x = f1_0;
        dest->uvec.z = (zvec->y < 0) ? f1_0 : -f1_0;
        dest->rvec.y = 0;
        dest->rvec.z = 0;
        dest->uvec.x = 0;
        dest->uvec.y = 0;
    }
    else
    {
        xvec->x = zvec->z;
        xvec->y = 0;
        xvec->z = -zvec->x;

        c_oracle_vm_vec_normalize(xvec);
        c_oracle_vm_vec_crossprod(yvec, zvec, xvec);
    }
}

extern "C" void c_oracle_vm_vector_2_matrix_norm(
    c_oracle_mat3* dest,
    const c_oracle_vec3* fvec,
    const c_oracle_vec3* uvec,
    const c_oracle_vec3* rvec)
{
    c_oracle_vec3* xvec = &dest->rvec;
    c_oracle_vec3* yvec = &dest->uvec;
    c_oracle_vec3* zvec = &dest->fvec;

    *zvec = *fvec;

    if (uvec == nullptr)
    {
        if (rvec == nullptr)
        {
            goto bad_vector2;
        }
        else
        {
            *xvec = *rvec;
            c_oracle_vm_vec_crossprod(yvec, zvec, xvec);

            if (c_oracle_vm_vec_normalize(yvec) == 0)
            {
                goto bad_vector2;
            }

            c_oracle_vm_vec_crossprod(xvec, yvec, zvec);
        }
    }
    else
    {
        *yvec = *uvec;
        c_oracle_vm_vec_crossprod(xvec, yvec, zvec);

        if (c_oracle_vm_vec_normalize(xvec) == 0)
        {
            goto bad_vector2;
        }

        c_oracle_vm_vec_crossprod(yvec, zvec, xvec);
    }

    return;

bad_vector2:
    if (zvec->x == 0 && zvec->z == 0)
    {
        dest->rvec.x = f1_0;
        dest->uvec.z = (zvec->y < 0) ? f1_0 : -f1_0;
        dest->rvec.y = 0;
        dest->rvec.z = 0;
        dest->uvec.x = 0;
        dest->uvec.y = 0;
    }
    else
    {
        xvec->x = zvec->z;
        xvec->y = 0;
        xvec->z = -zvec->x;

        c_oracle_vm_vec_normalize(xvec);
        c_oracle_vm_vec_crossprod(yvec, zvec, xvec);
    }
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

/* ---- 3D pipeline oracle functions ---- */

#define CC_OFF_LEFT  1
#define CC_OFF_RIGHT 2
#define CC_OFF_BOT   4
#define CC_OFF_TOP   8
#define CC_BEHIND    0x80

extern "C" uint8_t c_oracle_g3_code_point(int32_t x, int32_t y, int32_t z)
{
    uint8_t cc = 0;
    if (x > z) cc |= CC_OFF_RIGHT;
    if (y > z) cc |= CC_OFF_TOP;
    if (x < -z) cc |= CC_OFF_LEFT;
    if (y < -z) cc |= CC_OFF_BOT;
    if (z <= 0) cc |= CC_BEHIND;
    return cc;
}

extern "C" int c_oracle_checkmuldiv(int32_t* r, int32_t a, int32_t b, int32_t c)
{
    int64_t q = 0;
    q = c_oracle_fixmulaccum(q, a, b);
    int64_t qt = q;
    int32_t high = (int32_t)((qt >> 32) & 0xFFFFFFFF);
    uint32_t low = (uint32_t)(qt & 0xFFFFFFFF);
    if (high < 0) high = -high;
    high *= 2;
    if (low > 0x7FFFFFFFU) high++;
    if (high >= c) return 0;
    *r = c_oracle_fixdivquadlong(q, c);
    return 1;
}

extern "C" void c_oracle_g3_rotate_point(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz, uint8_t* codes)
{
    c_oracle_vec3 tempv = { sx - vpx, sy - vpy, sz - vpz };
    c_oracle_mat3 m = { {r1, r2, r3}, {u1, u2, u3}, {f1, f2, f3} };
    c_oracle_vec3 dest;
    c_oracle_vm_vec_rotate(&dest, &tempv, &m);
    *rx = dest.x; *ry = dest.y; *rz = dest.z;
    *codes = c_oracle_g3_code_point(dest.x, dest.y, dest.z);
}

extern "C" int c_oracle_g3_project_point(
    int32_t x, int32_t y, int32_t z,
    int32_t canv_w2, int32_t canv_h2,
    int32_t* sx, int32_t* sy)
{
    int32_t tx, ty;
    if (c_oracle_checkmuldiv(&tx, x, canv_w2, z) && c_oracle_checkmuldiv(&ty, y, canv_h2, z))
    {
        *sx = canv_w2 + tx;
        *sy = canv_h2 - ty;
        return 1;
    }
    return 0;
}

extern "C" void c_oracle_g3_rotate_delta_x(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dx, int32_t* rx, int32_t* ry, int32_t* rz)
{
    *rx = fixmul(r1, dx);
    *ry = fixmul(u1, dx);
    *rz = fixmul(f1, dx);
}

extern "C" void c_oracle_g3_rotate_delta_y(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dy, int32_t* rx, int32_t* ry, int32_t* rz)
{
    *rx = fixmul(r2, dy);
    *ry = fixmul(u2, dy);
    *rz = fixmul(f2, dy);
}

extern "C" void c_oracle_g3_rotate_delta_z(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dz, int32_t* rx, int32_t* ry, int32_t* rz)
{
    *rx = fixmul(r3, dz);
    *ry = fixmul(u3, dz);
    *rz = fixmul(f3, dz);
}

extern "C" int32_t c_oracle_g3_calc_point_depth(
    int32_t px, int32_t py, int32_t pz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t fx, int32_t fy, int32_t fz)
{
    int64_t q = 0;
    q = c_oracle_fixmulaccum(q, px - vpx, fx);
    q = c_oracle_fixmulaccum(q, py - vpy, fy);
    q = c_oracle_fixmulaccum(q, pz - vpz, fz);
    return c_oracle_fixquadadjust(q);
}

extern "C" void c_oracle_scale_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t wsx, int32_t wsy, int32_t wsz,
    int32_t zoom,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3,
    int32_t* msx, int32_t* msy, int32_t* msz)
{
    int32_t sx = wsx, sy = wsy, sz = wsz;
    if (zoom <= f1_0)
    {
        sz = fixmul(sz, zoom);
    }
    else
    {
        int32_t s = fixdiv(f1_0, zoom);
        sx = fixmul(sx, s);
        sy = fixmul(sy, s);
    }
    /* scale each row */
    *or1 = fixmul(r1, sx); *or2 = fixmul(r2, sx); *or3 = fixmul(r3, sx);
    *ou1 = fixmul(u1, sy); *ou2 = fixmul(u2, sy); *ou3 = fixmul(u3, sy);
    *of1 = fixmul(f1, sz); *of2 = fixmul(f2, sz); *of3 = fixmul(f3, sz);
    *msx = sx; *msy = sy; *msz = sz;
}

extern "C" void c_oracle_g3_start_instance_matrix(
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
    int32_t* nf1, int32_t* nf2, int32_t* nf3)
{
    c_oracle_vec3 tempv = { vpx - px, vpy - py, vpz - pz };
    c_oracle_mat3 vm = { {r1, r2, r3}, {u1, u2, u3}, {f1, f2, f3} };

    if (has_orient)
    {
        c_oracle_mat3 orient = { {mr1, mr2, mr3}, {mu1, mu2, mu3}, {mf1, mf2, mf3} };
        c_oracle_vec3 new_vp;
        c_oracle_vm_vec_rotate(&new_vp, &tempv, &orient);
        *nvpx = new_vp.x; *nvpy = new_vp.y; *nvpz = new_vp.z;

        c_oracle_mat3 tempm2;
        c_oracle_vm_copy_transpose_matrix(&tempm2, &orient);
        c_oracle_mat3 tempm;
        c_oracle_vm_matrix_x_matrix(&tempm, &tempm2, &vm);
        *nr1 = tempm.rvec.x; *nr2 = tempm.rvec.y; *nr3 = tempm.rvec.z;
        *nu1 = tempm.uvec.x; *nu2 = tempm.uvec.y; *nu3 = tempm.uvec.z;
        *nf1 = tempm.fvec.x; *nf2 = tempm.fvec.y; *nf3 = tempm.fvec.z;
    }
    else
    {
        *nvpx = tempv.x; *nvpy = tempv.y; *nvpz = tempv.z;
        *nr1 = r1; *nr2 = r2; *nr3 = r3;
        *nu1 = u1; *nu2 = u2; *nu3 = u3;
        *nf1 = f1; *nf2 = f2; *nf3 = f3;
    }
}

extern "C" void c_oracle_g3_point_2_vec(
    int32_t sx, int32_t sy,
    int32_t canv_w2, int32_t canv_h2,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t ur1, int32_t ur2, int32_t ur3,
    int32_t uu1, int32_t uu2, int32_t uu3,
    int32_t uf1, int32_t uf2, int32_t uf3,
    int32_t* vx, int32_t* vy, int32_t* vz)
{
    c_oracle_vec3 tempv;
    tempv.x = c_oracle_fixmuldiv(c_oracle_fixdiv((sx << 16) - canv_w2, canv_w2), msz, msx);
    tempv.y = -c_oracle_fixmuldiv(c_oracle_fixdiv((sy << 16) - canv_h2, canv_h2), msz, msy);
    tempv.z = f1_0;

    c_oracle_vm_vec_normalize(&tempv);

    c_oracle_mat3 unscaled = { {ur1, ur2, ur3}, {uu1, uu2, uu3}, {uf1, uf2, uf3} };
    c_oracle_mat3 tempm;
    c_oracle_vm_copy_transpose_matrix(&tempm, &unscaled);

    c_oracle_vec3 dest;
    c_oracle_vm_vec_rotate(&dest, &tempv, &tempm);
    *vx = dest.x; *vy = dest.y; *vz = dest.z;
}

/* Clipping-code constants matching 3d/3d.h */
#define CC_OFF_LEFT_O  1
#define CC_OFF_RIGHT_O 2
#define CC_OFF_BOT_O   4
#define CC_OFF_TOP_O   8
#define CC_BEHIND_O    0x80
#define PF_UVS_O       8
#define PF_LS_O        16

static uint8_t c_oracle_g3_code_point_local(int32_t x, int32_t y, int32_t z)
{
    uint8_t cc = 0;
    if (x > z) cc |= CC_OFF_RIGHT_O;
    if (y > z) cc |= CC_OFF_TOP_O;
    if (x < neg_i32_wrap(z)) cc |= CC_OFF_LEFT_O;
    if (y < neg_i32_wrap(z)) cc |= CC_OFF_BOT_O;
    if (z <= 0) cc |= CC_BEHIND_O;
    return cc;
}

extern "C" void c_oracle_clip_edge(
    int32_t plane_flag,
    int32_t on_x, int32_t on_y, int32_t on_z,
    int32_t on_u, int32_t on_v, int32_t on_l, int32_t on_flags,
    int32_t off_x, int32_t off_y, int32_t off_z,
    int32_t off_u, int32_t off_v, int32_t off_l,
    int32_t* nx, int32_t* ny, int32_t* nz,
    int32_t* nu, int32_t* nv, int32_t* nl,
    int32_t* nflags, uint8_t* ncodes)
{
    int32_t a, b;
    if (plane_flag & (CC_OFF_RIGHT_O | CC_OFF_LEFT_O))
    {
        a = on_x; b = off_x;
    }
    else
    {
        a = on_y; b = off_y;
    }
    if (plane_flag & (CC_OFF_LEFT_O | CC_OFF_BOT_O))
    {
        a = -a; b = -b;
    }
    int32_t kn = a - on_z;
    int32_t kd = kn - b + off_z;
    int32_t psx_ratio = c_oracle_fixdiv(kn, kd);

    int32_t tmp_x = on_x + c_oracle_fixmul(off_x - on_x, psx_ratio);
    int32_t tmp_y = on_y + c_oracle_fixmul(off_y - on_y, psx_ratio);
    int32_t tmp_z;
    if (plane_flag & (CC_OFF_TOP_O | CC_OFF_BOT_O))
        tmp_z = tmp_y;
    else
        tmp_z = tmp_x;
    if (plane_flag & (CC_OFF_LEFT_O | CC_OFF_BOT_O))
        tmp_z = -tmp_z;

    int32_t tmp_u = 0, tmp_v = 0;
    int32_t new_flags = 0;
    if (on_flags & PF_UVS_O)
    {
        tmp_u = on_u + c_oracle_fixmul(off_u - on_u, psx_ratio);
        tmp_v = on_v + c_oracle_fixmul(off_v - on_v, psx_ratio);
        new_flags |= PF_UVS_O;
    }
    int32_t tmp_l = 0;
    if (on_flags & PF_LS_O)
    {
        tmp_l = on_l + c_oracle_fixmul(off_l - on_l, psx_ratio);
        new_flags |= PF_LS_O;
    }

    *nx = tmp_x; *ny = tmp_y; *nz = tmp_z;
    *nu = tmp_u; *nv = tmp_v; *nl = tmp_l;
    *nflags = new_flags;
    *ncodes = c_oracle_g3_code_point_local(tmp_x, tmp_y, tmp_z);
}

extern "C" int c_oracle_g3_check_normal_facing(
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t nx, int32_t ny, int32_t nz)
{
    c_oracle_vec3 tempv = { vpx - vx, vpy - vy, vpz - vz };
    c_oracle_vec3 norm = { nx, ny, nz };
    return c_oracle_vm_vec_dotprod(&tempv, &norm) > 0 ? 1 : 0;
}

extern "C" void c_oracle_calc_rod_corners(
    int32_t bx, int32_t by, int32_t bz, int32_t bw,
    int32_t tx, int32_t ty, int32_t tz, int32_t tw,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t* c0x, int32_t* c0y, int32_t* c0z,
    int32_t* c1x, int32_t* c1y, int32_t* c1z,
    int32_t* c2x, int32_t* c2y, int32_t* c2z,
    int32_t* c3x, int32_t* c3y, int32_t* c3z,
    uint8_t* codes_and)
{
    c_oracle_vec3 bot = {bx, by, bz};
    c_oracle_vec3 top = {tx, ty, tz};

    c_oracle_vec3 delta_vec;
    c_oracle_vm_vec_sub(&delta_vec, &bot, &top);
    delta_vec.x = c_oracle_fixdiv(delta_vec.x, msx);
    delta_vec.y = c_oracle_fixdiv(delta_vec.y, msy);

    c_oracle_vm_vec_normalize(&delta_vec);

    c_oracle_vec3 top_norm;
    c_oracle_vm_vec_copy_normalize(&top_norm, &top);

    c_oracle_vec3 rod_norm;
    c_oracle_vm_vec_crossprod(&rod_norm, &delta_vec, &top_norm);
    c_oracle_vm_vec_normalize(&rod_norm);

    rod_norm.x = c_oracle_fixmul(rod_norm.x, msx);
    rod_norm.y = c_oracle_fixmul(rod_norm.y, msy);

    /* top corners */
    c_oracle_vec3 tempv;
    c_oracle_vm_vec_copy_scale(&tempv, &rod_norm, tw);
    tempv.z = 0;

    c_oracle_vec3 corner0, corner1;
    c_oracle_vm_vec_add(&corner0, &top, &tempv);
    c_oracle_vm_vec_sub(&corner1, &top, &tempv);

    /* bot corners */
    c_oracle_vm_vec_copy_scale(&tempv, &rod_norm, bw);
    tempv.z = 0;

    c_oracle_vec3 corner2, corner3;
    c_oracle_vm_vec_sub(&corner2, &bot, &tempv);
    c_oracle_vm_vec_add(&corner3, &bot, &tempv);

    uint8_t ca = 0xff;
    ca &= c_oracle_g3_code_point_local(corner0.x, corner0.y, corner0.z);
    ca &= c_oracle_g3_code_point_local(corner1.x, corner1.y, corner1.z);
    ca &= c_oracle_g3_code_point_local(corner2.x, corner2.y, corner2.z);
    ca &= c_oracle_g3_code_point_local(corner3.x, corner3.y, corner3.z);

    *c0x = corner0.x; *c0y = corner0.y; *c0z = corner0.z;
    *c1x = corner1.x; *c1y = corner1.y; *c1z = corner1.z;
    *c2x = corner2.x; *c2y = corner2.y; *c2z = corner2.z;
    *c3x = corner3.x; *c3y = corner3.y; *c3z = corner3.z;
    *codes_and = ca;
}

extern "C" void c_oracle_clip_line(
    int32_t p0x, int32_t p0y, int32_t p0z, int32_t p0_codes,
    int32_t p1x, int32_t p1y, int32_t p1z, int32_t p1_codes,
    int32_t codes_or,
    int32_t* out_p0x, int32_t* out_p0y, int32_t* out_p0z, int32_t* out_p0_codes,
    int32_t* out_p1x, int32_t* out_p1y, int32_t* out_p1z, int32_t* out_p1_codes,
    int32_t* out_clipped)
{
    for (int plane_flag = 1; plane_flag < 16; plane_flag <<= 1)
    {
        if (codes_or & plane_flag)
        {
            if (p0_codes & plane_flag)
            {
                int32_t tx, ty, tz, tc;
                tx = p0x; p0x = p1x; p1x = tx;
                ty = p0y; p0y = p1y; p1y = ty;
                tz = p0z; p0z = p1z; p1z = tz;
                tc = p0_codes; p0_codes = p1_codes; p1_codes = tc;
            }

            int32_t nx, ny, nz, nu, nv, nl, nflags;
            uint8_t ncodes;
            c_oracle_clip_edge(plane_flag,
                p0x, p0y, p0z, 0, 0, 0, 0,
                p1x, p1y, p1z, 0, 0, 0,
                &nx, &ny, &nz, &nu, &nv, &nl, &nflags, &ncodes);

            p1x = nx; p1y = ny; p1z = nz; p1_codes = ncodes;

            if (p0_codes & p1_codes)
            {
                *out_p0x = p0x; *out_p0y = p0y; *out_p0z = p0z; *out_p0_codes = p0_codes;
                *out_p1x = p1x; *out_p1y = p1y; *out_p1z = p1z; *out_p1_codes = p1_codes;
                *out_clipped = 1;
                return;
            }
            codes_or = p0_codes | p1_codes;
        }
    }
    *out_p0x = p0x; *out_p0y = p0y; *out_p0z = p0z; *out_p0_codes = p0_codes;
    *out_p1x = p1x; *out_p1y = p1y; *out_p1z = p1z; *out_p1_codes = p1_codes;
    *out_clipped = 0;
}

extern "C" int c_oracle_do_facing_check_computed(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z)
{
    c_oracle_vec3 p0 = {p0x, p0y, p0z};
    c_oracle_vec3 p1 = {p1x, p1y, p1z};
    c_oracle_vec3 p2 = {p2x, p2y, p2z};
    c_oracle_vec3 tempv;
    c_oracle_vm_vec_perp(&tempv, &p0, &p1, &p2);
    return c_oracle_vm_vec_dotprod(&tempv, &p1) < 0 ? 1 : 0;
}

/* clip_plane: Sutherland-Hodgman for one plane on flat arrays.
   Each vertex = 8 ints: x,y,z,u,v,l,flags,codes.
   src has nv vertices, dest receives clipped output.
   Returns number of output vertices, updates *cc_or and *cc_and. */
static int c_oracle_clip_plane(
    int plane_flag,
    const int32_t* src, int nv,
    int32_t* dest,
    int32_t* cc_or, int32_t* cc_and)
{
    /* wrap: copy first two verts to after last */
    int32_t wrap_buf[(nv + 2) * 8];
    for (int i = 0; i < nv * 8; i++) wrap_buf[i] = src[i];
    for (int i = 0; i < 8; i++) wrap_buf[nv * 8 + i] = src[i]; /* src[0] */
    for (int i = 0; i < 8; i++) wrap_buf[(nv + 1) * 8 + i] = src[8 + i]; /* src[1] */

    *cc_or = 0;
    *cc_and = 0xff;
    int out = 0;

    for (int i = 1; i <= nv; i++)
    {
        int32_t ci_codes = wrap_buf[i * 8 + 7];
        if (ci_codes & plane_flag)
        {
            /* current off */
            int32_t prev_codes = wrap_buf[(i - 1) * 8 + 7];
            if (!(prev_codes & plane_flag))
            {
                /* prev on → clip(prev, cur) */
                int32_t nx, ny, nz, nu, nv2, nl, nflags;
                uint8_t ncodes;
                c_oracle_clip_edge(plane_flag,
                    wrap_buf[(i-1)*8+0], wrap_buf[(i-1)*8+1], wrap_buf[(i-1)*8+2],
                    wrap_buf[(i-1)*8+3], wrap_buf[(i-1)*8+4], wrap_buf[(i-1)*8+5],
                    wrap_buf[(i-1)*8+6],
                    wrap_buf[i*8+0], wrap_buf[i*8+1], wrap_buf[i*8+2],
                    wrap_buf[i*8+3], wrap_buf[i*8+4], wrap_buf[i*8+5],
                    &nx, &ny, &nz, &nu, &nv2, &nl, &nflags, &ncodes);
                dest[out*8+0] = nx; dest[out*8+1] = ny; dest[out*8+2] = nz;
                dest[out*8+3] = nu; dest[out*8+4] = nv2; dest[out*8+5] = nl;
                dest[out*8+6] = nflags; dest[out*8+7] = ncodes;
                *cc_or |= ncodes;
                *cc_and &= ncodes;
                out++;
            }
            int32_t next_codes = wrap_buf[(i + 1) * 8 + 7];
            if (!(next_codes & plane_flag))
            {
                /* next on → clip(next, cur) */
                int32_t nx, ny, nz, nu, nv2, nl, nflags;
                uint8_t ncodes;
                c_oracle_clip_edge(plane_flag,
                    wrap_buf[(i+1)*8+0], wrap_buf[(i+1)*8+1], wrap_buf[(i+1)*8+2],
                    wrap_buf[(i+1)*8+3], wrap_buf[(i+1)*8+4], wrap_buf[(i+1)*8+5],
                    wrap_buf[(i+1)*8+6],
                    wrap_buf[i*8+0], wrap_buf[i*8+1], wrap_buf[i*8+2],
                    wrap_buf[i*8+3], wrap_buf[i*8+4], wrap_buf[i*8+5],
                    &nx, &ny, &nz, &nu, &nv2, &nl, &nflags, &ncodes);
                dest[out*8+0] = nx; dest[out*8+1] = ny; dest[out*8+2] = nz;
                dest[out*8+3] = nu; dest[out*8+4] = nv2; dest[out*8+5] = nl;
                dest[out*8+6] = nflags; dest[out*8+7] = ncodes;
                *cc_or |= ncodes;
                *cc_and &= ncodes;
                out++;
            }
        }
        else
        {
            /* current on → pass through */
            for (int j = 0; j < 8; j++)
                dest[out * 8 + j] = wrap_buf[i * 8 + j];
            *cc_or |= wrap_buf[i * 8 + 7];
            *cc_and &= wrap_buf[i * 8 + 7];
            out++;
        }
    }
    return out;
}

/* clip_polygon: iterate all 4 frustum planes.
   Input: codes_or, codes_and, nv vertices in flat_in (8 ints each).
   Output: *out_nv vertices in flat_out, updated codes_or/and. */
extern "C" void c_oracle_clip_polygon(
    int32_t codes_or, int32_t codes_and,
    int nv, const int32_t* flat_in,
    int* out_nv, int32_t* flat_out,
    int32_t* out_codes_or, int32_t* out_codes_and)
{
    int32_t buf_a[200 * 8];
    int32_t buf_b[200 * 8];

    /* copy input to buf_a */
    for (int i = 0; i < nv * 8; i++) buf_a[i] = flat_in[i];

    int32_t* src = buf_a;
    int32_t* dest = buf_b;

    for (int plane_flag = 1; plane_flag < 16; plane_flag <<= 1)
    {
        if (codes_or & plane_flag)
        {
            nv = c_oracle_clip_plane(plane_flag, src, nv, dest,
                                      &codes_or, &codes_and);
            if (codes_and) /* clipped away */
            {
                *out_nv = nv;
                for (int i = 0; i < nv * 8; i++) flat_out[i] = dest[i];
                *out_codes_or = codes_or;
                *out_codes_and = codes_and;
                return;
            }
            int32_t* t = src; src = dest; dest = t;
        }
    }
    /* result is in src (we swapped after last copy) */
    *out_nv = nv;
    for (int i = 0; i < nv * 8; i++) flat_out[i] = src[i];
    *out_codes_or = codes_or;
    *out_codes_and = codes_and;
}

static int32_t c_oracle_physics_set_rotvel_and_saturate(int32_t dest, int32_t delta)
{
    if ((delta ^ dest) < 0)
    {
        if (labs(delta) < 0x10000 / 8)
            return delta / 4;
        else
            return delta;
    }
    else
    {
        return delta;
    }
}

extern "C" void c_oracle_physics_turn_towards_vector(
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t rate, int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz)
{
    if (gx == 0 && gy == 0 && gz == 0)
    {
        *out_rx = crx;
        *out_ry = cry;
        *out_rz = crz;
        return;
    }

    if (is_morph)
        rate *= 2;

    c_oracle_vec3 goal = { gx, gy, gz };
    c_oracle_vec3 fvec = { fx, fy, fz };
    c_oracle_ang3 dest_angles, cur_angles;
    /* c_oracle_vm_extract_angles_vector doesn't init fields on zero-mag */
    dest_angles.p = 0; dest_angles.b = 0; dest_angles.h = 0;
    cur_angles.p = 0; cur_angles.b = 0; cur_angles.h = 0;
    c_oracle_vm_extract_angles_vector(&dest_angles, &goal);
    c_oracle_vm_extract_angles_vector(&cur_angles, &fvec);

    int32_t delta_p = dest_angles.p - cur_angles.p;
    int32_t delta_h = dest_angles.h - cur_angles.h;

    if (delta_p > 0x10000 / 2) delta_p = dest_angles.p - cur_angles.p - 0x10000;
    if (delta_p < -0x10000 / 2) delta_p = dest_angles.p - cur_angles.p + 0x10000;
    if (delta_h > 0x10000 / 2) delta_h = dest_angles.h - cur_angles.h - 0x10000;
    if (delta_h < -0x10000 / 2) delta_h = dest_angles.h - cur_angles.h + 0x10000;

    delta_p = c_oracle_fixdiv(delta_p, rate);
    delta_h = c_oracle_fixdiv(delta_h, rate);

    if (labs(delta_p) < 0x10000 / 16) delta_p *= 4;
    if (labs(delta_h) < 0x10000 / 16) delta_h *= 4;

    *out_rx = c_oracle_physics_set_rotvel_and_saturate(crx, delta_p);
    *out_ry = c_oracle_physics_set_rotvel_and_saturate(cry, delta_h);
    *out_rz = 0;
}

static void c_oracle_check_and_fix_matrix(c_oracle_mat3* m)
{
    c_oracle_mat3 tempm;
    c_oracle_vm_vector_2_matrix(&tempm, &m->fvec, &m->uvec, NULL);
    *m = tempm;
}

#define TURNROLL_SCALE (0x4ec4/2)
#define ROLL_RATE      0x2000

static int32_t c_oracle_set_object_turnroll(int32_t turnroll, int32_t rotvel_y, int32_t frame_time)
{
    int32_t desired_bank = (int16_t)(-c_oracle_fixmul(rotvel_y, TURNROLL_SCALE));
    if (turnroll != desired_bank) {
        int32_t max_roll = (int16_t)c_oracle_fixmul(ROLL_RATE, frame_time);
        int32_t delta_ang = desired_bank - turnroll;
        if (labs(delta_ang) < max_roll)
            max_roll = delta_ang;
        else if (delta_ang < 0)
            max_roll = -max_roll;
        turnroll += max_roll;
    }
    return turnroll;
}

#define PF_TURNROLL      0x01
#define PF_USES_THRUST   0x40
#define PF_FREE_SPINNING 0x100
#define FT_ORACLE (0x10000/64)

extern "C" void c_oracle_do_physics_sim_rot(
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t rtx, int32_t rty, int32_t rtz,
    int32_t o_rx, int32_t o_ry, int32_t o_rz,
    int32_t o_ux, int32_t o_uy, int32_t o_uz,
    int32_t o_fx, int32_t o_fy, int32_t o_fz,
    int32_t drag, int32_t mass, int32_t flags,
    int32_t turnroll, int32_t frame_time,
    int32_t* out_tag,
    int32_t* out_orient,  /* 9 values */
    int32_t* out_rvx, int32_t* out_rvy, int32_t* out_rvz,
    int32_t* out_turnroll)
{
    /* Early exit if nothing to do */
    if (!(rvx || rvy || rvz || rtx || rty || rtz)) {
        *out_tag = 0;
        return;
    }

    c_oracle_vec3 rotvel = {rvx, rvy, rvz};
    c_oracle_mat3 orient = {{o_rx, o_ry, o_rz}, {o_ux, o_uy, o_uz}, {o_fx, o_fy, o_fz}};

    /* Apply drag */
    if (drag) {
        int32_t count = frame_time / FT_ORACLE;
        int32_t r = frame_time % FT_ORACLE;
        int32_t k = c_oracle_fixdiv(r, FT_ORACLE);
        int32_t drag_scaled = (drag * 5) / 2;

        if (flags & PF_USES_THRUST) {
            c_oracle_vec3 accel;
            c_oracle_vec3 rotthrust = {rtx, rty, rtz};
            c_oracle_vm_vec_copy_scale(&accel, &rotthrust, c_oracle_fixdiv(0x10000, mass));

            for (int i = 0; i < count; i++) {
                c_oracle_vm_vec_add2(&rotvel, &accel);
                c_oracle_vm_vec_scale(&rotvel, 0x10000 - drag_scaled);
            }
            c_oracle_vm_vec_scale_add2(&rotvel, &accel, k);
            c_oracle_vm_vec_scale(&rotvel, 0x10000 - c_oracle_fixmul(k, drag_scaled));
        }
        else if (!(flags & PF_FREE_SPINNING)) {
            int32_t total_drag = 0x10000;
            for (int i = 0; i < count; i++)
                total_drag = c_oracle_fixmul(total_drag, 0x10000 - drag_scaled);
            total_drag = c_oracle_fixmul(total_drag, 0x10000 - c_oracle_fixmul(k, drag_scaled));
            c_oracle_vm_vec_scale(&rotvel, total_drag);
        }
    }

    /* Unrotate for bank caused by turnroll */
    if (turnroll) {
        c_oracle_ang3 tangles = {0, (int16_t)(-turnroll), 0};
        c_oracle_mat3 rotmat, new_pm;
        c_oracle_vm_angles_2_matrix(&rotmat, &tangles);
        c_oracle_vm_matrix_x_matrix(&new_pm, &orient, &rotmat);
        orient = new_pm;
    }

    /* Apply rotation */
    {
        c_oracle_ang3 tangles;
        c_oracle_mat3 rotmat, new_orient;
        tangles.p = c_oracle_fixmul(rotvel.x, frame_time);
        tangles.b = c_oracle_fixmul(rotvel.z, frame_time);
        tangles.h = c_oracle_fixmul(rotvel.y, frame_time);
        c_oracle_vm_angles_2_matrix(&rotmat, &tangles);
        c_oracle_vm_matrix_x_matrix(&new_orient, &orient, &rotmat);
        orient = new_orient;
    }

    /* Apply turnroll update */
    if (flags & PF_TURNROLL)
        turnroll = c_oracle_set_object_turnroll(turnroll, rotvel.y, frame_time);

    /* Re-rotate for bank caused by turnroll */
    if (turnroll) {
        c_oracle_ang3 tangles = {0, (int16_t)turnroll, 0};
        c_oracle_mat3 rotmat, new_pm;
        c_oracle_vm_angles_2_matrix(&rotmat, &tangles);
        c_oracle_vm_matrix_x_matrix(&new_pm, &orient, &rotmat);
        orient = new_pm;
    }

    /* Fix matrix orthogonality */
    c_oracle_check_and_fix_matrix(&orient);

    *out_tag = 1;
    out_orient[0] = orient.rvec.x; out_orient[1] = orient.rvec.y; out_orient[2] = orient.rvec.z;
    out_orient[3] = orient.uvec.x; out_orient[4] = orient.uvec.y; out_orient[5] = orient.uvec.z;
    out_orient[6] = orient.fvec.x; out_orient[7] = orient.fvec.y; out_orient[8] = orient.fvec.z;
    *out_rvx = rotvel.x;
    *out_rvy = rotvel.y;
    *out_rvz = rotvel.z;
    *out_turnroll = turnroll;
}

#define MAX_SUBMODELS_ORACLE 10

extern "C" void c_oracle_calc_gun_point(
    int32_t gpx, int32_t gpy, int32_t gpz,
    int32_t start_mn,
    const int32_t* anim_angles,   /* MAX_SUBMODELS * 3 (p,b,h) */
    const int32_t* sub_offsets,   /* MAX_SUBMODELS * 3 (x,y,z) */
    const int32_t* sub_parents,   /* MAX_SUBMODELS */
    int32_t o_rx, int32_t o_ry, int32_t o_rz,
    int32_t o_ux, int32_t o_uy, int32_t o_uz,
    int32_t o_fx, int32_t o_fy, int32_t o_fz,
    int32_t px, int32_t py, int32_t pz,
    int32_t* out_x, int32_t* out_y, int32_t* out_z)
{
    c_oracle_vec3 pnt = {gpx, gpy, gpz};
    int mn = start_mn;

    /* Walk up bone hierarchy */
    while (mn != 0) {
        c_oracle_ang3 angles = {
            (int16_t)anim_angles[mn * 3],
            (int16_t)anim_angles[mn * 3 + 1],
            (int16_t)anim_angles[mn * 3 + 2]
        };
        c_oracle_mat3 m;
        c_oracle_vm_angles_2_matrix(&m, &angles);
        c_oracle_vm_transpose_matrix(&m);
        c_oracle_vec3 tpnt;
        c_oracle_vm_vec_rotate(&tpnt, &pnt, &m);
        c_oracle_vec3 offset = {
            sub_offsets[mn * 3],
            sub_offsets[mn * 3 + 1],
            sub_offsets[mn * 3 + 2]
        };
        c_oracle_vm_vec_add(&pnt, &tpnt, &offset);
        mn = sub_parents[mn];
    }

    /* Instance for entire object */
    c_oracle_mat3 obj_orient = {{o_rx, o_ry, o_rz}, {o_ux, o_uy, o_uz}, {o_fx, o_fy, o_fz}};
    c_oracle_mat3 m_t;
    c_oracle_vm_copy_transpose_matrix(&m_t, &obj_orient);
    c_oracle_vec3 rotated;
    c_oracle_vm_vec_rotate(&rotated, &pnt, &m_t);
    *out_x = rotated.x + px;
    *out_y = rotated.y + py;
    *out_z = rotated.z + pz;
}

extern "C" void c_oracle_phys_apply_force(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    if (mass == 0)
    {
        *out_vx = vx; *out_vy = vy; *out_vz = vz;
        return;
    }
    int32_t scale = c_oracle_fixdiv(0x10000, mass);
    c_oracle_vec3 vel = { vx, vy, vz };
    c_oracle_vec3 force = { fx, fy, fz };
    c_oracle_vm_vec_scale_add2(&vel, &force, scale);
    *out_vx = vel.x; *out_vy = vel.y; *out_vz = vel.z;
}

extern "C" void c_oracle_ai_turn_towards_vector(
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t rx, int32_t ry, int32_t rz,
    int32_t rate, int32_t frame_time,
    int32_t seismic_mag, int32_t robot_mass,
    int32_t rvx, int32_t rvy, int32_t rvz,
    int32_t* out_orient)
{
    c_oracle_vec3 goal = { gx, gy, gz };
    c_oracle_vec3 fvec = { fx, fy, fz };
    c_oracle_vec3 rvec_in = { rx, ry, rz };
    c_oracle_vec3 new_fvec = goal;

    int32_t dot = c_oracle_vm_vec_dotprod(&goal, &fvec);

    if (dot < (0x10000 - frame_time / 2))
    {
        int32_t new_scale = c_oracle_fixdiv(frame_time * 1, rate);
        c_oracle_vm_vec_scale(&new_fvec, new_scale);
        c_oracle_vm_vec_add2(&new_fvec, &fvec);
        int32_t mag = c_oracle_vm_vec_normalize_quick(&new_fvec);
        if (mag < 0x10000 / 256)
        {
            new_fvec = goal;
        }
    }

    /* D2 seismic tremor perturbation */
    if (seismic_mag != 0)
    {
        c_oracle_vec3 rand_vec = { rvx, rvy, rvz };
        int32_t scale = c_oracle_fixdiv(2 * seismic_mag, robot_mass);
        c_oracle_vm_vec_scale_add2(&new_fvec, &rand_vec, scale);
    }

    c_oracle_mat3 orient;
    c_oracle_vm_vector_2_matrix(&orient, &new_fvec, nullptr, &rvec_in);

    out_orient[0] = orient.rvec.x; out_orient[1] = orient.rvec.y; out_orient[2] = orient.rvec.z;
    out_orient[3] = orient.uvec.x; out_orient[4] = orient.uvec.y; out_orient[5] = orient.uvec.z;
    out_orient[6] = orient.fvec.x; out_orient[7] = orient.fvec.y; out_orient[8] = orient.fvec.z;
}

extern "C" void c_oracle_set_thrust_from_velocity(
    int32_t mass, int32_t drag,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t* out_tx, int32_t* out_ty, int32_t* out_tz)
{
    int32_t k = c_oracle_fixmuldiv(mass, drag, 0x10000 - drag);
    c_oracle_vec3 vel = { vx, vy, vz };
    c_oracle_vec3 thrust;
    c_oracle_vm_vec_copy_scale(&thrust, &vel, k);
    *out_tx = thrust.x;
    *out_ty = thrust.y;
    *out_tz = thrust.z;
}

extern "C" void c_oracle_phys_apply_rot(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t mass, int is_robot,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int is_morph,
    int32_t crx, int32_t cry, int32_t crz,
    int32_t* out_rx, int32_t* out_ry, int32_t* out_rz,
    int* out_set_skip_ai)
{
    c_oracle_vec3 force = { fx, fy, fz };
    int32_t vecmag = c_oracle_vm_vec_mag(&force) / 8;
    int32_t rate;
    int set_skip_ai = 0;

    if (vecmag < 0x10000 / 256)
        rate = 4 * 0x10000;
    else if (vecmag < (mass >> 14))
        rate = 4 * 0x10000;
    else
    {
        rate = c_oracle_fixdiv(mass, vecmag);
        if (is_robot)
        {
            if (rate < 0x10000 / 4)
                rate = 0x10000 / 4;
            set_skip_ai = 1;
        }
        else
        {
            if (rate < 0x10000 / 2)
                rate = 0x10000 / 2;
        }
    }

    c_oracle_physics_turn_towards_vector(
        fx, fy, fz, fvx, fvy, fvz,
        rate, is_morph, crx, cry, crz,
        out_rx, out_ry, out_rz);
    *out_set_skip_ai = set_skip_ai;
}

extern "C" void c_oracle_move_towards_vector(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t gx, int32_t gy, int32_t gz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t frame_time, int32_t difficulty,
    int32_t max_speed, int32_t attack_type,
    int dot_based, int is_thief, int is_kamikaze,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    /* Normalize velocity and compute dot with fvec */
    c_oracle_vec3 vel = { vx, vy, vz };
    c_oracle_vm_vec_normalize_quick(&vel);
    c_oracle_vec3 fvec = { fx, fy, fz };
    int32_t dot = c_oracle_vm_vec_dotprod(&vel, &fvec);

    /* D2 thief: bias dot */
    if (is_thief)
        dot = (0x10000 + dot) / 2;

    int32_t nvx, nvy, nvz;
    if (dot_based && dot < 3 * 0x10000 / 4)
    {
        nvx = vx / 2 + c_oracle_fixmul(gx, frame_time * 32);
        nvy = vy / 2 + c_oracle_fixmul(gy, frame_time * 32);
        nvz = vz / 2 + c_oracle_fixmul(gz, frame_time * 32);
    }
    else
    {
        int32_t scale = frame_time * 64;
        nvx = vx + c_oracle_fixmul(gx, scale) * (difficulty + 5) / 4;
        nvy = vy + c_oracle_fixmul(gy, scale) * (difficulty + 5) / 4;
        nvz = vz + c_oracle_fixmul(gz, scale) * (difficulty + 5) / 4;
    }

    int32_t ms = max_speed;
    if (attack_type == 1 || is_thief || is_kamikaze)
        ms *= 2;

    c_oracle_vec3 nv = { nvx, nvy, nvz };
    int32_t speed = c_oracle_vm_vec_mag_quick(&nv);
    if (speed > ms)
    {
        nvx = nvx * 3 / 4;
        nvy = nvy * 3 / 4;
        nvz = nvz * 3 / 4;
    }
    *out_vx = nvx; *out_vy = nvy; *out_vz = nvz;
}

extern "C" void c_oracle_move_around_player(
    const int32_t* packed,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    int32_t vx = packed[0], vy = packed[1], vz = packed[2];
    int32_t px = packed[3], py = packed[4], pz = packed[5];
    int32_t fx = packed[6], fy = packed[7], fz = packed[8];
    int32_t frame_time = packed[9];
    int32_t frame_count = packed[10];
    int32_t objnum = packed[11];
    int32_t fast_flag = packed[12];
    int32_t shields = packed[13];
    int32_t strength = packed[14];
    int32_t field_of_view = packed[15];
    int32_t max_speed = packed[16];
    int player_cloaked = packed[17];
    int skip_objnum1 = packed[18];

    if (fast_flag == 0)
    {
        *out_vx = vx; *out_vy = vy; *out_vz = vz;
        return;
    }

    int dir_change = 48;
    int32_t ft = frame_time;
    int count = 0;
    if (ft < 0x10000 / 32) { dir_change *= 8; count += 3; }
    else while (ft < 0x10000 / 4) { dir_change *= 2; ft *= 2; count++; }

    int dir = (frame_count + (count + 1) * (objnum * 8 + objnum * 4 + objnum)) & dir_change;
    dir >>= (4 + count);

    int32_t scale = frame_time * 32;
    int32_t ex, ey, ez;
    switch (dir)
    {
    case 0: ex = c_oracle_fixmul(pz, scale); ey = c_oracle_fixmul(py, scale); ez = c_oracle_fixmul(-px, scale); break;
    case 1: ex = c_oracle_fixmul(-pz, scale); ey = c_oracle_fixmul(py, scale); ez = c_oracle_fixmul(px, scale); break;
    case 2: ex = c_oracle_fixmul(-py, scale); ey = c_oracle_fixmul(px, scale); ez = c_oracle_fixmul(pz, scale); break;
    default: ex = c_oracle_fixmul(py, scale); ey = c_oracle_fixmul(-px, scale); ez = c_oracle_fixmul(pz, scale); break;
    }

    if (fast_flag > 0)
    {
        c_oracle_vec3 vtp = { px, py, pz };
        c_oracle_vec3 fvec = { fx, fy, fz };
        int32_t dot = c_oracle_vm_vec_dotprod(&vtp, &fvec);
        if (dot > field_of_view && !player_cloaked)
        {
            int32_t damage_scale;
            if (strength != 0)
            {
                damage_scale = c_oracle_fixdiv(shields, strength);
                if (damage_scale > 0x10000) damage_scale = 0x10000;
                else if (damage_scale < 0) damage_scale = 0;
            }
            else
                damage_scale = 0x10000;

            int32_t s = (fast_flag << 16) + damage_scale;
            ex = c_oracle_fixmul(ex, s);
            ey = c_oracle_fixmul(ey, s);
            ez = c_oracle_fixmul(ez, s);
        }
    }

    int32_t nvx = vx + ex, nvy = vy + ey, nvz = vz + ez;
    c_oracle_vec3 nv = { nvx, nvy, nvz };
    int32_t speed = c_oracle_vm_vec_mag_quick(&nv);
    if ((!skip_objnum1 || objnum != 1) && speed > max_speed)
    {
        nvx = nvx * 3 / 4;
        nvy = nvy * 3 / 4;
        nvz = nvz * 3 / 4;
    }
    *out_vx = nvx; *out_vy = nvy; *out_vz = nvz;
}

extern "C" void c_oracle_move_away_from_player(
    int32_t vx, int32_t vy, int32_t vz,
    int32_t px, int32_t py, int32_t pz,
    int32_t ux, int32_t uy, int32_t uz,
    int32_t rx, int32_t ry, int32_t rz,
    int32_t frame_time, int32_t frame_count,
    int32_t objnum, int32_t attack_type, int32_t max_speed,
    int32_t* out_vx, int32_t* out_vy, int32_t* out_vz)
{
    int32_t nvx = vx - c_oracle_fixmul(px, frame_time * 16);
    int32_t nvy = vy - c_oracle_fixmul(py, frame_time * 16);
    int32_t nvz = vz - c_oracle_fixmul(pz, frame_time * 16);

    if (attack_type)
    {
        int objref = (objnum ^ ((frame_count + 3 * objnum) >> 5)) & 3;
        int32_t s = frame_time << 5;
        c_oracle_vec3 vel = { nvx, nvy, nvz };
        switch (objref)
        {
        case 0: { c_oracle_vec3 u = { ux, uy, uz }; c_oracle_vm_vec_scale_add2(&vel, &u, s); break; }
        case 1: { c_oracle_vec3 u = { ux, uy, uz }; c_oracle_vm_vec_scale_add2(&vel, &u, -s); break; }
        case 2: { c_oracle_vec3 r = { rx, ry, rz }; c_oracle_vm_vec_scale_add2(&vel, &r, s); break; }
        default: { c_oracle_vec3 r = { rx, ry, rz }; c_oracle_vm_vec_scale_add2(&vel, &r, -s); break; }
        }
        nvx = vel.x; nvy = vel.y; nvz = vel.z;
    }

    c_oracle_vec3 nv = { nvx, nvy, nvz };
    int32_t speed = c_oracle_vm_vec_mag_quick(&nv);
    if (speed > max_speed)
    {
        nvx = nvx * 3 / 4;
        nvy = nvy * 3 / 4;
        nvz = nvz * 3 / 4;
    }
    *out_vx = nvx; *out_vy = nvy; *out_vz = nvz;
}

extern "C" void c_oracle_set_object_turnroll(
    int32_t rotvel_y, int32_t turnroll, int32_t frame_time,
    int32_t* out_turnroll)
{
    int32_t trs = 0x4ec4 / 2;  /* TURNROLL_SCALE */
    int32_t rr = 0x2000;       /* ROLL_RATE */

    int32_t desired_bank = -c_oracle_fixmul(rotvel_y, trs);

    if (turnroll != desired_bank)
    {
        int32_t max_roll = c_oracle_fixmul(rr, frame_time);
        int32_t delta_ang = desired_bank - turnroll;

        if (labs(delta_ang) < max_roll)
            max_roll = delta_ang;
        else if (delta_ang < 0)
            max_roll = -max_roll;

        *out_turnroll = turnroll + max_roll;
    }
    else
    {
        *out_turnroll = turnroll;
    }
}

static int32_t c_oracle_compute_lead_component(
    int32_t player_pos, int32_t robot_pos, int32_t player_vel, int32_t elapsed_time)
{
    return c_oracle_fixdiv(player_pos - robot_pos, elapsed_time) + player_vel;
}

extern "C" void c_oracle_lead_player(
    int32_t fpx, int32_t fpy, int32_t fpz,
    int32_t bpx, int32_t bpy, int32_t bpz,
    int32_t pvx, int32_t pvy, int32_t pvz,
    int32_t fvx, int32_t fvy, int32_t fvz,
    int32_t player_cloaked, int32_t max_weapon_speed, int32_t is_matter,
    int32_t difficulty_level,
    int32_t* out_success, int32_t* out_fx, int32_t* out_fy, int32_t* out_fz)
{
    int32_t one = 0x10000;
    int32_t ndl = 5;
    int32_t min_lead_spd = one * 4;
    int32_t max_lead_dist = one * 200;
    int32_t lead_rng = one / 2;

    *out_success = 0; *out_fx = 0; *out_fy = 0; *out_fz = 0;

    if (player_cloaked)
        return;

    c_oracle_vec3 player_movement_dir = { pvx, pvy, pvz };
    c_oracle_vm_vec_normalize_quick(&player_movement_dir);
    c_oracle_vec3 pvel = { pvx, pvy, pvz };
    int32_t player_speed = c_oracle_vm_vec_mag_quick(&pvel);

    if (player_speed < min_lead_spd)
        return;

    c_oracle_vec3 fire_pt = { fpx, fpy, fpz };
    c_oracle_vec3 bpp = { bpx, bpy, bpz };
    c_oracle_vec3 vec_to_player;
    c_oracle_vm_vec_sub(&vec_to_player, &bpp, &fire_pt);
    int32_t dist_to_player = c_oracle_vm_vec_mag_quick(&vec_to_player);
    c_oracle_vec3 vec_to_player_norm = vec_to_player;
    c_oracle_vm_vec_normalize_quick(&vec_to_player_norm);

    if (dist_to_player > max_lead_dist)
        return;

    int32_t dot = c_oracle_vm_vec_dotprod(&vec_to_player_norm, &player_movement_dir);

    if (dot < -lead_rng || dot > lead_rng)
        return;

    if (max_weapon_speed < one)
        return;

    if (is_matter)
    {
        if (difficulty_level <= 1)
            return;
        else
            max_weapon_speed *= (ndl - difficulty_level);
    }

    if (max_weapon_speed == 0)
        return;

    int32_t projected_time = c_oracle_fixdiv(dist_to_player, max_weapon_speed);

    c_oracle_vec3 fire_vec;
    fire_vec.x = c_oracle_compute_lead_component(bpx, fpx, pvx, projected_time);
    fire_vec.y = c_oracle_compute_lead_component(bpy, fpy, pvy, projected_time);
    fire_vec.z = c_oracle_compute_lead_component(bpz, fpz, pvz, projected_time);

    c_oracle_vm_vec_normalize_quick(&fire_vec);

    c_oracle_vec3 fwd = { fvx, fvy, fvz };
    int32_t dot_fvec = c_oracle_vm_vec_dotprod(&fire_vec, &fwd);

    if (dot_fvec < one / 2)
    {
        c_oracle_vec3 adjusted;
        c_oracle_vm_vec_add(&adjusted, &fire_vec, &vec_to_player_norm);
        adjusted.x /= 2;
        adjusted.y /= 2;
        adjusted.z /= 2;

        int32_t dot2 = c_oracle_vm_vec_dotprod(&adjusted, &fwd);
        if (dot2 < one / 2)
            return;

        *out_success = 1;
        *out_fx = adjusted.x;
        *out_fy = adjusted.y;
        *out_fz = adjusted.z;
        return;
    }

    *out_success = 1;
    *out_fx = fire_vec.x;
    *out_fy = fire_vec.y;
    *out_fz = fire_vec.z;
}

/* homing_missile_turn_towards_velocity:
   Blend normalized velocity into forward vector and re-derive orientation.
   HOMING_MISSILE_SCALE = 8 */
void c_oracle_homing_missile_turn_towards_velocity(
    int32_t nvx, int32_t nvy, int32_t nvz,
    int32_t fx, int32_t fy, int32_t fz,
    int32_t frame_time,
    int32_t* out_orient)
{
    const int32_t hms = 8;
    int32_t s = frame_time * hms;

    c_oracle_vec3 new_fvec;
    new_fvec.x = c_oracle_fixmul(nvx, s) + fx;
    new_fvec.y = c_oracle_fixmul(nvy, s) + fy;
    new_fvec.z = c_oracle_fixmul(nvz, s) + fz;

    c_oracle_vm_vec_normalize_quick(&new_fvec);

    c_oracle_mat3 orient;
    c_oracle_vm_vector_2_matrix(&orient, &new_fvec, NULL, NULL);

    out_orient[0] = orient.rvec.x; out_orient[1] = orient.rvec.y; out_orient[2] = orient.rvec.z;
    out_orient[3] = orient.uvec.x; out_orient[4] = orient.uvec.y; out_orient[5] = orient.uvec.z;
    out_orient[6] = orient.fvec.x; out_orient[7] = orient.fvec.y; out_orient[8] = orient.fvec.z;
}

void c_oracle_do_physics_align_object(
    const int32_t* packed, int packed_len,
    int32_t* out_buf)
{
    (void)packed_len;
    const int32_t DAMP_ANG_VAL = 0x400;

    /* Unpack side normals[0] (indices 0..17) */
    c_oracle_vec3 side_normal0[6];
    for (int i = 0; i < 6; i++) {
        int base = i * 3;
        side_normal0[i].x = packed[base];
        side_normal0[i].y = packed[base + 1];
        side_normal0[i].z = packed[base + 2];
    }
    /* Unpack side normals[1] (indices 18..35) */
    c_oracle_vec3 side_normal1[6];
    for (int i = 0; i < 6; i++) {
        int base = 18 + i * 3;
        side_normal1[i].x = packed[base];
        side_normal1[i].y = packed[base + 1];
        side_normal1[i].z = packed[base + 2];
    }
    /* Unpack num_faces (indices 36..41) */
    int num_faces[6];
    for (int i = 0; i < 6; i++)
        num_faces[i] = packed[36 + i];

    /* Unpack orient (indices 42..50) */
    c_oracle_mat3 orient;
    orient.rvec.x = packed[42]; orient.rvec.y = packed[43]; orient.rvec.z = packed[44];
    orient.uvec.x = packed[45]; orient.uvec.y = packed[46]; orient.uvec.z = packed[47];
    orient.fvec.x = packed[48]; orient.fvec.y = packed[49]; orient.fvec.z = packed[50];

    int32_t turnroll = packed[51];
    int floor_levelling = packed[52];
    int32_t frame_time = packed[53];

    /* Find side most aligned with up vector */
    int best_side = 0;
    int32_t largest_d = -(int32_t)0x10000;
    for (int i = 0; i < 6; i++) {
        int32_t d = c_oracle_vm_vec_dotprod(&side_normal0[i], &orient.uvec);
        if (d > largest_d) { largest_d = d; best_side = i; }
    }

    /* Determine desired up vector */
    c_oracle_vec3 desired_upvec;
    if (floor_levelling) {
        desired_upvec = side_normal0[3];
    } else if (num_faces[best_side] == 2) {
        desired_upvec.x = (side_normal0[best_side].x + side_normal1[best_side].x) / 2;
        desired_upvec.y = (side_normal0[best_side].y + side_normal1[best_side].y) / 2;
        desired_upvec.z = (side_normal0[best_side].z + side_normal1[best_side].z) / 2;
        c_oracle_vm_vec_copy_normalize(&desired_upvec, &desired_upvec);
    } else {
        desired_upvec = side_normal0[best_side];
    }

    /* Default: no change */
    out_buf[0] = 0;  /* tag = no orient change */
    out_buf[1] = orient.rvec.x; out_buf[2] = orient.rvec.y; out_buf[3] = orient.rvec.z;
    out_buf[4] = orient.uvec.x; out_buf[5] = orient.uvec.y; out_buf[6] = orient.uvec.z;
    out_buf[7] = orient.fvec.x; out_buf[8] = orient.fvec.y; out_buf[9] = orient.fvec.z;
    out_buf[10] = floor_levelling;

    if (labs(c_oracle_vm_vec_dotprod(&desired_upvec, &orient.fvec)) < (int32_t)0x10000 / 2) {
        c_oracle_mat3 temp_matrix;
        c_oracle_vm_vector_2_matrix(&temp_matrix, &orient.fvec, &desired_upvec, NULL);

        int16_t delta_ang = c_oracle_vm_vec_delta_ang(
            &orient.uvec, &temp_matrix.uvec, &orient.fvec);

        delta_ang += (int16_t)turnroll;

        if (abs(delta_ang) > DAMP_ANG_VAL) {
            int32_t roll_ang = c_oracle_fixmul(frame_time, ROLL_RATE);

            if (abs(delta_ang) < roll_ang) roll_ang = delta_ang;
            else if (delta_ang < 0) roll_ang = -roll_ang;

            c_oracle_ang3 tangles;
            tangles.p = 0; tangles.h = 0; tangles.b = (int16_t)roll_ang;
            c_oracle_mat3 rotmat;
            c_oracle_vm_angles_2_matrix(&rotmat, &tangles);

            c_oracle_mat3 new_pm;
            c_oracle_vm_matrix_x_matrix(&new_pm, &orient, &rotmat);

            out_buf[0] = 1;  /* tag = orient changed */
            out_buf[1] = new_pm.rvec.x; out_buf[2] = new_pm.rvec.y; out_buf[3] = new_pm.rvec.z;
            out_buf[4] = new_pm.uvec.x; out_buf[5] = new_pm.uvec.y; out_buf[6] = new_pm.uvec.z;
            out_buf[7] = new_pm.fvec.x; out_buf[8] = new_pm.fvec.y; out_buf[9] = new_pm.fvec.z;
            /* floor_levelling stays the same */
        } else {
            /* Delta is small: stop levelling */
            out_buf[10] = 0;
        }
    }
}

/* Forward declaration from c_oracle_fvi */
extern "C" int c_oracle_check_vector_to_sphere_1(
    c_oracle_vec3* intp,
    const c_oracle_vec3* p0, const c_oracle_vec3* p1,
    const c_oracle_vec3* sphere_pos, int32_t sphere_rad);

#define OBJ_ROBOT  2
#define OBJ_PLAYER 4
#define OBJ_WEAPON 5

int32_t c_oracle_check_vector_to_object(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t rad,
    int32_t opx, int32_t opy, int32_t opz,
    int32_t obj_size, int obj_type, int attack_type,
    int otherobj_type, int game_mode_coop, int otherobj_parent_type,
    int32_t* out_intpx, int32_t* out_intpy, int32_t* out_intpz)
{
    int32_t size = obj_size;

    if (obj_type == OBJ_ROBOT && attack_type)
        size = (size * 3) / 4;

    if (obj_type == OBJ_PLAYER &&
        ((otherobj_type == OBJ_PLAYER) ||
         (game_mode_coop && otherobj_type == OBJ_WEAPON &&
          otherobj_parent_type == OBJ_PLAYER)))
        size = size / 2;

    c_oracle_vec3 intp, p0, p1, spos;
    p0.x = p0x; p0.y = p0y; p0.z = p0z;
    p1.x = p1x; p1.y = p1y; p1.z = p1z;
    spos.x = opx; spos.y = opy; spos.z = opz;
    int32_t d = c_oracle_check_vector_to_sphere_1(&intp, &p0, &p1, &spos, size + rad);
    *out_intpx = intp.x;
    *out_intpy = intp.y;
    *out_intpz = intp.z;
    return d;
}
