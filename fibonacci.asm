%include "io.inc"
section .data
    a dw 0
    b dw 0
    auxiliar dw 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    
    ; criterio de parada
    mov edx,0
    
    mov DWORD[a],0
    mov ebx,1
    
    ; pega valor de n
    GET_DEC 2,eax
    
FOR:
    mov ecx,ebx
    add ebx,DWORD[a]
    mov DWORD[auxiliar],ebx
    mov DWORD[a],ecx
    mov ebx,DWORD[auxiliar]
    
    PRINT_DEC 4,[auxiliar]
    NEWLINE
    
    ; repete n vezes
    dec eax
    jnz FOR
    
    xor eax, eax
    ret