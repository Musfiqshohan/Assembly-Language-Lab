segment .data
in: db "%d",0
out: db "move %d from %d to %d",10,0
out2: db "%d",10,0


segment .bss
n: resq 1
res: resq 1



segment .text
global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp

mov rdi, in
mov rsi,n
mov rax,0
call scanf

mov rdx,0
mov [res],rdx
mov r8,[n]
mov r9, 1  ;src
mov r10,3   ;dest
mov r11,2	;temp

push r8
push r9
push r10
push r11

mov rax,0
call SolveHanoi

mov rdi,out2
mov rsi,[res]
mov rax,0
call printf

leave
ret


SolveHanoi:
	push rbp
	mov rbp,rsp
	
	mov r8,[rbp+40]	;n
	mov r9,[rbp+32]	;src
	mov r10, [rbp+24]	;dest
	mov r11, [rbp+16]	;temp
	
	cmp r8,0
	jz baseCase
	
	dec r8
	push r8
	push r9
	push r11
	push r10
	
	call SolveHanoi
	
	pop r10
	pop r11
	pop r9
	pop r8
	
	

	push r8
	push r11
	push r10
	push r9
	
	inc r8
	mov rdi,out
	mov rsi,r8
	mov rdx,r9
	mov rcx,r10
	mov rax,0
	call printf
	
	
	
	call SolveHanoi
	
	pop r9
	pop r10
	pop r11
	pop r8
	
	mov rdx,1
	add [res],rdx
	
	leave
	ret


	baseCase:
		leave
		ret



