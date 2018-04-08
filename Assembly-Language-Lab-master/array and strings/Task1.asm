segment .data
in: db "%d",0
out: db "%d",10,0

segment .bss
Ar: resq 25


segment .text

global main
extern scanf
extern printf

main:
push rbp


mov rcx,5
mov rbx,Ar
mov rdx,0
InsideLoop:

	mov  rdi, in
	mov rsi, rbx
	mov rax,0
	push rcx
	push rbx
	push rdx
	call scanf
	
	mov rdi, out
	mov rsi, [rbx]
	pop rdx
	add rdx, [rbx]
	push rdx
	mov rax,0
	call printf
		
	pop rdx
	pop rbx
	pop rcx
	add rbx,8

Loop InsideLoop

mov rdi,out
mov rsi,rdx
mov rax,0
call printf

mov rcx,5
mov rbx,Ar
InsideLoop2:
	
	push rcx
	push rbx	
	
	mov rdi,out
	mov rsi, [rbx]
	mov rax,0
	call printf
		
	pop rbx
	pop rcx
	add rbx,8
Loop InsideLoop2



mov rax,0
pop rbp
ret
