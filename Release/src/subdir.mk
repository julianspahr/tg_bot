################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/tg_bot.cpp 

OBJS += \
./src/tg_bot.o 

CPP_DEPS += \
./src/tg_bot.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ -I"C:\Julian\Projects\D0215432_Hercules\navb_tb\tg_bot\src\telegram-bot-api\include" -I"C:\Julian\Projects\D0215432_Hercules\navb_tb\tg_bot\src\jsoncpp\include" -O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


