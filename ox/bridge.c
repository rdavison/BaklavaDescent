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
static const value* g_vm_vec_mag = NULL;
static const value* g_vm_vec_dist = NULL;
static const value* g_vm_vec_dotprod = NULL;
static const value* g_vm_vec_dot3 = NULL;
static const value* g_vm_vec_crossprod = NULL;
static const value* g_vm_vec_perp = NULL;
static const value* g_vm_vec_copy_normalize = NULL;
static const value* g_vm_vec_rotate = NULL;
static const value* g_sincos_2_matrix = NULL;
static const value* g_vm_angles_2_matrix = NULL;
static const value* g_vm_vec_ang_2_matrix = NULL;
static const value* g_vm_transpose_matrix = NULL;
static const value* g_vm_matrix_x_matrix = NULL;
static const value* g_vm_vector_2_matrix = NULL;
static const value* g_vm_extract_angles_matrix = NULL;
static const value* g_vm_extract_angles_vector_normalized = NULL;
static const value* g_vm_extract_angles_vector = NULL;
static const value* g_vm_vec_delta_ang_norm = NULL;
static const value* g_vm_vec_delta_ang = NULL;
static const value* g_vm_vec_mag_quick = NULL;
static const value* g_vm_vec_dist_quick = NULL;
static const value* g_vm_vec_copy_normalize_quick = NULL;
static const value* g_g3_code_point = NULL;
static const value* g_checkmuldiv = NULL;
static const value* g_g3_rotate_point = NULL;
static const value* g_g3_project_point = NULL;
static const value* g_g3_rotate_delta_x = NULL;
static const value* g_g3_rotate_delta_y = NULL;
static const value* g_g3_rotate_delta_z = NULL;
static const value* g_g3_calc_point_depth = NULL;
static const value* g_scale_matrix = NULL;
static const value* g_g3_start_instance_matrix = NULL;
static const value* g_g3_point_2_vec = NULL;

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
          && g_vm_vec_scale2
          && g_vm_vec_mag
          && g_vm_vec_dist
          && g_vm_vec_dotprod
          && g_vm_vec_dot3
          && g_vm_vec_crossprod
          && g_vm_vec_perp
          && g_vm_vec_copy_normalize
          && g_vm_vec_rotate
          && g_sincos_2_matrix
          && g_vm_angles_2_matrix
          && g_vm_vec_ang_2_matrix
          && g_vm_transpose_matrix
          && g_vm_matrix_x_matrix
          && g_vm_vector_2_matrix
          && g_vm_extract_angles_matrix
          && g_vm_extract_angles_vector_normalized
          && g_vm_extract_angles_vector
          && g_vm_vec_delta_ang_norm
          && g_vm_vec_delta_ang
          && g_vm_vec_mag_quick
          && g_vm_vec_dist_quick
          && g_vm_vec_copy_normalize_quick
          && g_g3_code_point
          && g_checkmuldiv
          && g_g3_rotate_point
          && g_g3_project_point
          && g_g3_rotate_delta_x
          && g_g3_rotate_delta_y
          && g_g3_rotate_delta_z
          && g_g3_calc_point_depth
          && g_scale_matrix
          && g_g3_start_instance_matrix
          && g_g3_point_2_vec))
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
    g_vm_vec_mag = caml_named_value("cd_vm_vec_mag");
    g_vm_vec_dist = caml_named_value("cd_vm_vec_dist");
    g_vm_vec_dotprod = caml_named_value("cd_vm_vec_dotprod");
    g_vm_vec_dot3 = caml_named_value("cd_vm_vec_dot3");
    g_vm_vec_crossprod = caml_named_value("cd_vm_vec_crossprod");
    g_vm_vec_perp = caml_named_value("cd_vm_vec_perp");
    g_vm_vec_copy_normalize = caml_named_value("cd_vm_vec_copy_normalize");
    g_vm_vec_rotate = caml_named_value("cd_vm_vec_rotate");
    g_sincos_2_matrix = caml_named_value("cd_sincos_2_matrix");
    g_vm_angles_2_matrix = caml_named_value("cd_vm_angles_2_matrix");
    g_vm_vec_ang_2_matrix = caml_named_value("cd_vm_vec_ang_2_matrix");
    g_vm_transpose_matrix = caml_named_value("cd_vm_transpose_matrix");
    g_vm_matrix_x_matrix = caml_named_value("cd_vm_matrix_x_matrix");
    g_vm_vector_2_matrix = caml_named_value("cd_vm_vector_2_matrix");
    g_vm_extract_angles_matrix = caml_named_value("cd_vm_extract_angles_matrix");
    g_vm_extract_angles_vector_normalized = caml_named_value("cd_vm_extract_angles_vector_normalized");
    g_vm_extract_angles_vector = caml_named_value("cd_vm_extract_angles_vector");
    g_vm_vec_delta_ang_norm = caml_named_value("cd_vm_vec_delta_ang_norm");
    g_vm_vec_delta_ang = caml_named_value("cd_vm_vec_delta_ang");
    g_vm_vec_mag_quick = caml_named_value("cd_vm_vec_mag_quick");
    g_vm_vec_dist_quick = caml_named_value("cd_vm_vec_dist_quick");
    g_vm_vec_copy_normalize_quick = caml_named_value("cd_vm_vec_copy_normalize_quick");
    g_g3_code_point = caml_named_value("cd_g3_code_point");
    g_checkmuldiv = caml_named_value("cd_checkmuldiv");
    g_g3_rotate_point = caml_named_value("cd_g3_rotate_point");
    g_g3_project_point = caml_named_value("cd_g3_project_point");
    g_g3_rotate_delta_x = caml_named_value("cd_g3_rotate_delta_x");
    g_g3_rotate_delta_y = caml_named_value("cd_g3_rotate_delta_y");
    g_g3_rotate_delta_z = caml_named_value("cd_g3_rotate_delta_z");
    g_g3_calc_point_depth = caml_named_value("cd_g3_calc_point_depth");
    g_scale_matrix = caml_named_value("cd_scale_matrix");
    g_g3_start_instance_matrix = caml_named_value("cd_g3_start_instance_matrix");
    g_g3_point_2_vec = caml_named_value("cd_g3_point_2_vec");

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
        || !g_vm_vec_scale2
        || !g_vm_vec_mag
        || !g_vm_vec_dist
        || !g_vm_vec_dotprod
        || !g_vm_vec_dot3
        || !g_vm_vec_crossprod
        || !g_vm_vec_perp
        || !g_vm_vec_copy_normalize
        || !g_vm_vec_rotate
        || !g_sincos_2_matrix
        || !g_vm_angles_2_matrix
        || !g_vm_vec_ang_2_matrix
        || !g_vm_transpose_matrix
        || !g_vm_matrix_x_matrix
        || !g_vm_vector_2_matrix
        || !g_vm_extract_angles_matrix
        || !g_vm_extract_angles_vector_normalized
        || !g_vm_extract_angles_vector
        || !g_vm_vec_delta_ang_norm
        || !g_vm_vec_delta_ang
        || !g_vm_vec_mag_quick
        || !g_vm_vec_dist_quick
        || !g_vm_vec_copy_normalize_quick
        || !g_g3_code_point
        || !g_checkmuldiv
        || !g_g3_rotate_point
        || !g_g3_project_point
        || !g_g3_rotate_delta_x
        || !g_g3_rotate_delta_y
        || !g_g3_rotate_delta_z
        || !g_g3_calc_point_depth
        || !g_scale_matrix
        || !g_g3_start_instance_matrix
        || !g_g3_point_2_vec)
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
           && g_vm_vec_scale2
           && g_vm_vec_mag
           && g_vm_vec_dist
           && g_vm_vec_dotprod
           && g_vm_vec_dot3
           && g_vm_vec_crossprod
           && g_vm_vec_perp
           && g_vm_vec_copy_normalize
           && g_vm_vec_rotate
           && g_sincos_2_matrix
           && g_vm_angles_2_matrix
           && g_vm_vec_ang_2_matrix
           && g_vm_transpose_matrix
           && g_vm_matrix_x_matrix
           && g_vm_vector_2_matrix
           && g_vm_extract_angles_matrix
           && g_vm_extract_angles_vector_normalized
           && g_vm_extract_angles_vector
           && g_vm_vec_delta_ang_norm
           && g_vm_vec_delta_ang
           && g_vm_vec_mag_quick
           && g_vm_vec_dist_quick
           && g_vm_vec_copy_normalize_quick
           && g_g3_code_point
           && g_checkmuldiv
           && g_g3_rotate_point
           && g_g3_project_point
           && g_g3_rotate_delta_x
           && g_g3_rotate_delta_y
           && g_g3_rotate_delta_z
           && g_g3_calc_point_depth
           && g_scale_matrix
           && g_g3_start_instance_matrix
           && g_g3_point_2_vec;
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

int32_t cd_ox_vm_vec_mag(int32_t x, int32_t y, int32_t z)
{
    cd_ox_require_ready("cd_ox_vm_vec_mag");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    return Int_val(caml_callbackN(*g_vm_vec_mag, 3, args));
}

int32_t cd_ox_vm_vec_dist(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1)
{
    cd_ox_require_ready("cd_ox_vm_vec_dist");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    return Int_val(caml_callbackN(*g_vm_vec_dist, 6, args));
}

int32_t cd_ox_vm_vec_dotprod(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1)
{
    cd_ox_require_ready("cd_ox_vm_vec_dotprod");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    return Int_val(caml_callbackN(*g_vm_vec_dotprod, 6, args));
}

int32_t cd_ox_vm_vec_dot3(int32_t x, int32_t y, int32_t z, int32_t vx, int32_t vy, int32_t vz)
{
    cd_ox_require_ready("cd_ox_vm_vec_dot3");
    value args[6] = { Val_long(x), Val_long(y), Val_long(z), Val_long(vx), Val_long(vy), Val_long(vz) };
    return Int_val(caml_callbackN(*g_vm_vec_dot3, 6, args));
}

void cd_ox_vm_vec_crossprod(
    int32_t x0, int32_t y0, int32_t z0,
    int32_t x1, int32_t y1, int32_t z1,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_vm_vec_crossprod");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_crossprod, 6, args), rx, ry, rz);
}

void cd_ox_vm_vec_perp(
    int32_t p0x, int32_t p0y, int32_t p0z,
    int32_t p1x, int32_t p1y, int32_t p1z,
    int32_t p2x, int32_t p2y, int32_t p2z,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_vm_vec_perp");
    value args[9] = {
        Val_long(p0x), Val_long(p0y), Val_long(p0z),
        Val_long(p1x), Val_long(p1y), Val_long(p1z),
        Val_long(p2x), Val_long(p2y), Val_long(p2z),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_perp, 9, args), rx, ry, rz);
}

int32_t cd_ox_vm_vec_copy_normalize(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t* nx, int32_t* ny, int32_t* nz)
{
    cd_ox_require_ready("cd_ox_vm_vec_copy_normalize");
    value args[3] = { Val_long(sx), Val_long(sy), Val_long(sz) };
    const value out = caml_callbackN(*g_vm_vec_copy_normalize, 3, args);
    int32_t mag = Int_val(Field(out, 0));
    if (nx) { *nx = Int_val(Field(out, 1)); }
    if (ny) { *ny = Int_val(Field(out, 2)); }
    if (nz) { *nz = Int_val(Field(out, 3)); }
    return mag;
}

void cd_ox_vm_vec_rotate(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_vm_vec_rotate");
    value args[12] = {
        Val_long(sx), Val_long(sy), Val_long(sz),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_vm_vec_rotate, 12, args), rx, ry, rz);
}

static void cd_ox_unpack_matrix(const value out,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    value rvec = Field(out, 0);
    value uvec = Field(out, 1);
    value fvec = Field(out, 2);
    *r1 = Int_val(Field(rvec, 0)); *r2 = Int_val(Field(rvec, 1)); *r3 = Int_val(Field(rvec, 2));
    *u1 = Int_val(Field(uvec, 0)); *u2 = Int_val(Field(uvec, 1)); *u3 = Int_val(Field(uvec, 2));
    *f1 = Int_val(Field(fvec, 0)); *f2 = Int_val(Field(fvec, 1)); *f3 = Int_val(Field(fvec, 2));
}

static void cd_ox_unpack_ang3(const value out, int32_t* p, int32_t* b, int32_t* h)
{
    *p = Int_val(Field(out, 0));
    *b = Int_val(Field(out, 1));
    *h = Int_val(Field(out, 2));
}

void cd_ox_sincos_2_matrix(
    int32_t sinp, int32_t cosp, int32_t sinb, int32_t cosb, int32_t sinh, int32_t cosh,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_sincos_2_matrix");
    value args[6] = { Val_long(sinp), Val_long(cosp), Val_long(sinb), Val_long(cosb), Val_long(sinh), Val_long(cosh) };
    cd_ox_unpack_matrix(caml_callbackN(*g_sincos_2_matrix, 6, args), r1, r2, r3, u1, u2, u3, f1, f2, f3);
}

void cd_ox_vm_angles_2_matrix(
    int32_t p, int32_t b, int32_t h,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_vm_angles_2_matrix");
    value args[3] = { Val_long(p), Val_long(b), Val_long(h) };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_angles_2_matrix, 3, args), r1, r2, r3, u1, u2, u3, f1, f2, f3);
}

void cd_ox_vm_vec_ang_2_matrix(
    int32_t vx, int32_t vy, int32_t vz, int32_t a,
    int32_t* r1, int32_t* r2, int32_t* r3,
    int32_t* u1, int32_t* u2, int32_t* u3,
    int32_t* f1, int32_t* f2, int32_t* f3)
{
    cd_ox_require_ready("cd_ox_vm_vec_ang_2_matrix");
    value args[4] = { Val_long(vx), Val_long(vy), Val_long(vz), Val_long(a) };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_vec_ang_2_matrix, 4, args), r1, r2, r3, u1, u2, u3, f1, f2, f3);
}

void cd_ox_vm_transpose_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_transpose_matrix");
    value args[9] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_transpose_matrix, 9, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_matrix_x_matrix(
    int32_t s0r1, int32_t s0r2, int32_t s0r3,
    int32_t s0u1, int32_t s0u2, int32_t s0u3,
    int32_t s0f1, int32_t s0f2, int32_t s0f3,
    int32_t s1r1, int32_t s1r2, int32_t s1r3,
    int32_t s1u1, int32_t s1u2, int32_t s1u3,
    int32_t s1f1, int32_t s1f2, int32_t s1f3,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_matrix_x_matrix");
    value args[18] = {
        Val_long(s0r1), Val_long(s0r2), Val_long(s0r3),
        Val_long(s0u1), Val_long(s0u2), Val_long(s0u3),
        Val_long(s0f1), Val_long(s0f2), Val_long(s0f3),
        Val_long(s1r1), Val_long(s1r2), Val_long(s1r3),
        Val_long(s1u1), Val_long(s1u2), Val_long(s1u3),
        Val_long(s1f1), Val_long(s1f2), Val_long(s1f3),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_matrix_x_matrix, 18, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_vector_2_matrix(
    int32_t fx, int32_t fy, int32_t fz,
    int32_t has_uvec, int32_t ux, int32_t uy, int32_t uz,
    int32_t has_rvec, int32_t rx, int32_t ry, int32_t rz,
    int32_t* or1, int32_t* or2, int32_t* or3,
    int32_t* ou1, int32_t* ou2, int32_t* ou3,
    int32_t* of1, int32_t* of2, int32_t* of3)
{
    cd_ox_require_ready("cd_ox_vm_vector_2_matrix");
    value args[11] = {
        Val_long(fx), Val_long(fy), Val_long(fz),
        Val_long(has_uvec), Val_long(ux), Val_long(uy), Val_long(uz),
        Val_long(has_rvec), Val_long(rx), Val_long(ry), Val_long(rz),
    };
    cd_ox_unpack_matrix(caml_callbackN(*g_vm_vector_2_matrix, 11, args), or1, or2, or3, ou1, ou2, ou3, of1, of2, of3);
}

void cd_ox_vm_extract_angles_matrix(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* p, int32_t* b, int32_t* h)
{
    cd_ox_require_ready("cd_ox_vm_extract_angles_matrix");
    value args[9] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    cd_ox_unpack_ang3(caml_callbackN(*g_vm_extract_angles_matrix, 9, args), p, b, h);
}

void cd_ox_vm_extract_angles_vector_normalized(
    int32_t x, int32_t y, int32_t z,
    int32_t* p, int32_t* b, int32_t* h)
{
    cd_ox_require_ready("cd_ox_vm_extract_angles_vector_normalized");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    cd_ox_unpack_ang3(caml_callbackN(*g_vm_extract_angles_vector_normalized, 3, args), p, b, h);
}

void cd_ox_vm_extract_angles_vector(
    int32_t ip, int32_t ib, int32_t ih,
    int32_t vx, int32_t vy, int32_t vz,
    int32_t* p, int32_t* b, int32_t* h)
{
    cd_ox_require_ready("cd_ox_vm_extract_angles_vector");
    value args[6] = { Val_long(ip), Val_long(ib), Val_long(ih), Val_long(vx), Val_long(vy), Val_long(vz) };
    cd_ox_unpack_ang3(caml_callbackN(*g_vm_extract_angles_vector, 6, args), p, b, h);
}

int32_t cd_ox_vm_vec_delta_ang_norm(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t has_fvec, int32_t fx, int32_t fy, int32_t fz)
{
    cd_ox_require_ready("cd_ox_vm_vec_delta_ang_norm");
    value args[10] = {
        Val_long(v0x), Val_long(v0y), Val_long(v0z),
        Val_long(v1x), Val_long(v1y), Val_long(v1z),
        Val_long(has_fvec), Val_long(fx), Val_long(fy), Val_long(fz),
    };
    return Int_val(caml_callbackN(*g_vm_vec_delta_ang_norm, 10, args));
}

int32_t cd_ox_vm_vec_delta_ang(
    int32_t v0x, int32_t v0y, int32_t v0z,
    int32_t v1x, int32_t v1y, int32_t v1z,
    int32_t has_fvec, int32_t fx, int32_t fy, int32_t fz)
{
    cd_ox_require_ready("cd_ox_vm_vec_delta_ang");
    value args[10] = {
        Val_long(v0x), Val_long(v0y), Val_long(v0z),
        Val_long(v1x), Val_long(v1y), Val_long(v1z),
        Val_long(has_fvec), Val_long(fx), Val_long(fy), Val_long(fz),
    };
    return Int_val(caml_callbackN(*g_vm_vec_delta_ang, 10, args));
}

int32_t cd_ox_vm_vec_mag_quick(int32_t x, int32_t y, int32_t z)
{
    cd_ox_require_ready("cd_ox_vm_vec_mag_quick");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    return Int_val(caml_callbackN(*g_vm_vec_mag_quick, 3, args));
}

int32_t cd_ox_vm_vec_dist_quick(int32_t x0, int32_t y0, int32_t z0, int32_t x1, int32_t y1, int32_t z1)
{
    cd_ox_require_ready("cd_ox_vm_vec_dist_quick");
    value args[6] = { Val_long(x0), Val_long(y0), Val_long(z0), Val_long(x1), Val_long(y1), Val_long(z1) };
    return Int_val(caml_callbackN(*g_vm_vec_dist_quick, 6, args));
}

int32_t cd_ox_vm_vec_copy_normalize_quick(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t* nx, int32_t* ny, int32_t* nz)
{
    cd_ox_require_ready("cd_ox_vm_vec_copy_normalize_quick");
    value args[3] = { Val_long(sx), Val_long(sy), Val_long(sz) };
    const value out = caml_callbackN(*g_vm_vec_copy_normalize_quick, 3, args);
    int32_t mag = Int_val(Field(out, 0));
    if (nx) { *nx = Int_val(Field(out, 1)); }
    if (ny) { *ny = Int_val(Field(out, 2)); }
    if (nz) { *nz = Int_val(Field(out, 3)); }
    return mag;
}

/* ---- 3D pipeline bridge functions ---- */

uint8_t cd_ox_g3_code_point(int32_t x, int32_t y, int32_t z)
{
    cd_ox_require_ready("cd_ox_g3_code_point");
    value args[3] = { Val_long(x), Val_long(y), Val_long(z) };
    return (uint8_t)Int_val(caml_callbackN(*g_g3_code_point, 3, args));
}

int cd_ox_checkmuldiv(int32_t* r, int32_t a, int32_t b, int32_t c)
{
    cd_ox_require_ready("cd_ox_checkmuldiv");
    value args[3] = { Val_long(a), Val_long(b), Val_long(c) };
    const value out = caml_callbackN(*g_checkmuldiv, 3, args);
    int ok = Int_val(Field(out, 0));
    *r = Int_val(Field(out, 1));
    return ok;
}

void cd_ox_g3_rotate_point(
    int32_t sx, int32_t sy, int32_t sz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t* rx, int32_t* ry, int32_t* rz, uint8_t* codes)
{
    cd_ox_require_ready("cd_ox_g3_rotate_point");
    value args[15] = {
        Val_long(sx), Val_long(sy), Val_long(sz),
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
    };
    const value out = caml_callbackN(*g_g3_rotate_point, 15, args);
    *rx = Int_val(Field(out, 0));
    *ry = Int_val(Field(out, 1));
    *rz = Int_val(Field(out, 2));
    *codes = (uint8_t)Int_val(Field(out, 3));
}

int cd_ox_g3_project_point(
    int32_t x, int32_t y, int32_t z,
    int32_t canv_w2, int32_t canv_h2,
    int32_t* sx, int32_t* sy)
{
    cd_ox_require_ready("cd_ox_g3_project_point");
    value args[5] = { Val_long(x), Val_long(y), Val_long(z), Val_long(canv_w2), Val_long(canv_h2) };
    const value out = caml_callbackN(*g_g3_project_point, 5, args);
    int ok = Int_val(Field(out, 0));
    *sx = Int_val(Field(out, 1));
    *sy = Int_val(Field(out, 2));
    return ok;
}

void cd_ox_g3_rotate_delta_x(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dx,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_g3_rotate_delta_x");
    value args[10] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(dx),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_g3_rotate_delta_x, 10, args), rx, ry, rz);
}

void cd_ox_g3_rotate_delta_y(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dy,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_g3_rotate_delta_y");
    value args[10] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(dy),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_g3_rotate_delta_y, 10, args), rx, ry, rz);
}

void cd_ox_g3_rotate_delta_z(
    int32_t r1, int32_t r2, int32_t r3,
    int32_t u1, int32_t u2, int32_t u3,
    int32_t f1, int32_t f2, int32_t f3,
    int32_t dz,
    int32_t* rx, int32_t* ry, int32_t* rz)
{
    cd_ox_require_ready("cd_ox_g3_rotate_delta_z");
    value args[10] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(dz),
    };
    cd_ox_unpack_vec3(caml_callbackN(*g_g3_rotate_delta_z, 10, args), rx, ry, rz);
}

int32_t cd_ox_g3_calc_point_depth(
    int32_t px, int32_t py, int32_t pz,
    int32_t vpx, int32_t vpy, int32_t vpz,
    int32_t fx, int32_t fy, int32_t fz)
{
    cd_ox_require_ready("cd_ox_g3_calc_point_depth");
    value args[9] = {
        Val_long(px), Val_long(py), Val_long(pz),
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(fx), Val_long(fy), Val_long(fz),
    };
    return Int_val(caml_callbackN(*g_g3_calc_point_depth, 9, args));
}

void cd_ox_scale_matrix(
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
    cd_ox_require_ready("cd_ox_scale_matrix");
    value args[13] = {
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(wsx), Val_long(wsy), Val_long(wsz),
        Val_long(zoom),
    };
    const value out = caml_callbackN(*g_scale_matrix, 13, args);
    *or1 = Int_val(Field(out, 0)); *or2 = Int_val(Field(out, 1)); *or3 = Int_val(Field(out, 2));
    *ou1 = Int_val(Field(out, 3)); *ou2 = Int_val(Field(out, 4)); *ou3 = Int_val(Field(out, 5));
    *of1 = Int_val(Field(out, 6)); *of2 = Int_val(Field(out, 7)); *of3 = Int_val(Field(out, 8));
    *msx = Int_val(Field(out, 9)); *msy = Int_val(Field(out, 10)); *msz = Int_val(Field(out, 11));
}

void cd_ox_g3_start_instance_matrix(
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
    cd_ox_require_ready("cd_ox_g3_start_instance_matrix");
    value args[25] = {
        Val_long(vpx), Val_long(vpy), Val_long(vpz),
        Val_long(r1), Val_long(r2), Val_long(r3),
        Val_long(u1), Val_long(u2), Val_long(u3),
        Val_long(f1), Val_long(f2), Val_long(f3),
        Val_long(px), Val_long(py), Val_long(pz),
        Val_long(has_orient),
        Val_long(mr1), Val_long(mr2), Val_long(mr3),
        Val_long(mu1), Val_long(mu2), Val_long(mu3),
        Val_long(mf1), Val_long(mf2), Val_long(mf3),
    };
    const value out = caml_callbackN(*g_g3_start_instance_matrix, 25, args);
    *nvpx = Int_val(Field(out, 0)); *nvpy = Int_val(Field(out, 1)); *nvpz = Int_val(Field(out, 2));
    *nr1 = Int_val(Field(out, 3)); *nr2 = Int_val(Field(out, 4)); *nr3 = Int_val(Field(out, 5));
    *nu1 = Int_val(Field(out, 6)); *nu2 = Int_val(Field(out, 7)); *nu3 = Int_val(Field(out, 8));
    *nf1 = Int_val(Field(out, 9)); *nf2 = Int_val(Field(out, 10)); *nf3 = Int_val(Field(out, 11));
}

void cd_ox_g3_point_2_vec(
    int32_t sx, int32_t sy,
    int32_t canv_w2, int32_t canv_h2,
    int32_t msx, int32_t msy, int32_t msz,
    int32_t ur1, int32_t ur2, int32_t ur3,
    int32_t uu1, int32_t uu2, int32_t uu3,
    int32_t uf1, int32_t uf2, int32_t uf3,
    int32_t* vx, int32_t* vy, int32_t* vz)
{
    cd_ox_require_ready("cd_ox_g3_point_2_vec");
    value args[16] = {
        Val_long(sx), Val_long(sy),
        Val_long(canv_w2), Val_long(canv_h2),
        Val_long(msx), Val_long(msy), Val_long(msz),
        Val_long(ur1), Val_long(ur2), Val_long(ur3),
        Val_long(uu1), Val_long(uu2), Val_long(uu3),
        Val_long(uf1), Val_long(uf2), Val_long(uf3),
    };
    const value out = caml_callbackN(*g_g3_point_2_vec, 16, args);
    *vx = Int_val(Field(out, 0)); *vy = Int_val(Field(out, 1)); *vz = Int_val(Field(out, 2));
}
