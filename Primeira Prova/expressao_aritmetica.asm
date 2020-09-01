extern printf
extern scanf

section .data
fms db "%lu", 0

section .bss
num1 resd 1
num2 resd 1
num3 resd 1

;(num1*num3)/num2 + 1  (formula simplificada da expressao)

section .text
    global main
main:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    push num1
    push fms
    call scanf
    add esp, 4
    
    push num2
    push fms
    call scanf
    add esp, 4
    push num3
    push fms
    call scanf
    add esp, 4
    ;-------------------------------
    ;LÓGICA
    ;-------------------------------
    mov edx, 0 ;zerando edx para nao pegar lixo
    mov eax, [num1] ;movendo num1 para eax
    mov ebx, [num3] ;movendo num3 para ebx
    mul ebx ;multiplicando ebx por eax
    
    mov ecx, [num2]    
    
    div dword ecx ;divide eax por ecx, mas pega os 32bits apenas
    
    add eax, 1 ;soma 1 com base na formula

    push eax
    push dword fms
    call printf
    add esp, 8

    mov esp, ebp
    pop ebp

    xor eax, eax
    ret
