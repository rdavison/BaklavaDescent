#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

int cd_ox_init_runtime(const char* executable_path);
int cd_ox_is_ready(void);
int32_t cd_ox_i2f(int32_t i);
int32_t cd_ox_f2i(int32_t f);
int32_t cd_ox_fixmul(int32_t a, int32_t b);
int32_t cd_ox_fixdiv(int32_t a, int32_t b);

#ifdef __cplusplus
}
#endif
