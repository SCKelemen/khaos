;
;   bootloader
;

mov ah, 0x0e    ; int 10/ah = 0eh -> invoke BIOS Teletype

mov al, 'H'     ; load char 'H' into the buffer
int 0x10        ; invoke draw

mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

mov al, 'l'
int 0x10

mov al, 'o'
int 0x10

jmp $

times 510-($-$$) db 0 ; NOP

dw 0xaa55 ; magic word, must appear at byte 510-512