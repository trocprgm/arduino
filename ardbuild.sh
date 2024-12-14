#!/bin/bash

AVR_HARDWARE=/usr/share/arduino/hardware
AVR_BIN=/home/adman/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin
GPP_FLAGS="-c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -flto -w -x c++ -E -CC -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_NANO -DARDUINO_ARCH_AVR -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/variants/eightanaloginputs"
GPP2_FLAGS="-c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_NANO -DARDUINO_ARCH_AVR -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/variants/eightanaloginputs"
GCC_FLAGS="-c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_NANO -DARDUINO_ARCH_AVR -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/variants/eightanaloginputs /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/"

/usr/share/arduino/arduino-builder -dump-prefs -logger=machine -hardware ${AVR_HARDWARE} -hardware /home/adman/.arduino15/packages -tools /usr/share/arduino/tools-builder -tools /home/adman/.arduino15/packages -libraries /home/adman/Arduino/libraries -fqbn=arduino:avr:nano:cpu=atmega328 -vid-pid=1A86_7523 -ide-version=10819 -build-path  -warnings=none -build-cache /tmp/arduino_cache_644682 -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.avrdude.path=/home/adman/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17 -prefs=runtime.tools.avrdude-6.3.0-arduino17.path=/home/adman/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17 -prefs=runtime.tools.arduinoOTA.path=/home/adman/.arduino15/packages/arduino/tools/arduinoOTA/1.3.0 -prefs=runtime.tools.arduinoOTA-1.3.0.path=/home/adman/.arduino15/packages/arduino/tools/arduinoOTA/1.3.0 -prefs=runtime.tools.avr-gcc.path=/home/adman/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7 -prefs=runtime.tools.avr-gcc-7.3.0-atmel3.6.1-arduino7.path=/home/adman/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7 -verbose /usr/share/arduino/examples/01.Basics/Blink/Blink.ino
/usr/share/arduino/arduino-builder -compile -logger=machine -hardware ${AVR_HARDWARE} -hardware /home/adman/.arduino15/packages -tools /usr/share/arduino/tools-builder -tools /home/adman/.arduino15/packages -libraries /home/adman/Arduino/libraries -fqbn=arduino:avr:nano:cpu=atmega328 -vid-pid=1A86_7523 -ide-version=10819 -build-path  -warnings=none -build-cache /tmp/arduino_cache_644682 -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.avrdude.path=/home/adman/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17 -prefs=runtime.tools.avrdude-6.3.0-arduino17.path=/home/adman/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17 -prefs=runtime.tools.arduinoOTA.path=/home/adman/.arduino15/packages/arduino/tools/arduinoOTA/1.3.0 -prefs=runtime.tools.arduinoOTA-1.3.0.path=/home/adman/.arduino15/packages/arduino/tools/arduinoOTA/1.3.0 -prefs=runtime.tools.avr-gcc.path=/home/adman/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7 -prefs=runtime.tools.avr-gcc-7.3.0-atmel3.6.1-arduino7.path=/home/adman/.arduino15/packages/arduino/tools/avr-gcc/7.3.0-atmel3.6.1-arduino7 -verbose /usr/share/arduino/examples/01.Basics/Blink/Blink.ino
${AVR_BIN}/avr-g++ ${GPP_FLAGS} sketch/Blink.ino.cpp -o /dev/null
${AVR_BIN}/avr-g++ ${GPP_FLAGS} sketch/Blink.ino.cpp -o preproc/ctags_target_for_gcc_minus_e.cpp
/usr/bin/arduino-ctags -u --language-force=c++ -f - --c++-kinds=svpf --fields=KSTtzns --line-directives preproc/ctags_target_for_gcc_minus_e.cpp
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} sketch/Blink.ino.cpp -o sketch/Blink.ino.cpp.o
${AVR_BIN}/avr-gcc -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_NANO -DARDUINO_ARCH_AVR -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino -I/home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/variants/eightanaloginputs /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/wiring_pulse.S -o core/wiring_pulse.S.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}WInterrupts.c -o core/WInterrupts.c.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}wiring_analog.c -o core/wiring_analog.c.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}wiring_shift.c -o core/wiring_shift.c.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}wiring_pulse.c -o core/wiring_pulse.c.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}wiring.c -o core/wiring.c.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}wiring_digital.c -o core/wiring_digital.c.o
${AVR_BIN}/avr-gcc ${GCC_FLAGS}hooks.c -o core/hooks.c.o

${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/CDC.cpp -o core/CDC.cpp.o

${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/HardwareSerial0.cpp -o core/HardwareSerial0.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/HardwareSerial.cpp -o core/HardwareSerial.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/PluggableUSB.cpp -o core/PluggableUSB.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/HardwareSerial2.cpp -o core/HardwareSerial2.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/HardwareSerial3.cpp -o core/HardwareSerial3.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/IPAddress.cpp -o core/IPAddress.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/HardwareSerial1.cpp -o core/HardwareSerial1.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/Print.cpp -o core/Print.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/Tone.cpp -o core/Tone.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/USBCore.cpp -o core/USBCore.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/Stream.cpp -o core/Stream.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/WMath.cpp -o core/WMath.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/WString.cpp -o core/WString.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/abi.cpp -o core/abi.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/main.cpp -o core/main.cpp.o
${AVR_BIN}/avr-g++ ${GPP2_FLAGS} /home/adman/.arduino15/packages/arduino/hardware/avr/1.8.6/cores/arduino/new.cpp -o core/new.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/wiring_pulse.S.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/WInterrupts.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/hooks.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/wiring.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/wiring_analog.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/wiring_digital.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/wiring_pulse.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/wiring_shift.c.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/CDC.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/HardwareSerial.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/HardwareSerial0.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/HardwareSerial1.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/HardwareSerial2.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/HardwareSerial3.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/IPAddress.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/PluggableUSB.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/Print.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/Stream.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/Tone.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/USBCore.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/WMath.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/WString.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/abi.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/main.cpp.o
${AVR_BIN}/avr-gcc-ar rcs core/core.a core/new.cpp.o
${AVR_BIN}/avr-gcc -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega328p -o /Blink.ino.elf sketch/Blink.ino.cpp.o core/core.a -L -lm
${AVR_BIN}/avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 /Blink.ino.elf /Blink.ino.eep
${AVR_BIN}/avr-objcopy -O ihex -R .eeprom /Blink.ino.elf /Blink.ino.hex
${AVR_BIN}/avr-size -A /Blink.ino.elf
/home/adman/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/bin/avrdude -C/home/adman/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/etc/avrdude.conf -v -patmega328p -carduino -P/dev/ttyUSB0 -b115200 -D -Uflash:w:/Blink.ino.hex:i 

