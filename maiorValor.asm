%include "io.inc"
section .data
    aux dd 0
    i dd 0
    j dd 0
    num times 20 dd 7,521,2,8,1,86,4,12,3,4,8,9,31,42,1,2,3,99,4,3

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; bubblesort coloca maior valor no final do vetor
    FOR1:      
        mov DWORD[j],19                     ; j = 19
        FOR2:             
            mov ecx,DWORD[j]                ; ecx = j
            mov eax,DWORD[num+(ecx-1)*4]    ;eax = num[j-1]
            mov edx,DWORD[num+ecx*4]        ;edx = num[j]
                      
            cmp eax,edx                     ; if(eax <= edx)
            jle PASSOU                      ; "break";
                   
            mov ecx,DWORD[j]
            mov eax,DWORD[num+(ecx-1)*4]    ; eax = num[j-1]
            mov edx,DWORD[num+ecx*4]        ; edx = num[j]
            
          
            mov DWORD[aux],eax              ; aux = eax  PROBLEMAS AQUI: mexer em aux mexe em i          
            mov eax,edx                     ; eax = edx
            mov edx,DWORD[aux]              ; edx = aux

            
            mov DWORD[num+(ecx-1)*4],eax    ; num[j-1] = eax(edx,num[j])
            mov DWORD[num+ecx*4],edx        ; num[j] = edx(aux)
 
            PASSOU:            
            mov ebx,DWORD[i]                ; ebx = i
            add ebx,1
            sub DWORD[j],1
            
            cmp DWORD[j],ebx
            jge FOR2
    
        add DWORD[i],1
        cmp DWORD[i],19
        jne FOR1
        
 
    ; print do maior valor
    PRINT_DEC 2,[num+19*4]
    
    xor eax, eax
    ret