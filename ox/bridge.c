#include "bridge.h"

#include <stdio.h>
#include <stdlib.h>

#include <caml/callback.h>
#include <caml/mlvalues.h>
#include <caml/startup.h>

static int g_runtime_started = 0;
static const value* g_i2f = NULL;
static const value* g_f2i = NULL;
static const value* g_fixmul = NULL;
static const value* g_fixdiv = NULL;
static const value* g_fix_sqrt = NULL;
static const value* g_fix_isqrt = NULL;
static const value* g_fix_asin = NULL;
static const value* g_fix_acos = NULL;
static const value* g_fix_atan2 = NULL;
static const value* g_fix_sincos = NULL;
static const value* g_fix_fastsincos = NULL;
static const value* g_vm_vec_add = NULL;
static const value* g_vm_vec_sub = NULL;
static const value* g_vm_vec_add2 = NULL;
static const value* g_vm_vec_sub2 = NULL;
static const value* g_vm_vec_avg = NULL;
static const value* g_vm_vec_avg4 = NULL;
static const value* g_vm_vec_copy_scale = NULL;
static const value* g_vm_vec_scale_add = NULL;
static const value* g_vm_vec_scale_add2 = NULL;
static const value* g_vm_vec_scale2 = NULL;

static void cd_ox_require_ready(const char* fn)
{
    if (!(g_runtime_started
          && g_i2f
          && g_f2i
          && g_fixmul
          && g_fixdiv
          && g_fix_sqrt
          && g_fix_isqrt
          && g_fix_asin
          && g_fix_acos
          && g_fix_atan2
          && g_fix_sincos
          && g_fix_fastsincos
          && g_vm_vec_add
          && g_vm_vec_sub
          && g_vm_vec_add2
          && g_vm_vec_sub2
          && g_vm_vec_avg
          && g_vm_vec_avg4
          && g_vm_vec_copy_scale
          && g_vm_vec_scale_add
          && g_vm_vec_scale_add2
          && g_vm_vec_scale2))
    {
        fprintf(stderr, "OxCaml bridge not initialized before %s\n", fn);
        abort();
    }
}

int cd_ox_init_runtime(const char* executable_path)
{
    if (g_runtime_started)
    {
        return 0;
    }

    char* argv[2];
    argv[0] = (char*)executable_path;
    argv[1] = NULL;

    caml_startup(argv);

    g_i2f = caml_named_value("cd_i2f");
    g_f2i = caml_named_value("cd_f2i");
    g_fixmul = caml_named_value("cd_fixmul");
    g_fixdiv = caml_named_value("cd_fixdiv");
    g_fix_sqrt = caml_named_value("cd_fix_sqrt");
    g_fix_isqrt = caml_named_value("cd_fix_isqrt");
    g_fix_asin = caml_named_value("cd_fix_asin");
    g_fix_acos = caml_named_value("cd_fix_acos");
    g_fix_atan2 = caml_named_value("cd_fix_atan2");
    g_fix_sincos = caml_named_value("cd_fix_sincos");
    g_fix_fastsincos = caml_named_value("cd_fix_fastsincos");
    g_vm_vec_add = caml_named_value("cd_vm_vec_add");
    g_vm_vec_sub = caml_named_value("cd_vm_vec_sub");
    g_vm_vec_add2 = caml_named_value("cd_vm_vec_add2");
    g_vm_vec_sub2 = caml_named_value("cd_vm_vec_sub2");
    g_vm_vec_avg = caml_named_value("cd_vm_vec_avg");
    g_vm_vec_avg4 = caml_named_value("cd_vm_vec_avg4");
    g_vm_vec_copy_scale = caml_named_value("cd_vm_vec_copy_scale");
    g_vm_vec_scale_add = caml_named_value("cd_vm_vec_scale_add");
    g_vm_vec_scale_add2 = caml_named_value("cd_vm_vec_scale_add2");
    g_vm_vec_scale2 = caml_named_value("cd_vm_vec_scale2");

    if (!g_i2f
        || !g_f2i
        || !g_fixmul
        || !g_fixdiv
        || !g_fix_sqrt
        || !g_fix_isqrt
        || !g_fix_asin
        || !g_fix_acos
        || !g_fix_atan2
        || !g_fix_sincos
        || !g_fix_fastsincos
        || !g_vm_vec_add
        || !g_vm_vec_sub
        || !g_vm_vec_add2
        || !g_vm_vec_sub2
        || !g_vm_vec_avg
        || !g_vm_vec_avg4
        || !g_vm_vec_copy_scale
        || !g_vm_vec_scale_add
        || !g_vm_vec_scale_add2
        || !g_vm_vec_scale2)
    {
        return 1;
    }

    g_runtime_started = 1;
    return 0;
}

int cd_ox_is_ready(void)
{
    return g_runtime_started
           && g_i2f
           && g_f2i
           && g_fixmul
           && g_fixdiv
           && g_fix_sqrt
           && g_fix_isqrt
           && g_fix_asin
           && g_fix_acos
           && g_fix_atan2
           && g_fix_sincos
           && g_fix_fastsincos
           && g_vm_vec_add
           && g_vm_vec_sub
           && g_vm_vec_add2
           && g_vm_vec_sub2
           && g_vm_vec_avg
           && g_vm_vec_avg4
           && g_vm_vec_copy_scale
           && g_vm_vec_scale_add
           && g_vm_vec_scale_add2
           && g_vm_vec_scale2;
}

int32_t cd_ox_i2f(int32_t i)
{
    cd_ox_require_ready("cd_ox_i2f");
    return Int_val(caml_callback(*g_i2f, Val_long(i)));
}

int32_t cd_ox_f2i(int32_t f)
{
    cd_ox_require_ready("cd_ox_f2i");
    return Int_val(caml_callback(*g_f2i, Val_long(f)));
}

int32_t cd_ox_fixmul(int32_t a, int32_t b)
{
    cd_ox_require_ready("cd_ox_fixmul");
    return Int_val(caml_callback2(*g_fixmul, Val_long(a), Val_long(b)));
}

int32_t cd_ox_fixdiv(int32_t a, int32_t b)
{
    cd_ox_require_ready("cd_ox_fixdiv");
    return Int_val(caml_callback2(*g_fixdiv, Val_long(a), Val_long(b)));
}

int32_t cd_ox_fix_sqrt(int32_t a)
{
    cd_ox_require_ready("cd_ox_fix_sqrt");
    return Int_val(caml_callback(*g_fix_sqrt, Val_long(a)));
}

int32_t cd_ox_fix_isqrt(int32_t a)
{
    cd_ox_require_ready("cd_ox_fix_isqrt");
    return Int_val(caml_callback(*g_fix_isqrt, Val_long(a)));
}

int32_t cd_ox_fix_asin(int32_t v)
{
    cd_ox_require_ready("cd_ox_fix_asin");
    return Int_val(caml_callback(*g_fix_asin, Val_long(v)));
}

int32_t cd_ox_fix_acos(int32_t v)
{
    cd_ox_require_ready("cd_ox_fix_acos");
    return Int_val(caml_callback(*g_fix_acos, Val_long(v)));
}

int32_t cd_ox_fix_atan2(int32_t cosv, int32_t sinv)
{
    cd_ox_require_ready("cd_ox_fix_atan2");
    return Int_val(caml_callback2(*g_fix_atan2, Val_long(cosv), Val_long(sinv)));
}

void cd_ox_fix_sincos(int32_t a, int32_t* s, int32_t* c)
{
    cd_ox_require_ready("cd_ox_fix_sincos");
    const value out = caml_callback(*g_fix_sincos, Val_long(a));
    if (s)
    {
        *s = Int_val(Field(out, 0));
    }
    if (c)
    {
        *c = Int_val(Field(out, 1));
    }
}

void cd_ox_fix_fastsincos(int32_t a, int32_t* s, int32_t* c)
{
    cd_ox_require_ready("cd_ox_fix_fastsincos");
    const value out = caml_callback(*g_fix_fastsincos, Val_long(a));
    if (s)
    {
        *s = Int_val(Field(out, 0));
    }
    if (c)
    {
        *c = Int_val(Field(out, 1));
    }
}

static void cd_ox_unpack_vec3(const value out, int32_t* x, int32_t* y, int32_t* z)
{
    if (x)
    {
        *x = Int_val(Field(out, 0));
    }
    if (y)
    {
        *y = Int_val(Field(out, 1));
    }
    if (z)
    {
        *z = Int_val(Field(out, 2));
    }
}

void cd_ox_vm_vec_add(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_add");
    value args[6] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_add, 6, args), x, y, z);
}

void cd_ox_vm_vec_sub(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_sub");
    value args[6] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_sub, 6, args), x, y, z);
}

void cd_ox_vm_vec_add2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_add2");
    value args[6] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(sx), Val_long(sy), Val_long(sz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_add2, 6, args), x, y, z);
}

void cd_ox_vm_vec_sub2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_sub2");
    value args[6] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(sx), Val_long(sy), Val_long(sz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_sub2, 6, args), x, y, z);
}

void cd_ox_vm_vec_avg(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_avg");
    value args[6] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_avg, 6, args), x, y, z);
}

void cd_ox_vm_vec_avg4(
    int32_t a1,
    int32_t a2,
    int32_t a3,
    int32_t b1,
    int32_t b2,
    int32_t b3,
    int32_t c1,
    int32_t c2,
    int32_t c3,
    int32_t d1,
    int32_t d2,
    int32_t d3,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_avg4");
    value args[12] = {
        Val_long(a1),
        Val_long(a2),
        Val_long(a3),
        Val_long(b1),
        Val_long(b2),
        Val_long(b3),
        Val_long(c1),
        Val_long(c2),
        Val_long(c3),
        Val_long(d1),
        Val_long(d2),
        Val_long(d3),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_avg4, 12, args), x, y, z);
}

void cd_ox_vm_vec_copy_scale(int32_t sx, int32_t sy, int32_t sz, int32_t k, int32_t* x, int32_t* y, int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_copy_scale");
    value args[4] = { Val_long(sx), Val_long(sy), Val_long(sz), Val_long(k) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_copy_scale, 4, args), x, y, z);
}

void cd_ox_vm_vec_scale_add(
    int32_t ax,
    int32_t ay,
    int32_t az,
    int32_t bx,
    int32_t by,
    int32_t bz,
    int32_t k,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_scale_add");
    value args[7] = { Val_long(ax), Val_long(ay), Val_long(az), Val_long(bx), Val_long(by), Val_long(bz), Val_long(k) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_scale_add, 7, args), x, y, z);
}

void cd_ox_vm_vec_scale_add2(
    int32_t dx,
    int32_t dy,
    int32_t dz,
    int32_t sx,
    int32_t sy,
    int32_t sz,
    int32_t k,
    int32_t* x,
    int32_t* y,
    int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_scale_add2");
    value args[7] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(sx), Val_long(sy), Val_long(sz), Val_long(k) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_scale_add2, 7, args), x, y, z);
}

void cd_ox_vm_vec_scale2(int32_t dx, int32_t dy, int32_t dz, int32_t n, int32_t d, int32_t* x, int32_t* y, int32_t* z)
{
    cd_ox_require_ready("cd_ox_vm_vec_scale2");
    value args[5] = { Val_long(dx), Val_long(dy), Val_long(dz), Val_long(n), Val_long(d) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_scale2, 5, args), x, y, z);
}
