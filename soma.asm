%include "io.inc"

section .data

    arrayW DW 1000h,2000h,3000h


section .text
global CMAIN
CMAIN:
    

    mov esi, 0

    mov ax,[arrayW + esi]             ; AX = 1000h

    add esi, 2

    add ax,[arrayW + esi]             ; AX = 3000h
    
    PRINT_HEX 2, [arrayW + 4]   
    
    xor eax, eax
    ret
