
# Create CMSIS math library for Cortex-M7 with Soft FPU ABI
TARGET_ARCH := cortexM4bsf
BIG_ENDIAN := 1

CFLAGS_TARGET = -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DUNALIGNED_SUPPORT_DISABLE -D__FPU_PRESENT=1U
CPPFLAGS_TARGET = -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DUNALIGNED_SUPPORT_DISABLE -D__FPU_PRESENT=1U
ASFLAGS_TARGET =  -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DUNALIGNED_SUPPORT_DISABLE -D__FPU_PRESENT=1U
ARFLAGS_TARGET = 
CLDFLAGS_TARGET = -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
CPPLDFLAGS_TARGET = -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp

include ./arm_cortexM_math.mk