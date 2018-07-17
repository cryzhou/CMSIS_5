
ifeq ($(OS),Windows_NT)

MAKEDIR := mkdir
MAKEDIRFLAGS := 
RM := del
RMFLAGS := /q /f
CP := xcopy
CPFLAGS := /e /r /y /q /i
CPFILEFLAGS := /r /y
CPWILDCARD := 
FILESEP := \

else

MAKEDIR := mkdir
MAKEDIRFLAGS := -p
RM := rm
RMFLAGS := -rf
CPFILEFLAGS := -f
CP := cp
CPFLAGS := -r
CPWILDCARD := /*
FILESEP := /

endif


# CMSIS Packaging directory list
CMSISPKG := ./CMSIS
CMSIS := ../CMSIS
CMSISPKGINCLUDE := $(CMSISPKG)/Include
CMSISPKGLIB := $(CMSISPKG)/Lib
CMSISPKGLIB_ := $(CMSISPKG)/Lib
CMSISPKGRTOS := $(CMSISPKG)/RTOS
CMSISLIB := $(CMSIS)/Lib
CMSISMWLIB := ./Lib$(CPWILDCARD)
CMSISMWLIB_ := ./Lib
CMSISCOREINCLUDE := $(CMSIS)/Core/Include
CMSISDSPINCLUDE := $(CMSIS)/DSP/Include
CMSISRTOS := $(CMSIS)/RTOS
CMSISRTOSRTXINC := $(CMSIS)/RTOS/RTX/INC
CMSISRTOSRTXLIB := $(CMSIS)/RTOS/RTX/LIB
CMSISRTOSRTXSRC := $(CMSIS)/RTOS/RTX/SRC
CMSISRTOSRTXTEMPLATES := $(CMSIS)/RTOS/RTX/Templates
CMSISPKGRTOSRTXINC := $(CMSISPKG)/RTOS/RTX/INC
CMSISPKGRTOSRTXLIB := $(CMSISPKG)/RTOS/RTX/LIB
CMSISPKGRTOSRTXSRC := $(CMSISPKG)/RTOS/RTX/SRC
CMSISPKGRTOSRTXTEMPLATES := $(CMSISPKG)/RTOS/RTX/Templates
CMSISLICENSE := ../LICENSE.txt
CMSISPKGLICENSE := $(CMSISPKG)/LICENSE.txt


ifeq ($(OS),Windows_NT)
CMSISPKG := $(subst /,\,$(CMSISPKG))
CMSISPKGINCLUDE := $(subst /,\,$(CMSISPKGINCLUDE))
CMSISPKGLIB := $(subst /,\,$(CMSISPKGLIB))
CMSISPKGRTOS := $(subst /,\,$(CMSISPKGRTOS))
CMSISLIB := $(subst /,\,$(CMSISLIB))
CMSISMWLIB := $(subst /,\,$(CMSISMWLIB))
CMSISCOREINCLUDE := $(subst /,\,$(CMSISCOREINCLUDE))
CMSISDSPINCLUDE := $(subst /,\,$(CMSISDSPINCLUDE))
CMSISRTOSRTX := $(subst /,\,$(CMSISRTOS))
CMSISLICENSE := $(subst /,\,$(CMSISLICENSE))
CMSISRTOSRTXINC := $(subst /,\,$(CMSISRTOSRTXINC))
CMSISRTOSRTXLIB := $(subst /,\,$(CMSISRTOSRTXLIB))
CMSISRTOSRTXSRC := $(subst /,\,$(CMSISRTOSRTXSRC))
CMSISRTOSRTXTEMPLATES := $(subst /,\,$(CMSISRTOSRTXTEMPLATES))
CMSISPKGRTOSRTXINC := $(subst /,\,$(CMSISPKGRTOSRTXINC))
CMSISPKGRTOSRTXLIB := $(subst /,\,$(CMSISPKGRTOSRTXLIB))
CMSISPKGRTOSRTXSRC := $(subst /,\,$(CMSISPKGRTOSRTXSRC))
CMSISPKGRTOSRTXTEMPLATES := $(subst /,\,$(CMSISPKGRTOSRTXTEMPLATES))
endif


.PHONY : all build clean info


$(CMSISPKGLICENSE) : $(CMSISLICENSE)
	$(CP) "$(CMSISLICENSE)" "$(CMSISPKG)" $(CPFILEFLAGS)

$(CMSISPKG) : 
	@echo Creating CMSIS package
	$(MAKEDIR) $(MAKEDIRFLAGS) "$(CMSISPKG)"

$(CMSISPKGINCLUDE) : 
	@echo	Copying ARM Cortex-M Core Include directory
	$(CP) $(CPFLAGS) $(CMSISCOREINCLUDE) $(CMSISPKGINCLUDE)
	@echo	Copying ARM Cortex-M DSP Include directory
	$(CP) $(CPFLAGS) $(CMSISDSPINCLUDE) $(CMSISPKGINCLUDE)

$(CMSISPKGLIB) : 
	@echo	Copying DSP library from CMSIS package
	$(CP) $(CPFLAGS) $(CMSISLIB) $(CMSISPKGLIB)
	@echo	Copying DSP library compiled with Soft FPU ABI
	$(CP) $(CPFLAGS) $(CMSISMWLIB) $(CMSISPKGLIB)

$(CMSISPKGRTOSRTXINC) : 
	@echo	Copying RTOS RTX Include
	$(CP) $(CPFLAGS) $(CMSISRTOSRTXINC) $(CMSISPKGRTOSRTXINC)

$(CMSISPKGRTOSRTXSRC) : 
	@echo	Copying RTOS RTX Source
	$(CP) $(CPFLAGS) $(CMSISRTOSRTXSRC) $(CMSISPKGRTOSRTXSRC)

$(CMSISPKGRTOSRTXLIB) : 
	@echo	Copying RTOS RTX LIB
	$(CP) $(CPFLAGS) $(CMSISRTOSRTXLIB) $(CMSISPKGRTOSRTXLIB)

$(CMSISPKGRTOSRTXTEMPLATES) : 
	@echo	Copying RTOS RTX Templates
	$(CP) $(CPFLAGS) $(CMSISRTOSRTXTEMPLATES) $(CMSISPKGRTOSRTXTEMPLATES)

	
all : build $(CMSISPKG) $(CMSISPKGLICENSE) $(CMSISPKGINCLUDE) $(CMSISPKGLIB) $(CMSISPKGRTOSRTXTEMPLATES) $(CMSISPKGRTOSRTXLIB) $(CMSISPKGRTOSRTXSRC) $(CMSISPKGRTOSRTXINC)

build :
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for Cortex-M4 with FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m4lsf.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for Cortex-M4 with FPU (Soft ABI) Big Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m4bsf.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for Cortex-M7 with single precision FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7lsfsp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for Cortex-M7 with single precision FPU (Soft ABI) Big Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7bsfsp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for Cortex-M7 with double precision FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7lsfdp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for Cortex-M7 with double precision FPU (Soft ABI) Big Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7bsfdp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for ARMv8-M Mainline with single precision FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLlsfsp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for ARMv8-M Mainline with double precision FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLlsfdp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for ARMv8-M Mainline+DSP with single precision FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLldsfsp.mk build
	@echo   ----------------------------------------------------------------------------
	@echo   "Building DSP Library for ARMv8-M Mainline+DSP with double precision FPU (Soft ABI) Little Endian"
	@echo   ----------------------------------------------------------------------------
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLldsfdp.mk build

clean :
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m4lsf.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m4bsf.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7lsfsp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7bsfsp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7lsfdp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m7bsfdp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLlsfsp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLlsfdp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLldsfsp.mk clean
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_ARMv8MMLldsfdp.mk clean
	$(RM) $(RMFLAGS) $(CMSISPKG)
    
info :
	make -s -C ./DSP_Lib/GCC -f arm_cortexM_math_m4lsf.mk info


