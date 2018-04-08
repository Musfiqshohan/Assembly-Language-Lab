segment .data
in: db "%d %d",0
out: db "%d",0
out1: db "Palindrome",10,0
out2: db "Not Palindrome",10,0

segment .bss
a: resq 1
b: resq 1


segment .text
global main
extern scanf 
extern printf


main:
push rbp

mov rdi, in
mov rsi, a
mov rdx, b
mov rax,0
call scanf

mov rax, [a]
mov rcx, [b]
mov rsi,0


InsideLoop:
	mov rdx,0
	mov rbx,10
	div rbx
	
	mov rdi,rax
	mov rax,rsi
	
	mul rbx
	add rax,rdx
	mov rsi,rax
	mov rax,rdi

Loop InsideLoop

mov rdi ,out
call printf


pop rbp
ret

