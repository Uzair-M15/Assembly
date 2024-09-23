extern memory.storeReg
extern memory.restoreReg

section .data
    bebx db 0
    becx db 0
    bedx db 0

section .text
    global exp

math.exp:
    mov eax,0
    
    call memory.storeReg
    push ebp
    mov ebp,esp
    
    mov ebx,[ebp+8]         ;exponent
    mov ecx,[ebp+12]        ;integer
    mov eax,ecx
    
ExpLoop:
    imul eax,ecx
    cmp ebx,2
    je ExpLoopEnd
    dec ebx
    jmp ExpLoop

ExpLoopEnd:
    pop edx

    call memory.restoreReg

    ret