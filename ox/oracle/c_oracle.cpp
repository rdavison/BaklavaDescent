#include "c_oracle.h"

#include "fix/fix.h"

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
