#include "bridge.h"

#include <caml/callback.h>
#include <caml/mlvalues.h>
#include <caml/startup.h>

static int g_runtime_started = 0;
static const value* g_i2f = NULL;
static const value* g_f2i = NULL;
static const value* g_fixmul = NULL;
static const value* g_fixdiv = NULL;

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

    if (!g_i2f || !g_f2i || !g_fixmul || !g_fixdiv)
    {
        return 1;
    }

    g_runtime_started = 1;
    return 0;
}

int32_t cd_ox_i2f(int32_t i)
{
    return g_i2f ? Int_val(caml_callback(*g_i2f, Val_long(i))) : 0;
}

int32_t cd_ox_f2i(int32_t f)
{
    return g_f2i ? Int_val(caml_callback(*g_f2i, Val_long(f))) : 0;
}

int32_t cd_ox_fixmul(int32_t a, int32_t b)
{
    return g_fixmul ? Int_val(caml_callback2(*g_fixmul, Val_long(a), Val_long(b))) : 0;
}

int32_t cd_ox_fixdiv(int32_t a, int32_t b)
{
    return g_fixdiv ? Int_val(caml_callback2(*g_fixdiv, Val_long(a), Val_long(b))) : 0;
}
