################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/jsoncpp/src/lib_json/json_reader.cpp \
../src/jsoncpp/src/lib_json/json_value.cpp \
../src/jsoncpp/src/lib_json/json_writer.cpp 

OBJS += \
./src/jsoncpp/src/lib_json/json_reader.o \
./src/jsoncpp/src/lib_json/json_value.o \
./src/jsoncpp/src/lib_json/json_writer.o 

CPP_DEPS += \
./src/jsoncpp/src/lib_json/json_reader.d \
./src/jsoncpp/src/lib_json/json_value.d \
./src/jsoncpp/src/lib_json/json_writer.d 


# Each subdirectory must supply rules for building sources it contributes
src/jsoncpp/src/lib_json/%.o: ../src/jsoncpp/src/lib_json/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ -I"C:\Julian\Projects\D0215432_Hercules\navb_tb\tg_bot\src\telegram-bot-api\include" -I"C:\Julian\Projects\D0215432_Hercules\navb_tb\tg_bot\src\jsoncpp\include" -O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


