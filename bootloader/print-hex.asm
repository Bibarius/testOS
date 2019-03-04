PRINT_HEX:
    mov cx, dx
    and cx, 0xf000
    shr cx, 12
    call comparision
    mov [HEX_OUT_TEMPLATE + 2], cx

    mov cx, dx
    and cx, 0x0f00
    shr cx, 8
    call comparision
    mov [HEX_OUT_TEMPLATE + 3], cx

    mov cx, dx
    and cx, 0x00f0
    shr cx, 4
    call comparision
    mov [HEX_OUT_TEMPLATE + 4], cx

    mov cx, dx
    and cx, 0x000f
    call comparision
    mov [HEX_OUT_TEMPLATE + 5], cx

    mov bx, HEX_OUT_TEMPLATE
    call PRINT_STRING
    ret

    comparision:
        cmp cx, 9
        jle digit 
        jg  letter
        digit:
            add cx, 0x30
            jmp endcmp
        letter:
            add cx, 0x37
            jmp endcmp
        endcmp:
            ret


