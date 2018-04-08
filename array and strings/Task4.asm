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



mov r8,0
mov r9,0
mov r10,0

mov rbx,Ar
mov rcx,5
Loop2:

	mov rax,[rbx]
	cmp rax, r8

	jng Comp2
	mov r10,r9
	mov r9,r8
	mov r8, rax
	jmp End

	Comp2:
	cmp rax,r9
	jng Comp3
	mov r10,r9
	mov r9,rax
	jmp End 
	
	Comp3:
	cmp rax,r10
	jng End
	mov r10,rax

	End:
	add rbx,8

Loop Loop2


mov rdi,out
mov rsi,r10


mov rax,0
call printf

pop rbp
ret
