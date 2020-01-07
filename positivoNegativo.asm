%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    
    mov ebx,0
    ; pega valor no eax
    GET_DEC 2,eax
    
    ; se for 0, já termina
    cmp eax, ebx
    je ZERO
    
    mov ebx,0
    
    and ax,00H
    ; se for positivo, então = 0    
    cmp eax, ebx
    je POS
    
    PRINT_STRING 'não '
POS:
    PRINT_STRING 'é positivo'  
    
    xor eax, eax
    ret
    
ZERO:
    PRINT_STRING 'é zero'
    
    xor eax, eax
    ret