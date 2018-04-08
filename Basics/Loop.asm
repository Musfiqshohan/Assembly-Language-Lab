segment .data
in: db "%d",0
out: db "%d",10,0

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

call scanf

xor rax,rax
mov rcx,[a]
mov rdx,0

InsideLoop:
	inc rax
	add rdx,rax
	mov rdi, out
	mov rsi,rax
	push rax
	push rcx
	push rdx
	mov rax,0

	call printf

	pop rdx
	pop rcx
	pop rax
Loop InsideLoop

mov rax,0
mov rdi,out
mov rsi,rdx
call printf

pop rbp
ret

