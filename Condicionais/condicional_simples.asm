%include "io.inc"

section .data
str1 db "MAIOR",0
str2 db "MENOR",0
str3 db "IGUAL",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov eax, 3
    mov ebx, 5
    cmp eax, ebx    ;sub eax, ebx
    JZ PRINT_IGUAL
    JC PRINT_MENOR
    jmp PRINT_MAIOR
    
EXIT:
    xor eax, eax
    ret
    
    
    
PRINT_MAIOR: 
    PRINT_STRING str1
    jmp EXIT
    
PRINT_MENOR: 
    PRINT_STRING str2
    jmp EXIT
    
PRINT_IGUAL: 
    PRINT_STRING str3
    jmp EXIT
