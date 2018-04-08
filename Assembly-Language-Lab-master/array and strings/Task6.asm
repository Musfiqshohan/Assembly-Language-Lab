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



mov r10,5
OuterLoop:
	
	mov rcx,4
	mov rbx,Ar
	

	InnerLoop:

	mov r12,rbx
	
	mov rax,[r12]
	add r12,8
	mov rdx,[r12]
	cmp rax,rdx
	jng End1

	mov r8,rax
	mov rax,rdx
	mov rdx,r8
	mov [rbx], rax
	add rbx,8
	mov [rbx], rdx
	jmp End2

	End1:
	add rbx,8

	End2:
	Loop InnerLoop

	dec r10
	jz Print

Loop OuterLoop

Print:
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


pop rbp
ret
