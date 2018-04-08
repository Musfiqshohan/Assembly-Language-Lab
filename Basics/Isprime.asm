segment .data
in: db "%d",0
out: db "%s",10,0
out1: db "Prime",10,0
out2: db "NotPrime",10,0

segment .bss
a: resq 1


segment .text
global main
extern scanf 
extern printf


main:
push rbp

mov rdi, in
mov rsi, a
mov rax,0
call scanf



mov rdx,0
mov rax,[a]
mov rbx,2
div rbx
mov rcx,rax
mov rax,[a]

mov rbx,1
mov rsi ,out2



InsideLoop:
	mov rax,[a]
	mov rdx,0
	inc rbx
	div rbx
	cmp rdx,0
	jz exit	

Loop InsideLoop

mov rsi,out1

exit:
mov rdi, out
mov rax,0
call printf

pop rbp
ret

