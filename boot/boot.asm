;
;   bootloader
;
 org 0x7C00
 bits 16
 
   mov ax, 0  ; set up segments
   mov ds, ax
   mov es, ax
   mov ss, ax     ; setup stack
   mov sp, 0x7C00 ; stack grows downwards from 0x7C00
 
   mov si, BL_HEADER
   call print_string
 
 mainloop:
   mov si, prompt
   call print_string
 
   mov di, buffer
   call get_string
 
   mov si, buffer
   cmp byte [si], 0  ; is this line blank?
   je mainloop       ; yes, ignore it
 
   mov si, buffer
   mov di, BL_CMD_HELLO  ; "hello" command
   call strcmp
   jc .helloworld
 
   mov si, buffer
   mov di, BL_CMD_HELP  ; "help" command
   call strcmp
   jc .help
 
   mov si,  BL_INV_CMD
   call print_string 
   jmp mainloop  
 
 .helloworld:
   mov si, BL_HELLO
   call print_string
 
   jmp mainloop
 
 .help:
   mov si, BL_HELP
   call print_string
 
   jmp mainloop
 
 ; Data
 BL_HEADER db 'KHAOS Bootloader', 0x0D, 0x0A, 0
 BL_HELLO db 'Hello, World!', 0x0D, 0x0A, 0
 BL_INV_CMD db 'invalid command.', 0x0D, 0x0A, 0
 prompt db '>', 0
 BL_CMD_HELLO db 'hello', 0
 BL_CMD_HELP db 'help', 0
 BL_HELP db 'Bootloader commands: hello, help', 0x0D, 0x0A, 0
 buffer times 64 db 0
 
%include "bios.asm"
 

   times 510-($-$$) db 0 ; fill with nop
   dw 0AA55h ; magic at byte 510 - 512
