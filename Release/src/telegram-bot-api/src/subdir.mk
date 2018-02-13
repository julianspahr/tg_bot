################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/telegram-bot-api/src/api.cpp \
../src/telegram-bot-api/src/api_types.cpp \
../src/telegram-bot-api/src/bot.cpp \
../src/telegram-bot-api/src/encode.cpp \
../src/telegram-bot-api/src/https.cpp \
../src/telegram-bot-api/src/types.cpp 

OBJS += \
./src/telegram-bot-api/src/api.o \
./src/telegram-bot-api/src/api_types.o \
./src/telegram-bot-api/src/bot.o \
./src/telegram-bot-api/src/encode.o \
./src/telegram-bot-api/src/https.o \
./src/telegram-bot-api/src/types.o 

CPP_DEPS += \
./src/telegram-bot-api/src/api.d \
./src/telegram-bot-api/src/api_types.d \
./src/telegram-bot-api/src/bot.d \
./src/telegram-bot-api/src/encode.d \
./src/telegram-bot-api/src/https.d \
./src/telegram-bot-api/src/types.d 


# Each subdirectory must supply rules for building sources it contributes
src/telegram-bot-api/src/%.o: ../src/telegram-bot-api/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ -I"C:\Julian\Projects\D0215432_Hercules\navb_tb\tg_bot\src\telegram-bot-api\include" -I"C:\Julian\Projects\D0215432_Hercules\navb_tb\tg_bot\src\jsoncpp\include" -O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


