@echo off
nasm -f bin -o test boot.asm
dd if=test of=my.img

copy "my.img" C:\Users\User\Desktop

PAUSE