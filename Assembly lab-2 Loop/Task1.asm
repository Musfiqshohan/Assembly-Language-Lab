segment .data
in: db "%d %d",0
out: db "%d",10,0
test: db "%d %d",10,0


segment .bss
n1: resq 1
n2: resq 1
ara: resq 20


segment .text

global main
extern scanf
extern printf

main:
push rbp
mov rdi,in
mov rsi,n1
mov rdx,n2
mov rax,0
call scanf

mov r8,[n1]
mov r9,[n2]
mov r10,ara  ; a[0]
mov rcx,0

Case1:
mov r15,1
cmp r8,r15
jz Ign1
jmp Case2


Ign1:
inc r8

Case2:
mov r15,2
cmp r8,r15
jz Add2
jmp Loop1


Add2:
mov [r10],r15
Add r10,8
inc r8
inc rcx



Loop1:

	
	mov rbx,2
	
	InsideLoop:
		
		mov rdx,0
		mov rax,r8
		
		idiv rbx
		
		cmp rdx,0
		jz	DoRest
	
		inc rbx
		
		cmp rbx,r8
		jz AddPrime
	
	jmp InsideLoop
	
	AddPrime:
	
	mov [r10],r8
	add r10,8
	inc rcx
	
		
	DoRest:
	cmp r8,r9
	jz NextPart	
	inc r8
	
jmp Loop1


NextPart:
mov rax,0
mov rbx,0
mov r10,ara

LastPart:
	
	test rcx,1
	jz even
	
	add rbx,[r10]
	jmp Last
	
	even:
	add rax,[r10]

	Last:
	add r10,8
	
Loop LastPart

sub rax,rbx
cmp rax,0
jg Print
mov r8,-1
imul r8

Print:
mov rdi ,out
mov rsi, rax
mov rax,0
call printf

pop rbp
ret
