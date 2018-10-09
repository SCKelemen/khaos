;
;   Protected_Mode is the primary mode for the kernel (32bits)
;   after protected_mode the bootstrapper will need to swich to
;   extended/enhanced mode to support 64-bit memory addressing
;
bits 16

  Set_Mode_Protected:
    call disable_interrupts
    call load_GDT
    call set_protection_bit
    call init_pe_mode
    ret

  disable_interrupts:
    cli    
    ret

  load_GDT:
    lgdt [gdtr]
    ret

  set_protection_bit:
    mov eax, cr0
    or al, 1
    mov cr0, eax
    ret

  init_pe_mode:
    jmp 08h:PModeMain
    ret

  PModeMain:
  ;
  ret
