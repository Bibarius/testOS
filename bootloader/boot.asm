[bits 16]
[org 0x7c00]

mov bp, 0x9000 ; Set the stack.
mov sp, bp 

mov bx, MSG_REAL_MODE
call PRINT_STRING

call switch_to_pm

jmp $

%include "print-string.asm"
%include "gdt.asm"
%include "print-string-pm.asm"
%include "switch-to-pm.asm"

;===============================================================================
[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
    jmp $

;=======================================================================================
;  DATA
    MESSAGE: 
        db 'Hello, World!', 0
    HEX_OUT_TEMPLATE:
        db '0x0000', 0  
    ERROR_MSG:
        db 'Here', 0    
    MSG_PROT_MODE: 
        db 'Successfully landed in 32 - bit Protected Mode' , 0
    MSG_REAL_MODE: 
        db 'Started in 16 bit mode', 0
     
    





