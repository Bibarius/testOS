PRINT_STRING:
    mov ah , 0x0e
    mov dl, 0x0
    LOOP:
        cmp dl, [bx]
        je ENDSTR
        mov al, [bx]
        int 0x10
        add bx, 0x1
        jmp LOOP

    ENDSTR:
        ret
