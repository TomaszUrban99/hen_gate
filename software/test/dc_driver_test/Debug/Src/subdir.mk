################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/button_brake.c \
../Src/button_run.c \
../Src/clock.c \
../Src/control_pin.c \
../Src/main.c \
../Src/motor.c \
../Src/pwm.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32f4xx.c \
../Src/timer.c 

OBJS += \
./Src/button_brake.o \
./Src/button_run.o \
./Src/clock.o \
./Src/control_pin.o \
./Src/main.o \
./Src/motor.o \
./Src/pwm.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32f4xx.o \
./Src/timer.o 

C_DEPS += \
./Src/button_brake.d \
./Src/button_run.d \
./Src/clock.d \
./Src/control_pin.d \
./Src/main.d \
./Src/motor.d \
./Src/pwm.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32f4xx.d \
./Src/timer.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F407G_DISC1 -DSTM32F4 -DSTM32F407VGTx -c -I../Inc -I"/home/tomasz/Documents/Projekty/Brama/Plytki/hen_gate/software/test/dc_driver_test/CMSIS/Device/ST/STM32F4xx/Include" -I"/home/tomasz/Documents/Projekty/Brama/Plytki/hen_gate/software/test/dc_driver_test/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/button_brake.cyclo ./Src/button_brake.d ./Src/button_brake.o ./Src/button_brake.su ./Src/button_run.cyclo ./Src/button_run.d ./Src/button_run.o ./Src/button_run.su ./Src/clock.cyclo ./Src/clock.d ./Src/clock.o ./Src/clock.su ./Src/control_pin.cyclo ./Src/control_pin.d ./Src/control_pin.o ./Src/control_pin.su ./Src/main.cyclo ./Src/main.d ./Src/main.o ./Src/main.su ./Src/motor.cyclo ./Src/motor.d ./Src/motor.o ./Src/motor.su ./Src/pwm.cyclo ./Src/pwm.d ./Src/pwm.o ./Src/pwm.su ./Src/syscalls.cyclo ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.cyclo ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su ./Src/system_stm32f4xx.cyclo ./Src/system_stm32f4xx.d ./Src/system_stm32f4xx.o ./Src/system_stm32f4xx.su ./Src/timer.cyclo ./Src/timer.d ./Src/timer.o ./Src/timer.su

.PHONY: clean-Src

