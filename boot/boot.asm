;
;   bootloader
;
[org 0x7c00]

    mov bx, BL_HEADER           ; print the bootloader header title
    call print_string           ;

    mov bx, BL_HELLO            ; print the hello message
    call print_string           ;

    jmp $                       ; hang

    print_string:
        pusha           ; move all registers to the stack
    
        mov bx, 10      ;
        add bx, 20      ;

        mov ah, 0x0e    ; invoke BIOS teletype method
        int 0x10        ; print char

        popa            ; restore all registers
        ret             ; return


; Data
BL_HEADER:
    db 'KHAOS Bootloader', 0    ; nul terminated string

BL_HELLO:
    db 'Hello, World!', 0       ; nul terminated string

    times 510-($-$$) db 0 ; NOP
    dw 0xaa55 ; magic word, must appear at byte 510-512