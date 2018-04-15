segment .data
in: db "%d",0
out: db "%d",10,0

segment .bss
n: resq 1
ara: resq 100

segment .text
global main
extern printf
extern scanf

main:

push rbp
mov rbp, rsp

mov rdi,in
mov rsi,n
mov rax,0
call scanf

mov rcx,[n]
mov rbx, ara

Input:
	
	push rcx
	push rbx
	mov rdi, in
	mov rsi, rbx
	mov rax,0
	call scanf
	
	pop rbx
	pop rcx
	
	add rbx,8

Loop Input



mov r8,0
mov r9, [n]
dec r9

push r8
push r9
mov r10,0

call ArraySum

mov rdi,out
mov rsi,r10
mov rax,0
call printf

leave 
ret


ArraySum:

	push rbp
	mov rbp,rsp
	
	mov r8, [rbp+24]
	mov r9, [rbp+16]
	
	
	cmp r8,r9
	jz BaseCase
	
	mov rax,r8
	add rax,r9
	
	mov rdx,0
	mov r12,2
	div r12
	
	;push rax
	;push r9
	mov r9,rax
	
	push r8
	push r9
	
	call ArraySum
	
	
	
	mov r8, [rbp+24]
	mov r9, [rbp+16]
	
	
	mov rax,r8
	add rax,r9
	
	mov rdx,0
	mov r12,2
	div r12
	
	mov r8,rax
	inc r8
	push r8
	push r9
	
	call ArraySum
	
	leave
	ret
	
	
	
	BaseCase:
		add r10, [ara+r8*8]
		leave
		ret

