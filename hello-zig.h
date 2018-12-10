#ifndef HELLO_2D_ZIG_2D_IOS_2D_X86_64_H
#define HELLO_2D_ZIG_2D_IOS_2D_X86_64_H

#include <stdint.h>

#ifdef __cplusplus
#define HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXTERN_C extern "C"
#else
#define HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXTERN_C
#endif

#if defined(_WIN32)
#define HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXPORT HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXTERN_C __declspec(dllimport)
#else
#define HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXPORT HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXTERN_C __attribute__((visibility ("default")))
#endif

HELLO_2D_ZIG_2D_IOS_2D_X86_64_EXPORT int32_t add(int32_t a, int32_t b);

#endif
