#include "c_oracle.h"

#include "fix/fix.h"

extern "C" int32_t c_oracle_fixmul(int32_t a, int32_t b)
{
    return fixmul(a, b);
}

extern "C" int32_t c_oracle_fixdiv(int32_t a, int32_t b)
{
    return fixdiv(a, b);
}
