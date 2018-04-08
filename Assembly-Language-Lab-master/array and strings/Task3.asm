segment .data
in: db "%d",0
out: db "%d %d",10,0

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

Loop1:

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

Loop Loop1



mov rcx,5
mov rbx,Ar



Loop2:
	
	mov r9,1
	test [rbx],r9
	jnz Exit1	
	
	add rbx,8

Loop Loop2

Exit1:
mov r10,[rbx]
mov rcx,5
mov rax,5
imul rax,8
mov rbx,Ar
add rbx,rax


Loop3:
	mov r9,1
	test [rbx],r9
	jnz Exit2

	sub rbx,8
Loop Loop3

Exit2:
mov rdi,out
mov rsi,r10
mov rdx,[rbx]

call printf


mov rax,0
pop rbp
ret
