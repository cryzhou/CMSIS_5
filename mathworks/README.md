# CMSIS Version 5 Soft-FPU ABI

The build system compiles CMSIS 5 DSP library functions and creates libraries compatible for Soft-FPU ABI.

Running a Build

The makefile (link to arm_cortexM_math_Build.mk) is used to build CMSIS_5 to create additional libraries compatible with Soft-FPU ABI.
To build CMSIS_5 package:

```
make -f arm_cortexM_math_Build.mk GNU_ARM_TOOLS_PATH=<Toolchain path>
```

Here ``` <Toolchain path> ``` is [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads).
