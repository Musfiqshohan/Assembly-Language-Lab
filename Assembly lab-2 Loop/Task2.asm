;Palindrome checking
segment .data
in: db "%d %s",0
out: db "%s",0
test: db "%c %c",10,0
out1: db "Palindrome",10,0
out2: db "Not Palindrome",10,0
segment .bss
len: resq 1
str: resb 20

segment .text

global main
extern scanf
extern printf

main:
push rbp

mov  rdi, in
mov rsi, len
mov rdx, str
mov rax,0
call scanf





mov r8,str			; str[0]
mov rax,[len]
mov rcx,rax

mov r9,r8
add r9,rax
sub r9,1		 ; str[n-1]


Loop1:
	mov al,[r8]    ;str[i]
	mov bl,[r9]		;str[j]
	
	mov dl, 'a'		;if lower case then make it upper
	
	check1:
	cmp al, dl
	jl check2
	
	up1:
	sub al,20h
	;jmp Compare
	
	
	check2:
	cmp bl,dl
	jl Compare	
	
	up2:
	sub bl,20h
	

	Compare:	
	cmp al,bl
	jne  Exit1		;not equal
	
	
	add r8,1
	sub r9,1
	
	
Loop Loop1


mov rsi,out1
jmp Print

Exit1:
mov rsi, out2

Print:
mov rdi, out
mov rax,0
call printf



mov rax,0
pop rbp
ret


