%include "io.inc"
section .data
    aux dd 0
    i dd 0
    j dd 0
    num times 7 dd 7,5,2,1,1,3,4

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    FOR1:      
        mov DWORD[j],6                      ; j = 6
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
        cmp DWORD[i],6
        jne FOR1
        
     
    ; print do vetor    
    mov ecx,7
    mov eax,0    
    FOR:
        PRINT_DEC 2,[num+eax*4]
        inc eax
        loop FOR
    
    xor eax, eax
    ret