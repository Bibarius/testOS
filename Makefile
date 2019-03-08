C_SOURSES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

OBJ = ${C_SOURSES:.c=.o}

VPATH = bootloader/ : kernel/








all: my.img

run: all
	bochs 

my.img: boot.bin kernel.bin
	cat $^ > my.img

#	Build the kernel binary
kernel.bin : kernel-entry.o kernel.o
	ld -m elf_i386 -o kernel.bin -Ttext 0x1000 kernel-entry.o kernel.o --oformat binary

#	Build the kernel object file 
kernel.o : kernel.c
	gcc -m32 -ffreestanding -c kernel.c -o kernel.o

#	Build the kernel entry object file 
kernel-entry.o : kernel-entry.asm
	nasm kernel-entry.asm -f elf32 -o kernel-entry.o


#	Assemble the boot sector of the raw binary
boot.bin: boot.asm
	nasm $< -f bin -I 'bootloader/' -o $@

clean:
	rm -fr *.bin *.dis *.o my.img *.map

kernel.dis: kernel.bin 
	ndisasm -b 32 $< > $@