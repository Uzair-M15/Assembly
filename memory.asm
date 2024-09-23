section .data
    bebx dd 0
    becx dd 0
    bedx dd 0


section .bss
    global pile resb 1024
    pile_pointer resq 1


section .text
    global memory.restoreReg
    global memory.storeReg
    global memory.drop
    global _start


_start:
    lea eax,[pile]
    mov [pile_pointer],eax
    

memory.restoreReg:
    mov ebx,[bebx]
    mov ecx,[becx]
    mov edx,[bedx]
    ret

memory.storeReg:
    mov [bebx],ebx          ;Store initial register value
    mov [becx],ecx
    mov [bedx],edx
    ret







;Region heap methods

;drops into the pile
memory.drop:
    call memory.storeReg
    
    mov ecx,[pile_pointer]                  ;Find the end of the pile
    mov [ecx],eax                           ;
    lea eax,[ecx]
    
    inc ebx
    
    call memory.restoreReg
    
memory.pick:
    
    

