@echo off
gcc -ffreestanding -m32 -c basic.c -o basic.o
ld -m i386pe -o file.tmp basic.o
objcopy -O binary file.tmp file.bin