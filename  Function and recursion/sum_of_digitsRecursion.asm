;Super digit, Sum of the digits of a number till single digit is found
segment .data
out: db "%d",10,0
out2: db "%d %d",10,0
in: db "%d",0

segment .bss
n: resq 1
sum: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp,rsp

mov rdi,in
mov rsi, n
mov rax,0
call scanf
mov rax,[n]
push rax
mov r9,0
mov [sum],r9


OuterLoop:	
	
	mov rdx,0
	mov r11,rax
	mov r9,10
	div r9
	cmp rax,0
	jz End
	
	mov r9,0
	mov [sum],r9
	mov rax,r11
	push rax
	call SUMDIG
	pop rax
	mov rax,[sum]

jmp OuterLoop	


End:
mov rdi,out
mov rsi,[sum]
mov rax,0
call printf
leave
ret

SUMDIG:
	push rbp
	mov rbp,rsp
	
	mov rax,[rbp+16]
	
	
	
	cmp rax,0
	jz basecase
	
	;push rax
	;mov rdi,out
	;mov rsi,rax
	;mov rax,0
	;call printf
	;pop rax
	

	mov rdx,0
	mov r9,10
	div r9
	add [sum],rdx
	
	push rax
	
	call SUMDIG
	
	
	basecase:
	leave
	ret
	

