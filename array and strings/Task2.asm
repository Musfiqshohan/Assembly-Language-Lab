segment .data
in: db "%d",0
out: db "%d",10,0

segment .bss
Ar: resq 25
idx: resq 1


segment .text

global main
extern scanf
extern printf

main:
push rbp


mov rcx,5
mov rbx,Ar

InsideLoop:

	mov  rdi, in
	mov rsi, rbx
	mov rax,0
	push rcx
	push rbx
	push rdx
	call scanf
		
	pop rdx
	pop rbx
	pop rcx
	add rbx,8

Loop InsideLoop

mov rdx,0
mov rdi,in
mov rsi,idx
mov rax,0
call scanf

mov rbx,Ar
mov rax,[idx]
imul rax, 8
add rbx ,rax
mov rcx, [rbx]


mov rdi,out
mov rsi,rcx
mov rax,0
call printf



mov rax,0
pop rbp
ret
