DISK_LOAD:
    ;   load DH sectors to ES:BX from drive DL
    
    push dx
    mov ah, 0x02    ;   BIOS read sector function
    mov al, dh      ;   red DH sectors
    mov ch, 0x00    ;   select cylinder 0
    mov dh, 0x00    ;   select head 0
    mov cl, 0x02    ;   start reading from second sector (after the boot sector) 

    int 0x13        ;   BIOS interrupt

    jc disk_error

    pop dx
    cmp dh, al
    jne disk_error
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call PRINT_STRING
    jmp $