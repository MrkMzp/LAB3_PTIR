	# Makefile for programming AVR in Geany 
	FILENAME   = main
	DEVICE     = atmega328p
	PROGRAMMER = arduino
	BAUD       = 115200
	COMPILE    = "F:\AVRToolchain\avr8-gnu-toolchain-win32_x86_64\bin\avr-gcc.exe" -Wall -Os -mmcu=$(DEVICE)
	REMOVE = C:\MinGW\msys\1.0\bin\rm.exe
	PORT = 

default: compile clean 

compile:
	$(COMPILE) -c $(FILENAME).c -o $(FILENAME).o
	$(COMPILE) -o $(FILENAME).elf $(FILENAME).o
	"F:\AVRToolchain\avr8-gnu-toolchain-win32_x86_64\bin\avr-objcopy.exe" -j .text -j .data -O ihex $(FILENAME).elf $(FILENAME).hex 
	"F:\AVRToolchain\avr8-gnu-toolchain-win32_x86_64\bin\avr-size.exe" --format=avr --mcu=$(DEVICE) $(FILENAME).elf

flash:
	#TODO add the path to AVR Dude # avrdude -v -p $(DEVICE) -c $(PROGRAMMER) -P $(PORT) -b $(BAUD) -U flash:w:$(FILENAME).hex:i
	
clean :
	$(REMOVE) $(FILENAME).o
	$(REMOVE) $(FILENAME).elf
	$(REMOVE) $(FILENAME).hex
