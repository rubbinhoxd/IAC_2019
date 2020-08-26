%include "io.inc"


section .data
vendedor dd 10, 20, 30, 40, 50
percentual dd 10, 15, 20, 20, 10


section .text
global CMAIN
CMAIN:
    
    mov esi, 0; i=0
    mov ecx, 5 ;loop que vai até 5   
    mov ebx, 0    
    for:
        mov eax, [vendedor+esi] ;vendedor[i]                      
        mov edi, [percentual+esi];percentual[i]
        mul edi ;clientes[i]*percentual[i]
        add ebx, eax        
        add esi, 4 ;i++
        
        loop for
    
        mov eax, ebx
        mov ecx, 100
        div ecx
        
        PRINT_DEC 4, eax
                                                                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    xor eax, eax
    ret
