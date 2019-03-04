@echo off
gcc -ffreestanding -m32 -c kernel.c -o kernel.o
ld -m i386pe -Ttext 0x1000 -o file.tmp kernel.o
objcopy -O binary file.tmp kernel.bin

PAUSE