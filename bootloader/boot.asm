[bits 16]
[org 0x7c00]

KERNEL_OFFSET equ 0x1000 
mov [BOOT_DRIVE], dl


mov bp, 0x9000 ; Set the stack.
mov sp, bp 

mov bx, MSG_REAL_MODE
call PRINT_STRING

call load_kernel

call switch_to_pm

jmp $

%include "print-string.asm"
%include "disk-load.asm"
%include "gdt.asm"
%include "print-string-pm.asm"
%include "switch-to-pm.asm"

[bits 16]

load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call PRINT_STRING

    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call DISK_LOAD

    ret

;===============================================================================
[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
    call KERNEL_OFFSET

    jmp $

;=======================================================================================
;  DATA
    MESSAGE: 
        db 'Hello, World!', 0
    HEX_OUT_TEMPLATE:
        db '0x0000', 0  
    DISK_ERROR_MSG:
        db 'Error reading disk', 0    
    MSG_PROT_MODE: 
        db 'Successfully landed in 32 - bit Protected Mode' , 0
    MSG_REAL_MODE: 
        db 'Started in 16 bit mode', 0
    BOOT_DRIVE:
        db 0
    MSG_LOAD_KERNEL:
        db 'Loading kernel into memory.' , 0
     
;PADDING========

times 510 - ($ - $$) db 0
dw 0xaa55



