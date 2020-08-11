
;Voce pode declarar labels inicializadas, nao inicializadas e constantes
section .data
    minhastring           db      "Ola, inverta esta string!", 10
    sizeOfSource equ $-minhastring

section .bss
target RESB sizeOfSource

section .text ; não altere essa linha
global _start; não altere essa linha
_start:; não altere essa linha

;Insira seu codigo abaixo:          ;PARTE IMPORTANTE DO CÓDIGO (LINHA 16 ATÉ 25)
    
mov edi, 0
mov esi, sizeOfSource-2
mov ecx, sizeOfSource-1

loop1:
        mov al, [minhastring+edi] ; salvado posicao atual de edi da minhaString
        mov [target+esi], al      ; salvado al na posicao atual de esi
        inc edi                   ; incrementando edi 
        dec esi                   ; decrementando esi 
        loop loop1                ; fim do loop
    
    
    
    
    
    
    
;Dica:
mov BYTE[target+sizeOfSource-1], 10; essa linha é necessária para que a correção automática funcione

;Não altere o código daqui para baixo


                                mov     eax, 4
                                mov     ebx, 1
                                mov     ecx, target
                                mov     edx, sizeOfSource
                                int     0x80


                                mov     ebx, 0
                                mov     eax, 1
                                int     0x80
                                
                                
                                
                                
    
    
