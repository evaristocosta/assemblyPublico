%include "io.inc"

section .data
    i dd 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp

    mov edx,0 ;resto
    mov eax,0 ;entrada
    mov ebx,4 ;divisor

    GET_DEC 2,[i]
    
    mov eax,[i] ;salva a entrada
    
    ; mod 4
    div ebx    
    mov ebx,0
    
    ; se entrada % 4 == 0, continua. Se não, erro
    cmp ebx,edx 
    jne ERROR

    mov edx,0
    mov eax,0
    mov ebx,100
    
    mov eax,[i]
    
    ; mod 100
    div ebx
    mov ebx,0
    
    ; se não der 0, é porque ano não termina em 00
    ; então sucesso
    cmp ebx,edx
    jne DONE
    
    mov edx,0
    mov eax,0
    mov ebx,400
    
    mov eax,[i]
    
    ; mod 400
    div ebx
    mov ebx,0
    
    cmp ebx,edx
    je DONE
    
    
ERROR:
    PRINT_STRING 'não '
   
DONE:
    PRINT_STRING 'é bissexto'
    xor eax, eax
    ret