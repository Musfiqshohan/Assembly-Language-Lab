segment .data
out: db "%d",10,0
test: db "%d %d",10,0
in: db "%d",0

segment .bss
n: resq 1
ara: resq 100
x: resq 1

segment .text

global main
extern scanf 
extern printf

main:
push rbp
mov rbp,rsp

mov rdi, in
mov rsi, n
mov rax,0
call scanf

mov rcx,[n]
mov rbx, ara
Input:
	
	mov rdi, in
	mov rsi, rbx
	mov rax,0
	push rcx
	push rbx
	call scanf
	
	pop rbx
	pop rcx
	
	add rbx,8
Loop Input


mov rdi,in
mov rsi,x
mov rax,0
call scanf

; n, ara[0] , x

mov r8,0
mov r9,[n]
dec r9

push r8		; low
push r9		; high



call binarySearch

mov rdi,out
mov rsi,r10
mov rax,0
call printf
leave
ret


binarySearch:
	push rbp
	mov rbp,rsp
	
	mov r8, [rbp+24]
	mov r9, [rbp+16]
	
	
	
	cmp r8,r9
	jg BaseCase1
	
	mov rax,r8
	add rax,r9	;low+high
	mov rdx,0
	mov r12,2
	div r12		;rax= mid= (low+high)/2
	
	Equal:
	mov r10,[ara+rax*8]  ;ara[mid]   if(ara[mid]==x)
	mov r11, [x]
	cmp r10,r11
	jz BaseCase2
	
	
	mov r10,[ara+rax*8]
	mov r11,[x]
	cmp r10,r11
	jl Less
	Greater:		;if(ara[mid]>x)
	dec rax
	mov r9,rax
	jmp CallAgain
	
	
	Less:			; if(ara[mid]<x)
	inc rax
	mov r8,rax
	jmp CallAgain
	
	
	
	
	push r8
	push r9
	mov rdi, test
	mov rsi,r8
	mov rdx,r9
	mov rax,0
	call printf
	pop r8
	pop r9
	
	
	CallAgain:
	push r8
	push r9
	call binarySearch		
	
	
	
	BaseCase2:		;found
	mov r10,rax
	leave
	ret
	
	

	BaseCase1:		;low>high
	mov rax,-1
	leave
	ret
	
	





