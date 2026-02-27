extern "C" {
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
}

#include "c_oracle.h"
#include "c_oracle_gameseg.h"
#include "c_oracle_fvi.h"
#include "c_oracle_curves.h"

extern "C" CAMLprim value caml_c_i2f(value i)
{
    return Val_long(c_oracle_i2f(Int_val(i)));
}

extern "C" CAMLprim value caml_c_f2i(value f)
{
    return Val_long(c_oracle_f2i(Int_val(f)));
}

extern "C" CAMLprim value caml_c_fixmul(value a, value b)
{
    return Val_long(c_oracle_fixmul(Int_val(a), Int_val(b)));
}

extern "C" CAMLprim value caml_c_fixdiv(value a, value b)
{
    return Val_long(c_oracle_fixdiv(Int_val(a), Int_val(b)));
}

extern "C" CAMLprim value caml_c_fixmuldiv(value a, value b, value c)
{
    return Val_long(c_oracle_fixmuldiv(Int_val(a), Int_val(b), Int_val(c)));
}

extern "C" CAMLprim value caml_c_long_sqrt(value a)
{
    return Val_long(c_oracle_long_sqrt(Int_val(a)));
}

extern "C" CAMLprim value caml_c_quad_sqrt(value q)
{
    return Val_long(c_oracle_quad_sqrt(Int64_val(q)));
}

extern "C" CAMLprim value caml_c_fixquadadjust(value q)
{
    return Val_long(c_oracle_fixquadadjust(Int64_val(q)));
}

extern "C" CAMLprim value caml_c_fixmulaccum(value q, value a, value b)
{
    return caml_copy_int64(c_oracle_fixmulaccum(Int64_val(q), Int_val(a), Int_val(b)));
}

extern "C" CAMLprim value caml_c_fixdivquadlong(value n, value d)
{
    return Val_long(c_oracle_fixdivquadlong(Int64_val(n), Int_val(d)));
}

extern "C" CAMLprim value caml_c_fixquadnegate(value low, value high)
{
    CAMLparam2(low, high);
    CAMLlocal1(out);

    int32_t low_i = Int_val(low);
    int32_t high_i = Int_val(high);
    c_oracle_fixquadnegate(&low_i, &high_i);

    out = caml_alloc_tuple(2);
    Store_field(out, 0, Val_long(low_i));
    Store_field(out, 1, Val_long(high_i));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_ufixdivquadlong(value nl, value nh, value d)
{
    return Val_long(c_oracle_ufixdivquadlong(Int_val(nl), Int_val(nh), Int_val(d)));
}

extern "C" CAMLprim value caml_c_fix_sqrt(value a)
{
    return Val_long(c_oracle_fix_sqrt(Int_val(a)));
}

extern "C" CAMLprim value caml_c_fix_isqrt(value a)
{
    return Val_long(c_oracle_fix_isqrt(Int_val(a)));
}

extern "C" CAMLprim value caml_c_fix_sincos(value a)
{
    CAMLparam1(a);
    CAMLlocal1(out);

    int32_t s = 0;
    int32_t c = 0;
    c_oracle_fix_sincos(Int_val(a), &s, &c);

    out = caml_alloc_tuple(2);
    Store_field(out, 0, Val_long(s));
    Store_field(out, 1, Val_long(c));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_fix_fastsincos(value a)
{
    CAMLparam1(a);
    CAMLlocal1(out);

    int32_t s = 0;
    int32_t c = 0;
    c_oracle_fix_fastsincos(Int_val(a), &s, &c);

    out = caml_alloc_tuple(2);
    Store_field(out, 0, Val_long(s));
    Store_field(out, 1, Val_long(c));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_fix_acos(value v)
{
    return Val_long(c_oracle_fix_acos(Int_val(v)));
}

extern "C" CAMLprim value caml_c_fix_asin(value v)
{
    return Val_long(c_oracle_fix_asin(Int_val(v)));
}

extern "C" CAMLprim value caml_c_fix_atan2(value cosv, value sinv)
{
    return Val_long(c_oracle_fix_atan2(Int_val(cosv), Int_val(sinv)));
}

extern "C" CAMLprim value caml_c_vm_vec_scale_add2(
    value dx,
    value dy,
    value dz,
    value sx,
    value sy,
    value sz,
    value k)
{
    CAMLparam5(dx, dy, dz, sx, sy);
    CAMLxparam2(sz, k);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { Int_val(dx), Int_val(dy), Int_val(dz) };
    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };

    c_oracle_vm_vec_scale_add2(&dest, &src, Int_val(k));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_scale_add2_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_scale_add2(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

extern "C" CAMLprim value caml_c_vm_vec_scale_add(
    value ax,
    value ay,
    value az,
    value bx,
    value by,
    value bz,
    value k)
{
    CAMLparam5(ax, ay, az, bx, by);
    CAMLxparam2(bz, k);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { 0, 0, 0 };
    const c_oracle_vec3 src1 = { Int_val(ax), Int_val(ay), Int_val(az) };
    const c_oracle_vec3 src2 = { Int_val(bx), Int_val(by), Int_val(bz) };

    c_oracle_vm_vec_scale_add(&dest, &src1, &src2, Int_val(k));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_scale_add_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_scale_add(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

extern "C" CAMLprim value caml_c_vm_vec_scale2(value dx, value dy, value dz, value n, value d)
{
    CAMLparam5(dx, dy, dz, n, d);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { Int_val(dx), Int_val(dy), Int_val(dz) };
    c_oracle_vm_vec_scale2(&dest, Int_val(n), Int_val(d));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_add(value ax, value ay, value az, value bx, value by, value bz)
{
    CAMLparam5(ax, ay, az, bx, by);
    CAMLxparam1(bz);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { 0, 0, 0 };
    const c_oracle_vec3 src0 = { Int_val(ax), Int_val(ay), Int_val(az) };
    const c_oracle_vec3 src1 = { Int_val(bx), Int_val(by), Int_val(bz) };

    c_oracle_vm_vec_add(&dest, &src0, &src1);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_add_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_add(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_sub(value ax, value ay, value az, value bx, value by, value bz)
{
    CAMLparam5(ax, ay, az, bx, by);
    CAMLxparam1(bz);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { 0, 0, 0 };
    const c_oracle_vec3 src0 = { Int_val(ax), Int_val(ay), Int_val(az) };
    const c_oracle_vec3 src1 = { Int_val(bx), Int_val(by), Int_val(bz) };

    c_oracle_vm_vec_sub(&dest, &src0, &src1);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_sub_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_sub(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_add2(value dx, value dy, value dz, value sx, value sy, value sz)
{
    CAMLparam5(dx, dy, dz, sx, sy);
    CAMLxparam1(sz);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { Int_val(dx), Int_val(dy), Int_val(dz) };
    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };

    c_oracle_vm_vec_add2(&dest, &src);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_add2_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_add2(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_sub2(value dx, value dy, value dz, value sx, value sy, value sz)
{
    CAMLparam5(dx, dy, dz, sx, sy);
    CAMLxparam1(sz);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { Int_val(dx), Int_val(dy), Int_val(dz) };
    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };

    c_oracle_vm_vec_sub2(&dest, &src);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_sub2_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_sub2(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_avg(value ax, value ay, value az, value bx, value by, value bz)
{
    CAMLparam5(ax, ay, az, bx, by);
    CAMLxparam1(bz);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { 0, 0, 0 };
    const c_oracle_vec3 src0 = { Int_val(ax), Int_val(ay), Int_val(az) };
    const c_oracle_vec3 src1 = { Int_val(bx), Int_val(by), Int_val(bz) };

    c_oracle_vm_vec_avg(&dest, &src0, &src1);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_avg_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_avg(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_avg4(
    value a1,
    value a2,
    value a3,
    value b1,
    value b2,
    value b3,
    value c1,
    value c2,
    value c3,
    value d1,
    value d2,
    value d3)
{
    CAMLparam5(a1, a2, a3, b1, b2);
    CAMLxparam5(b3, c1, c2, c3, d1);
    CAMLxparam2(d2, d3);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { 0, 0, 0 };
    const c_oracle_vec3 src0 = { Int_val(a1), Int_val(a2), Int_val(a3) };
    const c_oracle_vec3 src1 = { Int_val(b1), Int_val(b2), Int_val(b3) };
    const c_oracle_vec3 src2 = { Int_val(c1), Int_val(c2), Int_val(c3) };
    const c_oracle_vec3 src3 = { Int_val(d1), Int_val(d2), Int_val(d3) };

    c_oracle_vm_vec_avg4(&dest, &src0, &src1, &src2, &src3);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_avg4_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_avg4(
        argv[0],
        argv[1],
        argv[2],
        argv[3],
        argv[4],
        argv[5],
        argv[6],
        argv[7],
        argv[8],
        argv[9],
        argv[10],
        argv[11]);
}

extern "C" CAMLprim value caml_c_vm_vec_copy_scale(value sx, value sy, value sz, value k)
{
    CAMLparam4(sx, sy, sz, k);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { 0, 0, 0 };
    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };

    c_oracle_vm_vec_copy_scale(&dest, &src, Int_val(k));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_scale(value dx, value dy, value dz, value k)
{
    CAMLparam4(dx, dy, dz, k);
    CAMLlocal1(out);

    c_oracle_vec3 dest = { Int_val(dx), Int_val(dy), Int_val(dz) };
    c_oracle_vm_vec_scale(&dest, Int_val(k));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_mag_quick(value x, value y, value z)
{
    c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    return Val_long(c_oracle_vm_vec_mag_quick(&v));
}

extern "C" CAMLprim value caml_c_vm_vec_mag(value x, value y, value z)
{
    c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    return Val_long(c_oracle_vm_vec_mag(&v));
}

extern "C" CAMLprim value caml_c_vm_vec_dist_quick(value x0, value y0, value z0, value x1, value y1, value z1)
{
    c_oracle_vec3 v0 = { Int_val(x0), Int_val(y0), Int_val(z0) };
    c_oracle_vec3 v1 = { Int_val(x1), Int_val(y1), Int_val(z1) };
    return Val_long(c_oracle_vm_vec_dist_quick(&v0, &v1));
}

extern "C" CAMLprim value caml_c_vm_vec_dist(value x0, value y0, value z0, value x1, value y1, value z1)
{
    c_oracle_vec3 v0 = { Int_val(x0), Int_val(y0), Int_val(z0) };
    c_oracle_vec3 v1 = { Int_val(x1), Int_val(y1), Int_val(z1) };
    return Val_long(c_oracle_vm_vec_dist(&v0, &v1));
}

extern "C" CAMLprim value caml_c_vm_vec_dist_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_dist(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_dist_quick_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_dist_quick(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_dotprod(value x0, value y0, value z0, value x1, value y1, value z1)
{
    c_oracle_vec3 v0 = { Int_val(x0), Int_val(y0), Int_val(z0) };
    c_oracle_vec3 v1 = { Int_val(x1), Int_val(y1), Int_val(z1) };
    return Val_long(c_oracle_vm_vec_dotprod(&v0, &v1));
}

extern "C" CAMLprim value caml_c_vm_vec_dotprod_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_dotprod(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_dot3(value x, value y, value z, value vx, value vy, value vz)
{
    c_oracle_vec3 v = { Int_val(vx), Int_val(vy), Int_val(vz) };
    return Val_long(c_oracle_vm_vec_dot3(Int_val(x), Int_val(y), Int_val(z), &v));
}

extern "C" CAMLprim value caml_c_vm_vec_dot3_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_dot3(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_crossprod(value x0, value y0, value z0, value x1, value y1, value z1)
{
    CAMLparam5(x0, y0, z0, x1, y1);
    CAMLxparam1(z1);
    CAMLlocal1(out);

    c_oracle_vec3 src0 = { Int_val(x0), Int_val(y0), Int_val(z0) };
    c_oracle_vec3 src1 = { Int_val(x1), Int_val(y1), Int_val(z1) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    c_oracle_vm_vec_crossprod(&dest, &src0, &src1);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_crossprod_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_crossprod(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_copy_normalize(value sx, value sy, value sz)
{
    CAMLparam3(sx, sy, sz);
    CAMLlocal1(out);

    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    const int32_t m = c_oracle_vm_vec_copy_normalize(&dest, &src);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(m));
    Store_field(out, 1, Val_long(dest.x));
    Store_field(out, 2, Val_long(dest.y));
    Store_field(out, 3, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normalize(value x, value y, value z)
{
    CAMLparam3(x, y, z);
    CAMLlocal1(out);

    c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    const int32_t m = c_oracle_vm_vec_normalize(&v);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(m));
    Store_field(out, 1, Val_long(v.x));
    Store_field(out, 2, Val_long(v.y));
    Store_field(out, 3, Val_long(v.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normalized_dir(
    value ex,
    value ey,
    value ez,
    value sx,
    value sy,
    value sz)
{
    CAMLparam5(ex, ey, ez, sx, sy);
    CAMLxparam1(sz);
    CAMLlocal1(out);

    const c_oracle_vec3 end = { Int_val(ex), Int_val(ey), Int_val(ez) };
    const c_oracle_vec3 start = { Int_val(sx), Int_val(sy), Int_val(sz) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    const int32_t m = c_oracle_vm_vec_normalized_dir(&dest, &end, &start);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(m));
    Store_field(out, 1, Val_long(dest.x));
    Store_field(out, 2, Val_long(dest.y));
    Store_field(out, 3, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normalized_dir_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_normalized_dir(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_copy_normalize_quick(value sx, value sy, value sz)
{
    CAMLparam3(sx, sy, sz);
    CAMLlocal1(out);

    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    const int32_t m = c_oracle_vm_vec_copy_normalize_quick(&dest, &src);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(m));
    Store_field(out, 1, Val_long(dest.x));
    Store_field(out, 2, Val_long(dest.y));
    Store_field(out, 3, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normalize_quick(value x, value y, value z)
{
    CAMLparam3(x, y, z);
    CAMLlocal1(out);

    c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    const int32_t m = c_oracle_vm_vec_normalize_quick(&v);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(m));
    Store_field(out, 1, Val_long(v.x));
    Store_field(out, 2, Val_long(v.y));
    Store_field(out, 3, Val_long(v.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normalized_dir_quick(
    value ex,
    value ey,
    value ez,
    value sx,
    value sy,
    value sz)
{
    CAMLparam5(ex, ey, ez, sx, sy);
    CAMLxparam1(sz);
    CAMLlocal1(out);

    const c_oracle_vec3 end = { Int_val(ex), Int_val(ey), Int_val(ez) };
    const c_oracle_vec3 start = { Int_val(sx), Int_val(sy), Int_val(sz) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    const int32_t m = c_oracle_vm_vec_normalized_dir_quick(&dest, &end, &start);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(m));
    Store_field(out, 1, Val_long(dest.x));
    Store_field(out, 2, Val_long(dest.y));
    Store_field(out, 3, Val_long(dest.z));

    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normalized_dir_quick_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_normalized_dir_quick(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vec_make(value x, value y, value z)
{
    CAMLparam3(x, y, z);
    CAMLlocal1(out);

    c_oracle_vec3 v = { 0, 0, 0 };
    c_oracle_vm_vec_make(&v, Int_val(x), Int_val(y), Int_val(z));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(v.x));
    Store_field(out, 1, Val_long(v.y));
    Store_field(out, 2, Val_long(v.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_angvec_make(value p, value b, value h)
{
    CAMLparam3(p, b, h);
    CAMLlocal1(out);

    c_oracle_ang3 v = { 0, 0, 0 };
    c_oracle_vm_angvec_make(
        &v,
        (int16_t)Int_val(p),
        (int16_t)Int_val(b),
        (int16_t)Int_val(h));

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long((int32_t)v.p));
    Store_field(out, 1, Val_long((int32_t)v.b));
    Store_field(out, 2, Val_long((int32_t)v.h));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_dist_to_plane(
    value cx,
    value cy,
    value cz,
    value nx,
    value ny,
    value nz,
    value px,
    value py,
    value pz)
{
    const c_oracle_vec3 checkp = { Int_val(cx), Int_val(cy), Int_val(cz) };
    const c_oracle_vec3 norm = { Int_val(nx), Int_val(ny), Int_val(nz) };
    const c_oracle_vec3 planep = { Int_val(px), Int_val(py), Int_val(pz) };
    return Val_long(c_oracle_vm_dist_to_plane(&checkp, &norm, &planep));
}

extern "C" CAMLprim value caml_c_vm_dist_to_plane_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_dist_to_plane(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_vm_check_vec(value x, value y, value z)
{
    CAMLparam3(x, y, z);
    CAMLlocal1(out);

    c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    c_oracle_vm_check_vec(&v);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(v.x));
    Store_field(out, 1, Val_long(v.y));
    Store_field(out, 2, Val_long(v.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_perp(
    value p0x,
    value p0y,
    value p0z,
    value p1x,
    value p1y,
    value p1z,
    value p2x,
    value p2y,
    value p2z)
{
    CAMLparam5(p0x, p0y, p0z, p1x, p1y);
    CAMLxparam4(p1z, p2x, p2y, p2z);
    CAMLlocal1(out);

    const c_oracle_vec3 p0 = { Int_val(p0x), Int_val(p0y), Int_val(p0z) };
    const c_oracle_vec3 p1 = { Int_val(p1x), Int_val(p1y), Int_val(p1z) };
    const c_oracle_vec3 p2 = { Int_val(p2x), Int_val(p2y), Int_val(p2z) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    c_oracle_vm_vec_perp(&dest, &p0, &p1, &p2);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_perp_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_perp(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_vm_vec_normal(
    value p0x,
    value p0y,
    value p0z,
    value p1x,
    value p1y,
    value p1z,
    value p2x,
    value p2y,
    value p2z)
{
    CAMLparam5(p0x, p0y, p0z, p1x, p1y);
    CAMLxparam4(p1z, p2x, p2y, p2z);
    CAMLlocal1(out);

    const c_oracle_vec3 p0 = { Int_val(p0x), Int_val(p0y), Int_val(p0z) };
    const c_oracle_vec3 p1 = { Int_val(p1x), Int_val(p1y), Int_val(p1z) };
    const c_oracle_vec3 p2 = { Int_val(p2x), Int_val(p2y), Int_val(p2z) };
    c_oracle_vec3 dest = { 0, 0, 0 };
    c_oracle_vm_vec_normal(&dest, &p0, &p1, &p2);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_normal_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_normal(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_vm_vec_delta_ang_norm(
    value v0x,
    value v0y,
    value v0z,
    value v1x,
    value v1y,
    value v1z,
    value has_f,
    value fx,
    value fy,
    value fz)
{
    CAMLparam5(v0x, v0y, v0z, v1x, v1y);
    CAMLxparam5(v1z, has_f, fx, fy, fz);

    const c_oracle_vec3 v0 = { Int_val(v0x), Int_val(v0y), Int_val(v0z) };
    const c_oracle_vec3 v1 = { Int_val(v1x), Int_val(v1y), Int_val(v1z) };
    const c_oracle_vec3 fvec = { Int_val(fx), Int_val(fy), Int_val(fz) };
    const int16_t out =
        c_oracle_vm_vec_delta_ang_norm(&v0, &v1, Bool_val(has_f) ? &fvec : nullptr);

    CAMLreturn(Val_long(out));
}

extern "C" CAMLprim value caml_c_vm_vec_delta_ang_norm_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_delta_ang_norm(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9]);
}

extern "C" CAMLprim value caml_c_vm_vec_delta_ang(
    value v0x,
    value v0y,
    value v0z,
    value v1x,
    value v1y,
    value v1z,
    value has_f,
    value fx,
    value fy,
    value fz)
{
    CAMLparam5(v0x, v0y, v0z, v1x, v1y);
    CAMLxparam5(v1z, has_f, fx, fy, fz);

    const c_oracle_vec3 v0 = { Int_val(v0x), Int_val(v0y), Int_val(v0z) };
    const c_oracle_vec3 v1 = { Int_val(v1x), Int_val(v1y), Int_val(v1z) };
    const c_oracle_vec3 fvec = { Int_val(fx), Int_val(fy), Int_val(fz) };
    const int16_t out =
        c_oracle_vm_vec_delta_ang(&v0, &v1, Bool_val(has_f) ? &fvec : nullptr);

    CAMLreturn(Val_long(out));
}

extern "C" CAMLprim value caml_c_vm_vec_delta_ang_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_delta_ang(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9]);
}

extern "C" CAMLprim value caml_c_sincos_2_matrix(
    value sinp,
    value cosp,
    value sinb,
    value cosb,
    value sinh,
    value cosh)
{
    CAMLparam5(sinp, cosp, sinb, cosb, sinh);
    CAMLxparam1(cosh);
    CAMLlocal1(out);

    c_oracle_mat3 dest = {};
    c_oracle_sincos_2_matrix(
        &dest,
        Int_val(sinp),
        Int_val(cosp),
        Int_val(sinb),
        Int_val(cosb),
        Int_val(sinh),
        Int_val(cosh));

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_sincos_2_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_sincos_2_matrix(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_angles_2_matrix(value p, value b, value h)
{
    CAMLparam3(p, b, h);
    CAMLlocal1(out);

    const c_oracle_ang3 a = {
        static_cast<int16_t>(Int_val(p)),
        static_cast<int16_t>(Int_val(b)),
        static_cast<int16_t>(Int_val(h))
    };
    c_oracle_mat3 dest = {};
    c_oracle_vm_angles_2_matrix(&dest, &a);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_angles_2_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_angles_2_matrix(argv[0], argv[1], argv[2]);
}

extern "C" CAMLprim value caml_c_vm_vec_ang_2_matrix(value vx, value vy, value vz, value a)
{
    CAMLparam4(vx, vy, vz, a);
    CAMLlocal1(out);

    const c_oracle_vec3 v = { Int_val(vx), Int_val(vy), Int_val(vz) };
    c_oracle_mat3 dest = {};
    c_oracle_vm_vec_ang_2_matrix(&dest, &v, static_cast<int16_t>(Int_val(a)));

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_ang_2_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_ang_2_matrix(argv[0], argv[1], argv[2], argv[3]);
}

extern "C" CAMLprim value caml_c_vm_extract_angles_matrix(
    value rx,
    value ry,
    value rz,
    value ux,
    value uy,
    value uz,
    value fx,
    value fy,
    value fz)
{
    CAMLparam5(rx, ry, rz, ux, uy);
    CAMLxparam4(uz, fx, fy, fz);
    CAMLlocal1(out);

    const c_oracle_mat3 m = {
        { Int_val(rx), Int_val(ry), Int_val(rz) },
        { Int_val(ux), Int_val(uy), Int_val(uz) },
        { Int_val(fx), Int_val(fy), Int_val(fz) }
    };

    c_oracle_ang3 a = { 0, 0, 0 };
    c_oracle_vm_extract_angles_matrix(&a, &m);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(a.p));
    Store_field(out, 1, Val_long(a.b));
    Store_field(out, 2, Val_long(a.h));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_extract_angles_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_extract_angles_matrix(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_vm_extract_angles_vector_normalized(value x, value y, value z)
{
    CAMLparam3(x, y, z);
    CAMLlocal1(out);

    const c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    c_oracle_ang3 a = { 0, 0, 0 };
    c_oracle_vm_extract_angles_vector_normalized(&a, &v);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(a.p));
    Store_field(out, 1, Val_long(a.b));
    Store_field(out, 2, Val_long(a.h));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_extract_angles_vector(
    value p,
    value b,
    value h,
    value x,
    value y,
    value z)
{
    CAMLparam5(p, b, h, x, y);
    CAMLxparam1(z);
    CAMLlocal1(out);

    c_oracle_ang3 a = {
        static_cast<int16_t>(Int_val(p)),
        static_cast<int16_t>(Int_val(b)),
        static_cast<int16_t>(Int_val(h))
    };
    const c_oracle_vec3 v = { Int_val(x), Int_val(y), Int_val(z) };
    c_oracle_vm_extract_angles_vector(&a, &v);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(a.p));
    Store_field(out, 1, Val_long(a.b));
    Store_field(out, 2, Val_long(a.h));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_extract_angles_vector_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_extract_angles_vector(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

extern "C" CAMLprim value caml_c_vm_vector_2_matrix(
    value fx,
    value fy,
    value fz,
    value has_u,
    value ux,
    value uy,
    value uz,
    value has_r,
    value rx,
    value ry,
    value rz)
{
    CAMLparam5(fx, fy, fz, has_u, ux);
    CAMLxparam5(uy, uz, has_r, rx, ry);
    CAMLxparam1(rz);
    CAMLlocal1(out);

    const c_oracle_vec3 fvec = { Int_val(fx), Int_val(fy), Int_val(fz) };
    const c_oracle_vec3 uvec = { Int_val(ux), Int_val(uy), Int_val(uz) };
    const c_oracle_vec3 rvec = { Int_val(rx), Int_val(ry), Int_val(rz) };
    c_oracle_mat3 dest = {};
    c_oracle_vm_vector_2_matrix(
        &dest,
        &fvec,
        Bool_val(has_u) ? &uvec : nullptr,
        Bool_val(has_r) ? &rvec : nullptr);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vector_2_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vector_2_matrix(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10]);
}

extern "C" CAMLprim value caml_c_vm_vector_2_matrix_norm(
    value fx,
    value fy,
    value fz,
    value has_u,
    value ux,
    value uy,
    value uz,
    value has_r,
    value rx,
    value ry,
    value rz)
{
    CAMLparam5(fx, fy, fz, has_u, ux);
    CAMLxparam5(uy, uz, has_r, rx, ry);
    CAMLxparam1(rz);
    CAMLlocal1(out);

    const c_oracle_vec3 fvec = { Int_val(fx), Int_val(fy), Int_val(fz) };
    const c_oracle_vec3 uvec = { Int_val(ux), Int_val(uy), Int_val(uz) };
    const c_oracle_vec3 rvec = { Int_val(rx), Int_val(ry), Int_val(rz) };
    c_oracle_mat3 dest = {};
    c_oracle_vm_vector_2_matrix_norm(
        &dest,
        &fvec,
        Bool_val(has_u) ? &uvec : nullptr,
        Bool_val(has_r) ? &rvec : nullptr);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vector_2_matrix_norm_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vector_2_matrix_norm(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10]);
}

extern "C" CAMLprim value caml_c_vm_vec_rotate(
    value sx,
    value sy,
    value sz,
    value rx,
    value ry,
    value rz,
    value ux,
    value uy,
    value uz,
    value fx,
    value fy,
    value fz)
{
    CAMLparam5(sx, sy, sz, rx, ry);
    CAMLxparam5(rz, ux, uy, uz, fx);
    CAMLxparam2(fy, fz);
    CAMLlocal1(out);

    const c_oracle_vec3 src = { Int_val(sx), Int_val(sy), Int_val(sz) };
    const c_oracle_mat3 m = {
        { Int_val(rx), Int_val(ry), Int_val(rz) },
        { Int_val(ux), Int_val(uy), Int_val(uz) },
        { Int_val(fx), Int_val(fy), Int_val(fz) }
    };
    c_oracle_vec3 dest = { 0, 0, 0 };
    c_oracle_vm_vec_rotate(&dest, &src, &m);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_vec_rotate_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_vec_rotate(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8], argv[9], argv[10], argv[11]);
}

extern "C" CAMLprim value caml_c_vm_transpose_matrix(
    value rx,
    value ry,
    value rz,
    value ux,
    value uy,
    value uz,
    value fx,
    value fy,
    value fz)
{
    CAMLparam5(rx, ry, rz, ux, uy);
    CAMLxparam4(uz, fx, fy, fz);
    CAMLlocal1(out);

    c_oracle_mat3 m = {
        { Int_val(rx), Int_val(ry), Int_val(rz) },
        { Int_val(ux), Int_val(uy), Int_val(uz) },
        { Int_val(fx), Int_val(fy), Int_val(fz) }
    };
    c_oracle_vm_transpose_matrix(&m);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(m.rvec.x));
    Store_field(out, 1, Val_long(m.rvec.y));
    Store_field(out, 2, Val_long(m.rvec.z));
    Store_field(out, 3, Val_long(m.uvec.x));
    Store_field(out, 4, Val_long(m.uvec.y));
    Store_field(out, 5, Val_long(m.uvec.z));
    Store_field(out, 6, Val_long(m.fvec.x));
    Store_field(out, 7, Val_long(m.fvec.y));
    Store_field(out, 8, Val_long(m.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_transpose_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_transpose_matrix(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_vm_copy_transpose_matrix(
    value rx,
    value ry,
    value rz,
    value ux,
    value uy,
    value uz,
    value fx,
    value fy,
    value fz)
{
    CAMLparam5(rx, ry, rz, ux, uy);
    CAMLxparam4(uz, fx, fy, fz);
    CAMLlocal1(out);

    const c_oracle_mat3 src = {
        { Int_val(rx), Int_val(ry), Int_val(rz) },
        { Int_val(ux), Int_val(uy), Int_val(uz) },
        { Int_val(fx), Int_val(fy), Int_val(fz) }
    };
    c_oracle_mat3 dest = {};
    c_oracle_vm_copy_transpose_matrix(&dest, &src);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_copy_transpose_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_copy_transpose_matrix(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_vm_matrix_x_matrix(
    value r0x,
    value r0y,
    value r0z,
    value u0x,
    value u0y,
    value u0z,
    value f0x,
    value f0y,
    value f0z,
    value r1x,
    value r1y,
    value r1z,
    value u1x,
    value u1y,
    value u1z,
    value f1x,
    value f1y,
    value f1z)
{
    CAMLparam5(r0x, r0y, r0z, u0x, u0y);
    CAMLxparam5(u0z, f0x, f0y, f0z, r1x);
    CAMLxparam5(r1y, r1z, u1x, u1y, u1z);
    CAMLxparam3(f1x, f1y, f1z);
    CAMLlocal1(out);

    const c_oracle_mat3 src0 = {
        { Int_val(r0x), Int_val(r0y), Int_val(r0z) },
        { Int_val(u0x), Int_val(u0y), Int_val(u0z) },
        { Int_val(f0x), Int_val(f0y), Int_val(f0z) }
    };
    const c_oracle_mat3 src1 = {
        { Int_val(r1x), Int_val(r1y), Int_val(r1z) },
        { Int_val(u1x), Int_val(u1y), Int_val(u1z) },
        { Int_val(f1x), Int_val(f1y), Int_val(f1z) }
    };
    c_oracle_mat3 dest = {};
    c_oracle_vm_matrix_x_matrix(&dest, &src0, &src1);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_vm_matrix_x_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_vm_matrix_x_matrix(
        argv[0],
        argv[1],
        argv[2],
        argv[3],
        argv[4],
        argv[5],
        argv[6],
        argv[7],
        argv[8],
        argv[9],
        argv[10],
        argv[11],
        argv[12],
        argv[13],
        argv[14],
        argv[15],
        argv[16],
        argv[17]);
}

/* ---- 3D pipeline stubs ---- */

extern "C" CAMLprim value caml_c_g3_code_point(value x, value y, value z)
{
    return Val_long(c_oracle_g3_code_point(Int_val(x), Int_val(y), Int_val(z)));
}

extern "C" CAMLprim value caml_c_checkmuldiv(value a, value b, value c)
{
    CAMLparam3(a, b, c);
    CAMLlocal1(out);
    int32_t r = 0;
    int ok = c_oracle_checkmuldiv(&r, Int_val(a), Int_val(b), Int_val(c));
    out = caml_alloc_tuple(2);
    Store_field(out, 0, Val_long(ok));
    Store_field(out, 1, Val_long(r));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_rotate_point(
    value sx, value sy, value sz,
    value vpx, value vpy, value vpz,
    value r1, value r2, value r3,
    value u1, value u2, value u3,
    value f1, value f2, value f3)
{
    CAMLparam5(sx, sy, sz, vpx, vpy);
    CAMLxparam5(vpz, r1, r2, r3, u1);
    CAMLxparam5(u2, u3, f1, f2, f3);
    CAMLlocal1(out);
    int32_t rx, ry, rz;
    uint8_t codes;
    c_oracle_g3_rotate_point(
        Int_val(sx), Int_val(sy), Int_val(sz),
        Int_val(vpx), Int_val(vpy), Int_val(vpz),
        Int_val(r1), Int_val(r2), Int_val(r3),
        Int_val(u1), Int_val(u2), Int_val(u3),
        Int_val(f1), Int_val(f2), Int_val(f3),
        &rx, &ry, &rz, &codes);
    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(rx));
    Store_field(out, 1, Val_long(ry));
    Store_field(out, 2, Val_long(rz));
    Store_field(out, 3, Val_long(codes));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_rotate_point_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_rotate_point(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10], argv[11], argv[12], argv[13], argv[14]);
}

extern "C" CAMLprim value caml_c_g3_project_point(
    value x, value y, value z, value canv_w2, value canv_h2)
{
    CAMLparam5(x, y, z, canv_w2, canv_h2);
    CAMLlocal1(out);
    int32_t sx = 0, sy = 0;
    int ok = c_oracle_g3_project_point(
        Int_val(x), Int_val(y), Int_val(z),
        Int_val(canv_w2), Int_val(canv_h2),
        &sx, &sy);
    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(ok));
    Store_field(out, 1, Val_long(sx));
    Store_field(out, 2, Val_long(sy));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_rotate_delta_x(
    value r1, value r2, value r3,
    value u1, value u2, value u3,
    value f1, value f2, value f3,
    value dx)
{
    CAMLparam5(r1, r2, r3, u1, u2);
    CAMLxparam5(u3, f1, f2, f3, dx);
    CAMLlocal1(out);
    int32_t rx, ry, rz;
    c_oracle_g3_rotate_delta_x(
        Int_val(r1), Int_val(r2), Int_val(r3),
        Int_val(u1), Int_val(u2), Int_val(u3),
        Int_val(f1), Int_val(f2), Int_val(f3),
        Int_val(dx), &rx, &ry, &rz);
    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(rx));
    Store_field(out, 1, Val_long(ry));
    Store_field(out, 2, Val_long(rz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_rotate_delta_x_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_rotate_delta_x(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9]);
}

extern "C" CAMLprim value caml_c_g3_rotate_delta_y(
    value r1, value r2, value r3,
    value u1, value u2, value u3,
    value f1, value f2, value f3,
    value dy)
{
    CAMLparam5(r1, r2, r3, u1, u2);
    CAMLxparam5(u3, f1, f2, f3, dy);
    CAMLlocal1(out);
    int32_t rx, ry, rz;
    c_oracle_g3_rotate_delta_y(
        Int_val(r1), Int_val(r2), Int_val(r3),
        Int_val(u1), Int_val(u2), Int_val(u3),
        Int_val(f1), Int_val(f2), Int_val(f3),
        Int_val(dy), &rx, &ry, &rz);
    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(rx));
    Store_field(out, 1, Val_long(ry));
    Store_field(out, 2, Val_long(rz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_rotate_delta_y_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_rotate_delta_y(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9]);
}

extern "C" CAMLprim value caml_c_g3_rotate_delta_z(
    value r1, value r2, value r3,
    value u1, value u2, value u3,
    value f1, value f2, value f3,
    value dz)
{
    CAMLparam5(r1, r2, r3, u1, u2);
    CAMLxparam5(u3, f1, f2, f3, dz);
    CAMLlocal1(out);
    int32_t rx, ry, rz;
    c_oracle_g3_rotate_delta_z(
        Int_val(r1), Int_val(r2), Int_val(r3),
        Int_val(u1), Int_val(u2), Int_val(u3),
        Int_val(f1), Int_val(f2), Int_val(f3),
        Int_val(dz), &rx, &ry, &rz);
    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(rx));
    Store_field(out, 1, Val_long(ry));
    Store_field(out, 2, Val_long(rz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_rotate_delta_z_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_rotate_delta_z(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9]);
}

extern "C" CAMLprim value caml_c_g3_calc_point_depth(
    value px, value py, value pz,
    value vpx, value vpy, value vpz,
    value fx, value fy, value fz)
{
    return Val_long(c_oracle_g3_calc_point_depth(
        Int_val(px), Int_val(py), Int_val(pz),
        Int_val(vpx), Int_val(vpy), Int_val(vpz),
        Int_val(fx), Int_val(fy), Int_val(fz)));
}

extern "C" CAMLprim value caml_c_g3_calc_point_depth_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_calc_point_depth(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_scale_matrix(
    value r1, value r2, value r3,
    value u1, value u2, value u3,
    value f1, value f2, value f3,
    value wsx, value wsy, value wsz,
    value zoom)
{
    CAMLparam5(r1, r2, r3, u1, u2);
    CAMLxparam5(u3, f1, f2, f3, wsx);
    CAMLxparam3(wsy, wsz, zoom);
    CAMLlocal1(out);
    int32_t or1, or2, or3, ou1, ou2, ou3, of1, of2, of3, msx, msy, msz;
    c_oracle_scale_matrix(
        Int_val(r1), Int_val(r2), Int_val(r3),
        Int_val(u1), Int_val(u2), Int_val(u3),
        Int_val(f1), Int_val(f2), Int_val(f3),
        Int_val(wsx), Int_val(wsy), Int_val(wsz),
        Int_val(zoom),
        &or1, &or2, &or3, &ou1, &ou2, &ou3, &of1, &of2, &of3,
        &msx, &msy, &msz);
    out = caml_alloc_tuple(12);
    Store_field(out, 0, Val_long(or1));
    Store_field(out, 1, Val_long(or2));
    Store_field(out, 2, Val_long(or3));
    Store_field(out, 3, Val_long(ou1));
    Store_field(out, 4, Val_long(ou2));
    Store_field(out, 5, Val_long(ou3));
    Store_field(out, 6, Val_long(of1));
    Store_field(out, 7, Val_long(of2));
    Store_field(out, 8, Val_long(of3));
    Store_field(out, 9, Val_long(msx));
    Store_field(out, 10, Val_long(msy));
    Store_field(out, 11, Val_long(msz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_scale_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_scale_matrix(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10], argv[11], argv[12]);
}

extern "C" CAMLprim value caml_c_g3_start_instance_matrix(
    value vpx, value vpy, value vpz,
    value r1, value r2, value r3,
    value u1, value u2, value u3,
    value f1, value f2, value f3,
    value px, value py, value pz,
    value has_orient,
    value mr1, value mr2, value mr3,
    value mu1, value mu2, value mu3,
    value mf1, value mf2, value mf3)
{
    CAMLparam5(vpx, vpy, vpz, r1, r2);
    CAMLxparam5(r3, u1, u2, u3, f1);
    CAMLxparam5(f2, f3, px, py, pz);
    CAMLxparam5(has_orient, mr1, mr2, mr3, mu1);
    CAMLxparam5(mu2, mu3, mf1, mf2, mf3);
    CAMLlocal1(out);
    int32_t nvpx, nvpy, nvpz, nr1, nr2, nr3, nu1, nu2, nu3, nf1, nf2, nf3;
    c_oracle_g3_start_instance_matrix(
        Int_val(vpx), Int_val(vpy), Int_val(vpz),
        Int_val(r1), Int_val(r2), Int_val(r3),
        Int_val(u1), Int_val(u2), Int_val(u3),
        Int_val(f1), Int_val(f2), Int_val(f3),
        Int_val(px), Int_val(py), Int_val(pz),
        Int_val(has_orient),
        Int_val(mr1), Int_val(mr2), Int_val(mr3),
        Int_val(mu1), Int_val(mu2), Int_val(mu3),
        Int_val(mf1), Int_val(mf2), Int_val(mf3),
        &nvpx, &nvpy, &nvpz, &nr1, &nr2, &nr3,
        &nu1, &nu2, &nu3, &nf1, &nf2, &nf3);
    out = caml_alloc_tuple(12);
    Store_field(out, 0, Val_long(nvpx));
    Store_field(out, 1, Val_long(nvpy));
    Store_field(out, 2, Val_long(nvpz));
    Store_field(out, 3, Val_long(nr1));
    Store_field(out, 4, Val_long(nr2));
    Store_field(out, 5, Val_long(nr3));
    Store_field(out, 6, Val_long(nu1));
    Store_field(out, 7, Val_long(nu2));
    Store_field(out, 8, Val_long(nu3));
    Store_field(out, 9, Val_long(nf1));
    Store_field(out, 10, Val_long(nf2));
    Store_field(out, 11, Val_long(nf3));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_start_instance_matrix_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_start_instance_matrix(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10], argv[11], argv[12], argv[13], argv[14],
        argv[15], argv[16], argv[17], argv[18], argv[19],
        argv[20], argv[21], argv[22], argv[23], argv[24]);
}

extern "C" CAMLprim value caml_c_g3_point_2_vec(
    value sx, value sy,
    value canv_w2, value canv_h2,
    value msx, value msy, value msz,
    value ur1, value ur2, value ur3,
    value uu1, value uu2, value uu3,
    value uf1, value uf2, value uf3)
{
    CAMLparam5(sx, sy, canv_w2, canv_h2, msx);
    CAMLxparam5(msy, msz, ur1, ur2, ur3);
    CAMLxparam5(uu1, uu2, uu3, uf1, uf2);
    CAMLxparam1(uf3);
    CAMLlocal1(out);
    int32_t vx, vy, vz;
    c_oracle_g3_point_2_vec(
        Int_val(sx), Int_val(sy),
        Int_val(canv_w2), Int_val(canv_h2),
        Int_val(msx), Int_val(msy), Int_val(msz),
        Int_val(ur1), Int_val(ur2), Int_val(ur3),
        Int_val(uu1), Int_val(uu2), Int_val(uu3),
        Int_val(uf1), Int_val(uf2), Int_val(uf3),
        &vx, &vy, &vz);
    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(vx));
    Store_field(out, 1, Val_long(vy));
    Store_field(out, 2, Val_long(vz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_g3_point_2_vec_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_point_2_vec(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10], argv[11], argv[12], argv[13], argv[14],
        argv[15]);
}

extern "C" CAMLprim value caml_c_clip_edge(
    value plane_flag,
    value on_x, value on_y, value on_z,
    value on_u, value on_v, value on_l, value on_flags,
    value off_x, value off_y, value off_z,
    value off_u, value off_v, value off_l)
{
    CAMLparam5(plane_flag, on_x, on_y, on_z, on_u);
    CAMLxparam5(on_v, on_l, on_flags, off_x, off_y);
    CAMLxparam4(off_z, off_u, off_v, off_l);
    CAMLlocal1(out);
    int32_t nx, ny, nz, nu, nv, nl, nflags;
    uint8_t ncodes;
    c_oracle_clip_edge(
        Int_val(plane_flag),
        Int_val(on_x), Int_val(on_y), Int_val(on_z),
        Int_val(on_u), Int_val(on_v), Int_val(on_l), Int_val(on_flags),
        Int_val(off_x), Int_val(off_y), Int_val(off_z),
        Int_val(off_u), Int_val(off_v), Int_val(off_l),
        &nx, &ny, &nz, &nu, &nv, &nl, &nflags, &ncodes);
    out = caml_alloc_tuple(8);
    Store_field(out, 0, Val_long(nx));
    Store_field(out, 1, Val_long(ny));
    Store_field(out, 2, Val_long(nz));
    Store_field(out, 3, Val_long(nu));
    Store_field(out, 4, Val_long(nv));
    Store_field(out, 5, Val_long(nl));
    Store_field(out, 6, Val_long(nflags));
    Store_field(out, 7, Val_long((int32_t)ncodes));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_clip_edge_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_clip_edge(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10], argv[11], argv[12], argv[13]);
}

extern "C" CAMLprim value caml_c_g3_check_normal_facing(
    value vpx, value vpy, value vpz,
    value vx, value vy, value vz,
    value nx, value ny, value nz)
{
    return Val_long(c_oracle_g3_check_normal_facing(
        Int_val(vpx), Int_val(vpy), Int_val(vpz),
        Int_val(vx), Int_val(vy), Int_val(vz),
        Int_val(nx), Int_val(ny), Int_val(nz)));
}

extern "C" CAMLprim value caml_c_g3_check_normal_facing_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_g3_check_normal_facing(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_calc_rod_corners(
    value bx, value by, value bz, value bw,
    value tx, value ty, value tz, value tw,
    value msx, value msy, value msz)
{
    CAMLparam5(bx, by, bz, bw, tx);
    CAMLxparam5(ty, tz, tw, msx, msy);
    CAMLxparam1(msz);
    CAMLlocal1(out);
    int32_t c0x, c0y, c0z, c1x, c1y, c1z, c2x, c2y, c2z, c3x, c3y, c3z;
    uint8_t ca;
    c_oracle_calc_rod_corners(
        Int_val(bx), Int_val(by), Int_val(bz), Int_val(bw),
        Int_val(tx), Int_val(ty), Int_val(tz), Int_val(tw),
        Int_val(msx), Int_val(msy), Int_val(msz),
        &c0x, &c0y, &c0z, &c1x, &c1y, &c1z,
        &c2x, &c2y, &c2z, &c3x, &c3y, &c3z, &ca);
    out = caml_alloc_tuple(13);
    Store_field(out, 0, Val_long(c0x));
    Store_field(out, 1, Val_long(c0y));
    Store_field(out, 2, Val_long(c0z));
    Store_field(out, 3, Val_long(c1x));
    Store_field(out, 4, Val_long(c1y));
    Store_field(out, 5, Val_long(c1z));
    Store_field(out, 6, Val_long(c2x));
    Store_field(out, 7, Val_long(c2y));
    Store_field(out, 8, Val_long(c2z));
    Store_field(out, 9, Val_long(c3x));
    Store_field(out, 10, Val_long(c3y));
    Store_field(out, 11, Val_long(c3z));
    Store_field(out, 12, Val_long((int32_t)ca));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_calc_rod_corners_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_calc_rod_corners(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10]);
}

extern "C" CAMLprim value caml_c_clip_line(
    value p0x, value p0y, value p0z, value p0_codes,
    value p1x, value p1y, value p1z, value p1_codes,
    value codes_or)
{
    CAMLparam5(p0x, p0y, p0z, p0_codes, p1x);
    CAMLxparam4(p1y, p1z, p1_codes, codes_or);
    CAMLlocal1(out);
    int32_t op0x, op0y, op0z, op0c, op1x, op1y, op1z, op1c, clipped;
    c_oracle_clip_line(
        Int_val(p0x), Int_val(p0y), Int_val(p0z), Int_val(p0_codes),
        Int_val(p1x), Int_val(p1y), Int_val(p1z), Int_val(p1_codes),
        Int_val(codes_or),
        &op0x, &op0y, &op0z, &op0c,
        &op1x, &op1y, &op1z, &op1c,
        &clipped);
    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(op0x));
    Store_field(out, 1, Val_long(op0y));
    Store_field(out, 2, Val_long(op0z));
    Store_field(out, 3, Val_long(op0c));
    Store_field(out, 4, Val_long(op1x));
    Store_field(out, 5, Val_long(op1y));
    Store_field(out, 6, Val_long(op1z));
    Store_field(out, 7, Val_long(op1c));
    Store_field(out, 8, Val_long(clipped));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_clip_line_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_clip_line(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_do_facing_check_computed(
    value p0x, value p0y, value p0z,
    value p1x, value p1y, value p1z,
    value p2x, value p2y, value p2z)
{
    return Val_long(c_oracle_do_facing_check_computed(
        Int_val(p0x), Int_val(p0y), Int_val(p0z),
        Int_val(p1x), Int_val(p1y), Int_val(p1z),
        Int_val(p2x), Int_val(p2y), Int_val(p2z)));
}

extern "C" CAMLprim value caml_c_do_facing_check_computed_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_do_facing_check_computed(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8]);
}

/* clip_polygon stub: takes (codes_or, codes_and, int array) → int array
   Input array: [nv, x0,y0,z0,u0,v0,l0,flags0,codes0, x1,...]
   Output array: [codes_or, codes_and, x0,y0,...] */
extern "C" CAMLprim value caml_c_clip_polygon(
    value v_codes_or, value v_codes_and, value v_arr)
{
    CAMLparam3(v_codes_or, v_codes_and, v_arr);
    CAMLlocal1(result);

    int32_t codes_or = Int_val(v_codes_or);
    int32_t codes_and = Int_val(v_codes_and);
    int nv = Int_val(Field(v_arr, 0));

    int32_t flat_in[200 * 8];
    for (int i = 0; i < nv * 8; i++)
        flat_in[i] = Int_val(Field(v_arr, 1 + i));

    int32_t flat_out[200 * 8];
    int out_nv;
    int32_t out_codes_or, out_codes_and;
    c_oracle_clip_polygon(codes_or, codes_and, nv, flat_in,
                          &out_nv, flat_out, &out_codes_or, &out_codes_and);

    int result_len = 2 + out_nv * 8;
    result = caml_alloc(result_len, 0);
    Store_field(result, 0, Val_long(out_codes_or));
    Store_field(result, 1, Val_long(out_codes_and));
    for (int i = 0; i < out_nv * 8; i++)
        Store_field(result, 2 + i, Val_long(flat_out[i]));

    CAMLreturn(result);
}

/* ---- Gameseg oracle stubs ---- */

extern "C" CAMLprim value caml_c_compute_center_point_on_side(
    value v0x, value v0y, value v0z,
    value v1x, value v1y, value v1z,
    value v2x, value v2y, value v2z,
    value v3x, value v3y, value v3z)
{
    CAMLparam5(v0x, v0y, v0z, v1x, v1y);
    CAMLxparam5(v1z, v2x, v2y, v2z, v3x);
    CAMLxparam2(v3y, v3z);
    CAMLlocal1(out);

    c_oracle_vec3 a = { Int_val(v0x), Int_val(v0y), Int_val(v0z) };
    c_oracle_vec3 b = { Int_val(v1x), Int_val(v1y), Int_val(v1z) };
    c_oracle_vec3 c = { Int_val(v2x), Int_val(v2y), Int_val(v2z) };
    c_oracle_vec3 d = { Int_val(v3x), Int_val(v3y), Int_val(v3z) };
    c_oracle_vec3 dest;
    c_oracle_compute_center_point_on_side(&dest, &a, &b, &c, &d);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_compute_center_point_on_side_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_compute_center_point_on_side(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5],
        argv[6], argv[7], argv[8], argv[9], argv[10], argv[11]);
}

extern "C" CAMLprim value caml_c_compute_segment_center(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 verts[8];
    for (int i = 0; i < 8; i++)
    {
        verts[i].x = Int_val(Field(arr, i * 3));
        verts[i].y = Int_val(Field(arr, i * 3 + 1));
        verts[i].z = Int_val(Field(arr, i * 3 + 2));
    }
    c_oracle_vec3 dest;
    c_oracle_compute_segment_center(&dest, verts);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_get_verts_for_normal(value va, value vb, value vc, value vd)
{
    CAMLparam4(va, vb, vc, vd);
    CAMLlocal1(out);

    int32_t v0, v1, v2, v3, nf;
    c_oracle_get_verts_for_normal(Int_val(va), Int_val(vb), Int_val(vc), Int_val(vd),
        &v0, &v1, &v2, &v3, &nf);

    out = caml_alloc_tuple(5);
    Store_field(out, 0, Val_long(v0));
    Store_field(out, 1, Val_long(v1));
    Store_field(out, 2, Val_long(v2));
    Store_field(out, 3, Val_long(v3));
    Store_field(out, 4, Val_long(nf));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_create_abs_vertex_lists(
    value side_type, value seg_verts_arr, value sidenum)
{
    CAMLparam3(side_type, seg_verts_arr, sidenum);
    CAMLlocal1(out);

    int32_t sv[8];
    for (int i = 0; i < 8; i++)
        sv[i] = Int_val(Field(seg_verts_arr, i));

    int32_t nf;
    int32_t verts[6] = {0};
    c_oracle_create_abs_vertex_lists(&nf, verts, Int_val(side_type), sv, Int_val(sidenum));

    out = caml_alloc_tuple(7);
    Store_field(out, 0, Val_long(nf));
    for (int i = 0; i < 6; i++)
        Store_field(out, 1 + i, Val_long(verts[i]));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_extract_vector_from_segment(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 verts[8];
    for (int i = 0; i < 8; i++)
    {
        verts[i].x = Int_val(Field(arr, i * 3));
        verts[i].y = Int_val(Field(arr, i * 3 + 1));
        verts[i].z = Int_val(Field(arr, i * 3 + 2));
    }
    int32_t start_side = Int_val(Field(arr, 24));
    int32_t end_side = Int_val(Field(arr, 25));

    c_oracle_vec3 dest;
    c_oracle_extract_vector_from_segment(&dest, verts, start_side, end_side);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dest.x));
    Store_field(out, 1, Val_long(dest.y));
    Store_field(out, 2, Val_long(dest.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_extract_orient_from_segment(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 verts[8];
    for (int i = 0; i < 8; i++)
    {
        verts[i].x = Int_val(Field(arr, i * 3));
        verts[i].y = Int_val(Field(arr, i * 3 + 1));
        verts[i].z = Int_val(Field(arr, i * 3 + 2));
    }

    c_oracle_mat3 dest = {};
    c_oracle_extract_orient_from_segment(&dest, verts);

    out = caml_alloc_tuple(9);
    Store_field(out, 0, Val_long(dest.rvec.x));
    Store_field(out, 1, Val_long(dest.rvec.y));
    Store_field(out, 2, Val_long(dest.rvec.z));
    Store_field(out, 3, Val_long(dest.uvec.x));
    Store_field(out, 4, Val_long(dest.uvec.y));
    Store_field(out, 5, Val_long(dest.uvec.z));
    Store_field(out, 6, Val_long(dest.fvec.x));
    Store_field(out, 7, Val_long(dest.fvec.y));
    Store_field(out, 8, Val_long(dest.fvec.z));
    CAMLreturn(out);
}

/* ---- FVI oracle stubs ---- */

extern "C" CAMLprim value caml_c_check_point_to_face(value arr)
{
    CAMLparam1(arr);

    c_oracle_vec3 checkp = {
        Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2))
    };
    c_oracle_vec3 norm = {
        Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5))
    };
    int nv = Int_val(Field(arr, 6));
    c_oracle_vec3 verts[4];
    for (int i = 0; i < nv; i++)
    {
        int base = 7 + i * 3;
        verts[i].x = Int_val(Field(arr, base));
        verts[i].y = Int_val(Field(arr, base + 1));
        verts[i].z = Int_val(Field(arr, base + 2));
    }

    uint32_t result = c_oracle_check_point_to_face(&checkp, &norm, nv, verts);
    CAMLreturn(Val_long((int32_t)result));
}

extern "C" CAMLprim value caml_c_find_plane_line_intersection(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 plane_pnt = {
        Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2))
    };
    c_oracle_vec3 plane_norm = {
        Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5))
    };
    c_oracle_vec3 p0 = {
        Int_val(Field(arr, 6)), Int_val(Field(arr, 7)), Int_val(Field(arr, 8))
    };
    c_oracle_vec3 p1 = {
        Int_val(Field(arr, 9)), Int_val(Field(arr, 10)), Int_val(Field(arr, 11))
    };
    int32_t rad = Int_val(Field(arr, 12));

    c_oracle_vec3 newp = {0, 0, 0};
    int found = c_oracle_find_plane_line_intersection(&newp, &plane_pnt, &plane_norm, &p0, &p1, rad);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(found));
    Store_field(out, 1, Val_long(newp.x));
    Store_field(out, 2, Val_long(newp.y));
    Store_field(out, 3, Val_long(newp.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_check_sphere_to_face(value arr)
{
    CAMLparam1(arr);

    c_oracle_vec3 pnt = {
        Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2))
    };
    c_oracle_vec3 norm = {
        Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5))
    };
    int nv = Int_val(Field(arr, 6));
    int32_t rad = Int_val(Field(arr, 7));
    c_oracle_vec3 verts[4];
    for (int i = 0; i < nv; i++)
    {
        int base = 8 + i * 3;
        verts[i].x = Int_val(Field(arr, base));
        verts[i].y = Int_val(Field(arr, base + 1));
        verts[i].z = Int_val(Field(arr, base + 2));
    }

    int result = c_oracle_check_sphere_to_face(&pnt, &norm, nv, rad, verts);
    CAMLreturn(Val_long(result));
}

extern "C" CAMLprim value caml_c_calc_det_value(
    value rx, value ry, value rz,
    value ux, value uy, value uz,
    value fx, value fy, value fz)
{
    CAMLparam5(rx, ry, rz, ux, uy);
    CAMLxparam4(uz, fx, fy, fz);

    c_oracle_vec3 r = { Int_val(rx), Int_val(ry), Int_val(rz) };
    c_oracle_vec3 u = { Int_val(ux), Int_val(uy), Int_val(uz) };
    c_oracle_vec3 f = { Int_val(fx), Int_val(fy), Int_val(fz) };
    int32_t result = c_oracle_calc_det_value(&r, &u, &f);
    CAMLreturn(Val_long(result));
}

extern "C" CAMLprim value caml_c_calc_det_value_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_calc_det_value(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8]);
}

extern "C" CAMLprim value caml_c_check_line_to_line(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 p1 = { Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2)) };
    c_oracle_vec3 v1 = { Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5)) };
    c_oracle_vec3 p2 = { Int_val(Field(arr, 6)), Int_val(Field(arr, 7)), Int_val(Field(arr, 8)) };
    c_oracle_vec3 v2 = { Int_val(Field(arr, 9)), Int_val(Field(arr, 10)), Int_val(Field(arr, 11)) };

    int32_t t1 = 0, t2 = 0;
    int found = c_oracle_check_line_to_line(&t1, &t2, &p1, &v1, &p2, &v2);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(found));
    Store_field(out, 1, Val_long(t1));
    Store_field(out, 2, Val_long(t2));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_check_line_to_face(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 p0 = { Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2)) };
    c_oracle_vec3 p1 = { Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5)) };
    c_oracle_vec3 side_norm = { Int_val(Field(arr, 6)), Int_val(Field(arr, 7)), Int_val(Field(arr, 8)) };
    int32_t rad = Int_val(Field(arr, 9));
    int facenum = Int_val(Field(arr, 10));
    int nv = Int_val(Field(arr, 11));
    int side_type = Int_val(Field(arr, 12));
    int sidenum = Int_val(Field(arr, 13));
    int32_t seg_verts[8];
    for (int i = 0; i < 8; i++) seg_verts[i] = Int_val(Field(arr, 14 + i));
    c_oracle_vec3 seg_vert_positions[8];
    for (int i = 0; i < 8; i++)
    {
        int base = 22 + i * 3;
        seg_vert_positions[i].x = Int_val(Field(arr, base));
        seg_vert_positions[i].y = Int_val(Field(arr, base + 1));
        seg_vert_positions[i].z = Int_val(Field(arr, base + 2));
    }

    c_oracle_vec3 newp = {0, 0, 0};
    int hit = c_oracle_check_line_to_face(&newp, &p0, &p1, &side_norm,
        rad, facenum, nv, side_type, sidenum, seg_verts, seg_vert_positions);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(hit));
    Store_field(out, 1, Val_long(newp.x));
    Store_field(out, 2, Val_long(newp.y));
    Store_field(out, 3, Val_long(newp.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_check_vector_to_sphere_1(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 p0 = { Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2)) };
    c_oracle_vec3 p1 = { Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5)) };
    c_oracle_vec3 sphere_pos = { Int_val(Field(arr, 6)), Int_val(Field(arr, 7)), Int_val(Field(arr, 8)) };
    int32_t sphere_rad = Int_val(Field(arr, 9));

    c_oracle_vec3 intp = {0, 0, 0};
    int32_t dist = c_oracle_check_vector_to_sphere_1(&intp, &p0, &p1, &sphere_pos, sphere_rad);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(dist));
    Store_field(out, 1, Val_long(intp.x));
    Store_field(out, 2, Val_long(intp.y));
    Store_field(out, 3, Val_long(intp.z));
    CAMLreturn(out);
}

/* ---------- curves ---------- */

static c_oracle_vms_equation decode_equation(value arr, int offset)
{
    c_oracle_vms_equation eq;
    eq.x3 = Int_val(Field(arr, offset + 0));
    eq.x2 = Int_val(Field(arr, offset + 1));
    eq.x1 = Int_val(Field(arr, offset + 2));
    eq.x0 = Int_val(Field(arr, offset + 3));
    eq.y3 = Int_val(Field(arr, offset + 4));
    eq.y2 = Int_val(Field(arr, offset + 5));
    eq.y1 = Int_val(Field(arr, offset + 6));
    eq.y0 = Int_val(Field(arr, offset + 7));
    eq.z3 = Int_val(Field(arr, offset + 8));
    eq.z2 = Int_val(Field(arr, offset + 9));
    eq.z1 = Int_val(Field(arr, offset + 10));
    eq.z0 = Int_val(Field(arr, offset + 11));
    return eq;
}

extern "C" CAMLprim value caml_c_create_curve(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vec3 p1 = { Int_val(Field(arr, 0)), Int_val(Field(arr, 1)), Int_val(Field(arr, 2)) };
    c_oracle_vec3 p4 = { Int_val(Field(arr, 3)), Int_val(Field(arr, 4)), Int_val(Field(arr, 5)) };
    c_oracle_vec3 r1 = { Int_val(Field(arr, 6)), Int_val(Field(arr, 7)), Int_val(Field(arr, 8)) };
    c_oracle_vec3 r4 = { Int_val(Field(arr, 9)), Int_val(Field(arr, 10)), Int_val(Field(arr, 11)) };

    c_oracle_vms_equation coeffs;
    c_oracle_create_curve(&p1, &p4, &r1, &r4, &coeffs);

    out = caml_alloc_tuple(12);
    Store_field(out, 0, Val_long(coeffs.x3));
    Store_field(out, 1, Val_long(coeffs.x2));
    Store_field(out, 2, Val_long(coeffs.x1));
    Store_field(out, 3, Val_long(coeffs.x0));
    Store_field(out, 4, Val_long(coeffs.y3));
    Store_field(out, 5, Val_long(coeffs.y2));
    Store_field(out, 6, Val_long(coeffs.y1));
    Store_field(out, 7, Val_long(coeffs.y0));
    Store_field(out, 8, Val_long(coeffs.z3));
    Store_field(out, 9, Val_long(coeffs.z2));
    Store_field(out, 10, Val_long(coeffs.z1));
    Store_field(out, 11, Val_long(coeffs.z0));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_evaluate_curve(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vms_equation eq = decode_equation(arr, 0);
    int32_t t = Int_val(Field(arr, 12));

    c_oracle_vec3 result;
    c_oracle_evaluate_curve(&eq, t, &result);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(result.x));
    Store_field(out, 1, Val_long(result.y));
    Store_field(out, 2, Val_long(result.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_curve_dist(value arr)
{
    CAMLparam1(arr);

    c_oracle_vms_equation eq = decode_equation(arr, 0);
    int32_t t0 = Int_val(Field(arr, 12));
    c_oracle_vec3 p0 = { Int_val(Field(arr, 13)), Int_val(Field(arr, 14)), Int_val(Field(arr, 15)) };
    int32_t dist = Int_val(Field(arr, 16));

    int32_t result = c_oracle_curve_dist(&eq, t0, &p0, dist);
    CAMLreturn(Val_long(result));
}

extern "C" CAMLprim value caml_c_curve_dir(value arr)
{
    CAMLparam1(arr);
    CAMLlocal1(out);

    c_oracle_vms_equation eq = decode_equation(arr, 0);
    int32_t t0 = Int_val(Field(arr, 12));

    c_oracle_vec3 dir;
    c_oracle_curve_dir(&eq, t0, &dir);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(dir.x));
    Store_field(out, 1, Val_long(dir.y));
    Store_field(out, 2, Val_long(dir.z));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_physics_turn_towards_vector(
    value gx, value gy, value gz,
    value fx, value fy, value fz,
    value rate, value is_morph,
    value crx, value cry, value crz)
{
    CAMLparam5(gx, gy, gz, fx, fy);
    CAMLxparam5(fz, rate, is_morph, crx, cry);
    CAMLxparam1(crz);
    CAMLlocal1(out);

    int32_t out_rx, out_ry, out_rz;
    c_oracle_physics_turn_towards_vector(
        Int_val(gx), Int_val(gy), Int_val(gz),
        Int_val(fx), Int_val(fy), Int_val(fz),
        Int_val(rate), Int_val(is_morph),
        Int_val(crx), Int_val(cry), Int_val(crz),
        &out_rx, &out_ry, &out_rz);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_rx));
    Store_field(out, 1, Val_long(out_ry));
    Store_field(out, 2, Val_long(out_rz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_physics_turn_towards_vector_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_physics_turn_towards_vector(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9], argv[10]);
}

extern "C" CAMLprim value caml_c_do_physics_sim_rot(
    value rvx, value rvy, value rvz,
    value rtx, value rty, value rtz,
    value o_rx, value o_ry, value o_rz,
    value o_ux, value o_uy, value o_uz,
    value o_fx, value o_fy, value o_fz,
    value drag, value mass, value flags,
    value turnroll, value frame_time)
{
    CAMLparam5(rvx, rvy, rvz, rtx, rty);
    CAMLxparam5(rtz, o_rx, o_ry, o_rz, o_ux);
    CAMLxparam5(o_uy, o_uz, o_fx, o_fy, o_fz);
    CAMLxparam5(drag, mass, flags, turnroll, frame_time);
    CAMLlocal1(out);

    int32_t out_tag;
    int32_t out_orient[9];
    int32_t out_rvx, out_rvy, out_rvz;
    int32_t out_turnroll;

    c_oracle_do_physics_sim_rot(
        Int_val(rvx), Int_val(rvy), Int_val(rvz),
        Int_val(rtx), Int_val(rty), Int_val(rtz),
        Int_val(o_rx), Int_val(o_ry), Int_val(o_rz),
        Int_val(o_ux), Int_val(o_uy), Int_val(o_uz),
        Int_val(o_fx), Int_val(o_fy), Int_val(o_fz),
        Int_val(drag), Int_val(mass), Int_val(flags),
        Int_val(turnroll), Int_val(frame_time),
        &out_tag, out_orient,
        &out_rvx, &out_rvy, &out_rvz, &out_turnroll);

    out = caml_alloc_tuple(14);
    Store_field(out, 0, Val_long(out_tag));
    for (int i = 0; i < 9; i++)
        Store_field(out, 1 + i, Val_long(out_orient[i]));
    Store_field(out, 10, Val_long(out_rvx));
    Store_field(out, 11, Val_long(out_rvy));
    Store_field(out, 12, Val_long(out_rvz));
    Store_field(out, 13, Val_long(out_turnroll));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_do_physics_sim_rot_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_do_physics_sim_rot(
        argv[0], argv[1], argv[2], argv[3], argv[4],
        argv[5], argv[6], argv[7], argv[8], argv[9],
        argv[10], argv[11], argv[12], argv[13], argv[14],
        argv[15], argv[16], argv[17], argv[18], argv[19]);
}

/* calc_gun_point: takes flat int array (86 elements), returns vec3 tuple */
extern "C" CAMLprim value caml_c_calc_gun_point(value packed_arr)
{
    CAMLparam1(packed_arr);
    CAMLlocal1(out);

    /* Unpack the flat array */
    int32_t gpx = Int_val(Field(packed_arr, 0));
    int32_t gpy = Int_val(Field(packed_arr, 1));
    int32_t gpz = Int_val(Field(packed_arr, 2));
    int32_t start_mn = Int_val(Field(packed_arr, 3));

    int32_t anim_angles[30]; /* 10 * 3 */
    for (int i = 0; i < 30; i++)
        anim_angles[i] = Int_val(Field(packed_arr, 4 + i));

    int32_t sub_offsets[30]; /* 10 * 3 */
    for (int i = 0; i < 30; i++)
        sub_offsets[i] = Int_val(Field(packed_arr, 34 + i));

    int32_t sub_parents[10];
    for (int i = 0; i < 10; i++)
        sub_parents[i] = Int_val(Field(packed_arr, 64 + i));

    int32_t o_rx = Int_val(Field(packed_arr, 74));
    int32_t o_ry = Int_val(Field(packed_arr, 75));
    int32_t o_rz = Int_val(Field(packed_arr, 76));
    int32_t o_ux = Int_val(Field(packed_arr, 77));
    int32_t o_uy = Int_val(Field(packed_arr, 78));
    int32_t o_uz = Int_val(Field(packed_arr, 79));
    int32_t o_fx = Int_val(Field(packed_arr, 80));
    int32_t o_fy = Int_val(Field(packed_arr, 81));
    int32_t o_fz = Int_val(Field(packed_arr, 82));
    int32_t px = Int_val(Field(packed_arr, 83));
    int32_t py = Int_val(Field(packed_arr, 84));
    int32_t pz = Int_val(Field(packed_arr, 85));

    int32_t out_x, out_y, out_z;
    c_oracle_calc_gun_point(gpx, gpy, gpz, start_mn,
        anim_angles, sub_offsets, sub_parents,
        o_rx, o_ry, o_rz, o_ux, o_uy, o_uz, o_fx, o_fy, o_fz,
        px, py, pz, &out_x, &out_y, &out_z);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_x));
    Store_field(out, 1, Val_long(out_y));
    Store_field(out, 2, Val_long(out_z));
    CAMLreturn(out);
}

/* phys_apply_force: 7 args → vec3 tuple */
extern "C" CAMLprim value caml_c_phys_apply_force(
    value vx, value vy, value vz,
    value fx, value fy, value fz,
    value mass)
{
    CAMLparam5(vx, vy, vz, fx, fy);
    CAMLxparam2(fz, mass);
    CAMLlocal1(out);

    int32_t out_vx, out_vy, out_vz;
    c_oracle_phys_apply_force(
        Int_val(vx), Int_val(vy), Int_val(vz),
        Int_val(fx), Int_val(fy), Int_val(fz),
        Int_val(mass),
        &out_vx, &out_vy, &out_vz);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_vx));
    Store_field(out, 1, Val_long(out_vy));
    Store_field(out, 2, Val_long(out_vz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_phys_apply_force_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_phys_apply_force(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

/* phys_apply_rot: 12 args → (rx, ry, rz, skip_ai) tuple */
extern "C" CAMLprim value caml_c_phys_apply_rot(
    value fx, value fy, value fz,
    value mass, value is_robot,
    value fvx, value fvy, value fvz,
    value is_morph,
    value crx, value cry, value crz)
{
    CAMLparam5(fx, fy, fz, mass, is_robot);
    CAMLxparam5(fvx, fvy, fvz, is_morph, crx);
    CAMLxparam2(cry, crz);
    CAMLlocal1(out);

    int32_t out_rx, out_ry, out_rz;
    int out_skip_ai;
    c_oracle_phys_apply_rot(
        Int_val(fx), Int_val(fy), Int_val(fz),
        Int_val(mass), Int_val(is_robot),
        Int_val(fvx), Int_val(fvy), Int_val(fvz),
        Int_val(is_morph),
        Int_val(crx), Int_val(cry), Int_val(crz),
        &out_rx, &out_ry, &out_rz, &out_skip_ai);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(out_rx));
    Store_field(out, 1, Val_long(out_ry));
    Store_field(out, 2, Val_long(out_rz));
    Store_field(out, 3, Val_long(out_skip_ai));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_phys_apply_rot_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_phys_apply_rot(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5],
        argv[6], argv[7], argv[8], argv[9], argv[10], argv[11]);
}

/* ai_turn_towards_vector: 16 args → 9-tuple (orient) */
extern "C" CAMLprim value caml_c_ai_turn_towards_vector(
    value gx, value gy, value gz,
    value fx, value fy, value fz,
    value rx, value ry, value rz,
    value rate, value frame_time,
    value seismic_mag, value robot_mass,
    value rvx, value rvy, value rvz)
{
    CAMLparam5(gx, gy, gz, fx, fy);
    CAMLxparam5(fz, rx, ry, rz, rate);
    CAMLxparam5(frame_time, seismic_mag, robot_mass, rvx, rvy);
    CAMLxparam1(rvz);
    CAMLlocal1(out);

    int32_t out_orient[9];
    c_oracle_ai_turn_towards_vector(
        Int_val(gx), Int_val(gy), Int_val(gz),
        Int_val(fx), Int_val(fy), Int_val(fz),
        Int_val(rx), Int_val(ry), Int_val(rz),
        Int_val(rate), Int_val(frame_time),
        Int_val(seismic_mag), Int_val(robot_mass),
        Int_val(rvx), Int_val(rvy), Int_val(rvz),
        out_orient);

    out = caml_alloc_tuple(9);
    for (int i = 0; i < 9; i++)
        Store_field(out, i, Val_long(out_orient[i]));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_ai_turn_towards_vector_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_ai_turn_towards_vector(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5],
        argv[6], argv[7], argv[8], argv[9], argv[10], argv[11],
        argv[12], argv[13], argv[14], argv[15]);
}

/* set_thrust_from_velocity: 5 args → 3-tuple (thrust) */
extern "C" CAMLprim value caml_c_set_thrust_from_velocity(
    value mass, value drag,
    value vx, value vy, value vz)
{
    CAMLparam5(mass, drag, vx, vy, vz);
    CAMLlocal1(out);

    int32_t out_tx, out_ty, out_tz;
    c_oracle_set_thrust_from_velocity(
        Int_val(mass), Int_val(drag),
        Int_val(vx), Int_val(vy), Int_val(vz),
        &out_tx, &out_ty, &out_tz);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_tx));
    Store_field(out, 1, Val_long(out_ty));
    Store_field(out, 2, Val_long(out_tz));
    CAMLreturn(out);
}

/* move_towards_vector: 16 args → (vx, vy, vz) tuple */
extern "C" CAMLprim value caml_c_move_towards_vector(
    value vx, value vy, value vz,
    value gx, value gy, value gz,
    value fx, value fy, value fz,
    value frame_time, value difficulty,
    value max_speed, value attack_type,
    value dot_based, value is_thief, value is_kamikaze)
{
    CAMLparam5(vx, vy, vz, gx, gy);
    CAMLxparam5(gz, fx, fy, fz, frame_time);
    CAMLxparam5(difficulty, max_speed, attack_type, dot_based, is_thief);
    CAMLxparam1(is_kamikaze);
    CAMLlocal1(out);

    int32_t out_vx, out_vy, out_vz;
    c_oracle_move_towards_vector(
        Int_val(vx), Int_val(vy), Int_val(vz),
        Int_val(gx), Int_val(gy), Int_val(gz),
        Int_val(fx), Int_val(fy), Int_val(fz),
        Int_val(frame_time), Int_val(difficulty),
        Int_val(max_speed), Int_val(attack_type),
        Int_val(dot_based), Int_val(is_thief), Int_val(is_kamikaze),
        &out_vx, &out_vy, &out_vz);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_vx));
    Store_field(out, 1, Val_long(out_vy));
    Store_field(out, 2, Val_long(out_vz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_move_towards_vector_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_move_towards_vector(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5],
        argv[6], argv[7], argv[8], argv[9], argv[10], argv[11],
        argv[12], argv[13], argv[14], argv[15]);
}

/* move_around_player: flat int array → (vx, vy, vz) tuple */
extern "C" CAMLprim value caml_c_move_around_player(value packed_arr)
{
    CAMLparam1(packed_arr);
    CAMLlocal1(out);

    int32_t packed[19];
    for (int i = 0; i < 19; i++)
        packed[i] = Int_val(Field(packed_arr, i));

    int32_t out_vx, out_vy, out_vz;
    c_oracle_move_around_player(packed, &out_vx, &out_vy, &out_vz);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_vx));
    Store_field(out, 1, Val_long(out_vy));
    Store_field(out, 2, Val_long(out_vz));
    CAMLreturn(out);
}

/* move_away_from_player: 17 args → (vx, vy, vz) tuple */
extern "C" CAMLprim value caml_c_move_away_from_player(
    value vx, value vy, value vz,
    value px, value py, value pz,
    value ux, value uy, value uz,
    value rx, value ry, value rz,
    value frame_time, value frame_count,
    value objnum, value attack_type, value max_speed)
{
    CAMLparam5(vx, vy, vz, px, py);
    CAMLxparam5(pz, ux, uy, uz, rx);
    CAMLxparam5(ry, rz, frame_time, frame_count, objnum);
    CAMLxparam2(attack_type, max_speed);
    CAMLlocal1(out);

    int32_t out_vx, out_vy, out_vz;
    c_oracle_move_away_from_player(
        Int_val(vx), Int_val(vy), Int_val(vz),
        Int_val(px), Int_val(py), Int_val(pz),
        Int_val(ux), Int_val(uy), Int_val(uz),
        Int_val(rx), Int_val(ry), Int_val(rz),
        Int_val(frame_time), Int_val(frame_count),
        Int_val(objnum), Int_val(attack_type), Int_val(max_speed),
        &out_vx, &out_vy, &out_vz);

    out = caml_alloc_tuple(3);
    Store_field(out, 0, Val_long(out_vx));
    Store_field(out, 1, Val_long(out_vy));
    Store_field(out, 2, Val_long(out_vz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_move_away_from_player_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_move_away_from_player(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5],
        argv[6], argv[7], argv[8], argv[9], argv[10], argv[11],
        argv[12], argv[13], argv[14], argv[15], argv[16]);
}

/* set_object_turnroll: 3 args → int */
extern "C" CAMLprim value caml_c_set_object_turnroll(
    value rotvel_y, value turnroll, value frame_time)
{
    CAMLparam3(rotvel_y, turnroll, frame_time);
    int32_t out_turnroll;
    c_oracle_set_object_turnroll(
        Int_val(rotvel_y), Int_val(turnroll), Int_val(frame_time),
        &out_turnroll);
    CAMLreturn(Val_long(out_turnroll));
}

/* lead_player: 16 args → (success, fx, fy, fz) tuple */
extern "C" CAMLprim value caml_c_lead_player(
    value fpx, value fpy, value fpz,
    value bpx, value bpy, value bpz,
    value pvx, value pvy, value pvz,
    value fvx, value fvy, value fvz,
    value player_cloaked, value max_weapon_speed, value is_matter,
    value difficulty_level)
{
    CAMLparam5(fpx, fpy, fpz, bpx, bpy);
    CAMLxparam5(bpz, pvx, pvy, pvz, fvx);
    CAMLxparam5(fvy, fvz, player_cloaked, max_weapon_speed, is_matter);
    CAMLxparam1(difficulty_level);
    CAMLlocal1(out);

    int32_t out_success, out_fx, out_fy, out_fz;
    c_oracle_lead_player(
        Int_val(fpx), Int_val(fpy), Int_val(fpz),
        Int_val(bpx), Int_val(bpy), Int_val(bpz),
        Int_val(pvx), Int_val(pvy), Int_val(pvz),
        Int_val(fvx), Int_val(fvy), Int_val(fvz),
        Int_val(player_cloaked), Int_val(max_weapon_speed),
        Int_val(is_matter), Int_val(difficulty_level),
        &out_success, &out_fx, &out_fy, &out_fz);

    out = caml_alloc_tuple(4);
    Store_field(out, 0, Val_long(out_success));
    Store_field(out, 1, Val_long(out_fx));
    Store_field(out, 2, Val_long(out_fy));
    Store_field(out, 3, Val_long(out_fz));
    CAMLreturn(out);
}

extern "C" CAMLprim value caml_c_lead_player_bc(value* argv, int argn)
{
    (void)argn;
    return caml_c_lead_player(
        argv[0], argv[1], argv[2], argv[3], argv[4], argv[5],
        argv[6], argv[7], argv[8], argv[9], argv[10], argv[11],
        argv[12], argv[13], argv[14], argv[15]);
}
