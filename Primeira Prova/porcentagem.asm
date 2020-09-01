extern    printf                 ; funcao C a ser chamada
extern  scanf                ; funcao C a ser chamada

SECTION .data                 ; secao de dados, variaveis inicializadas

fms db "%lu", 0              ; formato do printf/scanf de 32 bits, '0'
fmt db "%llu", 0             ; formato do printf/scanf de 64 bits, '0'

SECTION .bss
vendedor resd 5 ;1º vendedor
comissao resd 5
SECTION .text                ; secao de codigo
        global main             ; ponto de entrada padrao do GCC
main:                         ; etiqueta do programa para o ponto de entrada
        push ebp             ; definindo o ponto de entrada da pilha
        mov  ebp,esp
        
        mov esi, vendedor ;endereçamento
        mov edi, comissao ;endereçamento 
    
        
        push esi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros

        push edi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        add esi, 4
        add edi, 4
        
        
        push esi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros

        push edi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        add esi, 4
        add edi, 4
        
        
        push esi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros

        push edi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        add esi, 4
        add edi, 4
        
        
        push esi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros

        push edi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        add esi, 4
        add edi, 4
        
        
        push esi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros

        push edi            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4          ; remove parametros
        
        
        mov esi, 0  ;i=0
        mov ecx, 5 ;qntas vezes vai rodar o loop
        for:
            mov eax, [vendedor+esi] ;vendedor[i]
            mov edi, [comissao+esi] ;comissao[i]
            mul edi ;vendendor[i]*comissao[i]
            add ebx, eax ;aux+= vendendor[i]*comissao[i]
            add esi, 4 ; i++
        loop for
        
        mov eax, ebx ;para multiplicaçao
        mov ebx, 100 ; para divisao
        div ebx ;resutado do for / 100
        
        


        push eax             ; valor do resultado salvo em eax
        push dword fms         ; endereco da string de controle do printf/scanf
        call printf             ; chamada da funcao C printf
        add  esp, 8             ; desempilha 2 valores de 4 bytes empilhados pela instrução push
        mov  esp, ebp         ; recupera o ponto de entrada da pilha desfazendo a modificação da linha 17
        pop  ebp             ; mesmo que a operacao "leave" desempilha o inicio da pilha, voltando ao mesmo ponto da linha 16
        mov     eax,0             ; valor de retorno normal, retorno sem erro 
        ret
