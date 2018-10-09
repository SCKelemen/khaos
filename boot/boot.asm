;
;   bootloader
;
loop:           ;
    jmp loop    ;

times 510-($-$$) db 0 ; NOP

dw 0xaa55 ; magic word, must appear at byte 510-512