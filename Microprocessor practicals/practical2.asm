; Write an X86/64 ALP to accept a string and to display its length.
section .data
msg1 db 10,13,"Enter a string:"
len1 equ $-msg1
section .bss
str1 resb 200  
result resb 16
section .text
global _start
_start:
mov Rax,1
mov Rdi,1
mov Rsi,msg1
mov Rdx,len1
syscall;
mov rax,0
mov rdi,0
mov rsi,str1
mov rdx,200
syscall;
call display;
mov Rax ,60
mov Rdi,0
syscall;
%macro dispmsg 2
mov Rax,1
mov Rdi,1
mov rsi,%1
mov rdx,%2
syscall;
%endmacro
display:
mov rbx,rax  
mov rdi,result   
mov cx,16   
up1: 
rol rbx,04 
mov al,bl 		
and al,0fh   
cmp al,09h   
jg add_37       
add al,30h                
jmp skip    
add_37: 
add al,37h                 
skip: 
mov [rdi],al 
inc rdi   
dec cx  
jnz up1 
dispmsg result,16 
ret
