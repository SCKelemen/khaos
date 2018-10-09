; print method

print_string:
    pusha           ; move all registers to the stack
    
    mov bx, 10      ;
    add bx, 20      ;

    mov ah, 0x0e    ; invoke BIOS teletype method
    int 0x10        ; print char

    popa            ; restore all registers
    ret             ; return
