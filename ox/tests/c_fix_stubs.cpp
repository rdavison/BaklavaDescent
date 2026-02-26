extern "C" {
#include <caml/mlvalues.h>
}

#include "c_oracle.h"

extern "C" CAMLprim value caml_c_fixmul(value a, value b)
{
    return Val_long(c_oracle_fixmul(Int_val(a), Int_val(b)));
}

extern "C" CAMLprim value caml_c_fixdiv(value a, value b)
{
    return Val_long(c_oracle_fixdiv(Int_val(a), Int_val(b)));
}
