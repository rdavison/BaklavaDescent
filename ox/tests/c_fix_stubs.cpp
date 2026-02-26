extern "C" {
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
}

#include "c_oracle.h"

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
