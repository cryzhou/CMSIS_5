
TARGET_ARCH := ARMv8MMLlsfsp
BIG_ENDIAN := 0

CFLAGS_TARGET = -march=armv8-m.main -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -DARM_MATH_ARMV8MML -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DUNALIGNED_SUPPORT_DISABLE -D__FPU_PRESENT=1U
CPPFLAGS_TARGET = -march=armv8-m.main -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -DARM_MATH_ARMV8MML -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DUNALIGNED_SUPPORT_DISABLE -D__FPU_PRESENT=1U
ASFLAGS_TARGET =  -march=armv8-m.main -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -DARM_MATH_ARMV8MML -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -DUNALIGNED_SUPPORT_DISABLE -D__FPU_PRESENT=1U
ARFLAGS_TARGET = 
CLDFLAGS_TARGET = -march=armv8-m.main -mfpu=fpv5-sp-d16 -mfloat-abi=softfp
CPPLDFLAGS_TARGET = -march=armv8-m.main -mfpu=fpv5-sp-d16 -mfloat-abi=softfp

include ./arm_cortexM_math.mk