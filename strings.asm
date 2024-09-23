extern memory.storeReg
extern memory.restoreReg

section .data
    bebx dd 0
    becx dd 0
    bedx dd 0
    
    
    

section .text
    global Length
    global index
    global split



;Region Length methods

strings.Length:
    call memory.storeReg
    push ebp
    mov ebp,esp             ;Set the pointer to the base point
    mov ebx,[ebp+8]         ;Get the address of the string
    
    mov ecx,0               ;Initialise counter register

LengthLoop:
    mov al,[ebx+ecx]        ;Read the character
    cmp al,0                ;Check if the current character is the string termination character
    je LengthLoopEnd        ;If current character is termination character then end the loop
    inc ecx                 ;If it isnt the termination character then increment the character
    jmp LengthLoop          ;Go back to the beginning of the loop

LengthLoopEnd:
    mov eax,ecx
    pop ebx
    
    call memory.restoreReg
    
    ret                     ;Remove base pointer from stack

;Endregion










;Region Index Methods
strings.index:
    call memory.storeReg
    push ebp
    mov ebp,esp
    
    mov ebx,[ebp+8]
    mov ecx,[ebp+12]
    
    push ecx
    
    call Length
    
    pop ecx
    
    sub eax,1
    
    cmp eax,ebp
    
    jle IndexNotFound
    jg IndexFound

IndexFound:
    mov al,[ecx+ebx]
    movzx eax,al
    
    call memory.restoreReg
    
    ret

IndexNotFound:
    mov eax,-1
    
    call memory.restoreReg
    
    ret
    
    
;Endregion