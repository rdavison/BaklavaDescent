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

static void c_oracle_fix_sincos(int32_t a, int32_t* s, int32_t* c)
{
    const int i = (a >> 8) & 0xFF;
    const int f = a & 0xFF;

    const int32_t ss = c_oracle_sincos_lut_entry(i);
    *s = (ss + (((c_oracle_sincos_lut_entry(i + 1) - ss) * f) >> 8)) << 2;

    const int32_t cc = c_oracle_sincos_lut_entry(i + 64);
    *c = (cc + (((c_oracle_sincos_lut_entry(i + 65) - cc) * f) >> 8)) << 2;
}

static int16_t c_oracle_fix_acos(int32_t v)
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

extern "C" int32_t c_oracle_fix_sqrt(int32_t a)
{
    return c_oracle_long_sqrt_ceil(a) << 8;
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
