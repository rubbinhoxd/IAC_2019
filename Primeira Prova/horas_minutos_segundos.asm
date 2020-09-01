extern    printf                 ; funcao C a ser chamada
extern  scanf                ; funcao C a ser chamada

SECTION .data                 ; secao de dados, variaveis inicializadas

fms db "%lu", 0              ; formato do printf/scanf de 32 bits, '0'
fmt db "%llu", 0             ; formato do printf/scanf de 64 bits, '0'

SECTION .bss
hr       resd 1
min      resd 1
segundos resd 1
SECTION .text                ; secao de codigo
        global main             ; ponto de entrada padrao do GCC
main:
    mov ebp, esp; for correct debugging                         ; etiqueta do programa para o ponto de entrada
        push ebp             ; definindo o ponto de entrada da pilha
        mov  ebp,esp

        push hr            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 12          ; remove parametros

        push min            ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 8         ; remove parametros
        
        push segundos           ; endereco do inteiro sem sinal de 32 bits num1
        push fms             ; argumentos sao empilhados da direita para a esquerda
        call scanf
        add  esp, 4         ; remove parametros
	
	mov esi, 3600 ;quantos seg tem 60 min
	mov edi, 60   ;quantos seg tem 1 min

    mov eax, [hr] ;mov a variavel hr para eax
    mul esi; multiplica a variavel hr por 3600, ou seja, ta transformando hr em seg
    add [segundos], eax ;salva o resultado na variavel segundos
    mov eax, [min]; multplica o numero digitado pelo usuario no caso 'min' para eax
    mul edi ;multiplica o resultado de eax por 60
    add eax, [segundos] ;leva o resultado de hr+seg e joga com os segundos convertidos para eax
        
       

        push eax             ; valor do resultado salvo em eax
        push dword fms         ; endereco da string de controle do printf/scanf
        call printf             ; chamada da funcao C printf
        add  esp, 8             ; desempilha 2 valores de 4 bytes empilhados pela instrução push
        mov  esp, ebp         ; recupera o ponto de entrada da pilha desfazendo a modificação da linha 17
        pop  ebp             ; mesmo que a operacao "leave" desempilha o inicio da pilha, voltando ao mesmo ponto da linha 16
        mov     eax,0             ; valor de retorno normal, retorno sem erro 
        ret
