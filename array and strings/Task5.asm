segment .data
in: db "%d",0
out: db "%d %d %d %d",10,0

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
add r8,-100
mov r9,0
mov r10,0

mov r11,0
add r11,100
mov r12,0
mov r13,0



mov rbx,Ar
mov rcx,5
Loop2:

	mov rax,[rbx]

	isGreat:
	cmp rax, r8
	jng End
	mov r8, rax
	mov r9, rbx
	mov r10,Ar
	sub r9,r10
	
	
	isSmall:
	cmp rax,r11
	jg End
	mov r11,rax
	mov r12,rbx
	mov r13,Ar
	sub r12,r13
	

	End:
	add rbx,8

Loop Loop2

;mov rcx,r11
;mov r8, r12

mov rdx,0
mov r10,8
mov rax,r9
div r10
mov r9,rax

mov rdx,0
mov rax,r12
div r10
mov r12,rax

mov rdi,out
mov rsi,r8
mov rdx,r9
mov rcx,r11
mov r8, r12

mov rax,0
call printf

pop rbp
ret
