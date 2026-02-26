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

extern "C" CAMLprim value caml_c_vm_vec_dist_quick(value x0, value y0, value z0, value x1, value y1, value z1)
{
    c_oracle_vec3 v0 = { Int_val(x0), Int_val(y0), Int_val(z0) };
    c_oracle_vec3 v1 = { Int_val(x1), Int_val(y1), Int_val(z1) };
    return Val_long(c_oracle_vm_vec_dist_quick(&v0, &v1));
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
