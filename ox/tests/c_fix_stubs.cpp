extern "C" {
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
