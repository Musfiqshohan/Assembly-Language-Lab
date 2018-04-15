segment .data
ins: db "%s",0
out1: db "Palindrome",10,0
out2: db "Not Palindrome",10,0
out: db "%d",10,0
test: db "%c %c",10,0
base: db "I am here",10,0

segment .bss
str: resb 20
lc: resb 1
rc: resb 1
L: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rbp, rsp

mov rdi,ins
mov rsi, str
mov rax,0
call scanf

mov rbx,0
Length:
	
	mov rdx, [str+rbx]
	cmp rdx,0
	jz Exit1
	
	add rbx,1
jmp Length


Exit1:
mov [L], rbx
mov rdi,out
mov rsi,[L]
mov rax,0
call printf


mov r8,0
mov r9,[L]
dec r9
push r8
push r9
mov rax,0
call checkPalindrome

cmp rax,1
je isPal

notPal:
mov rdi,out2
mov rax,0
call printf
leave 
ret

isPal:
mov rdi, out1
mov rax,0
call printf
leave
ret


checkPalindrome:
	push rbp
	mov rbp,rsp
	
	
	mov r8, [rbp+24]
	mov r9, [rbp+16]
	
	cmp r8,r9
	jge baseCase1
	
	mov bl, [str+r8]
	mov cl, [str+r9]
	
	
	
	cmp bl,cl
	jne baseCase2
	
	
	
	inc r8
	dec r9
	
	push r8
	push r9
	
	call checkPalindrome
	leave
	ret


	baseCase1:
	
		mov rax,1
		leave
		ret

	baseCase2:
		
		mov rax,-1
		leave
		ret


















