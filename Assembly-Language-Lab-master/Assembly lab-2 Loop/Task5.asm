segment .data
in: db "%d",0
star1: db "*",0
star2: db "*",10,0
space: db " ",0
nL: db "",10,0


segment .bss
n: resq 1

segment .text

global main
extern scanf
extern printf

main:
push rbp

mov rdi,in
mov rsi,n
mov rax,0
call scanf


mov r15,[n]

mov rcx,[n]



Level1:
	dec rcx;
		
		Loop1:
		push rcx
		mov rdi,space
		mov rax,0
		call printf
		
		pop rcx		
		Loop Loop1
		
	mov rdi,star2
	mov rax,0
	call printf
	
	
	
InterLevel:
	mov rcx,[n]
	sub rcx,2
	
	mov r9,1
	OuterLoop:
		
		
		mov r8,rcx
		push rcx
		push r9	
		
		InnerLoop1:
			push r8
			mov rdi,space
			mov rax,0
			call printf
			
			pop r8			
			dec r8
			jz PrintStar1
		
		jmp InnerLoop1
		
		
		PrintStar1:
			mov rdi,star1
			mov rax,0
			call printf
		
		
		pop r9
		mov r8,r9
		push r9
		
		
		InnerLoop2:
			
			push r8
			mov rdi,space
			mov rax,0
			call printf
		
			pop r8
			dec r8
			jz PrintStar2	
		jmp InnerLoop2
		
		
		PrintStar2:
			mov rdi,star2
			mov rax,0
			call printf
		
		pop r9
		pop rcx
		add r9,2
	Loop OuterLoop



Level3:

	mov rcx,[n]
	shl rcx,1
	dec rcx
	
	StarLoop:
		push rcx
		mov rdi, star1
		mov rax,0
		call printf
		
		pop rcx
	Loop StarLoop
		
	mov rdi,nL
	mov rax,0
	call printf



pop rbp
ret

