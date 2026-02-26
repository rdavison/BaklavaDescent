#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

int32_t c_oracle_i2f(int32_t i);
int32_t c_oracle_f2i(int32_t f);
int32_t c_oracle_fixmul(int32_t a, int32_t b);
int32_t c_oracle_fixdiv(int32_t a, int32_t b);
int32_t c_oracle_fixmuldiv(int32_t a, int32_t b, int32_t c);

#ifdef __cplusplus
}
#endif
