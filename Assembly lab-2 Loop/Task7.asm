;count vowels const
segment .data
in: db "%d %s",0
out: db "%s",0
test: db "%c",10,0
outres: db "Vowels: %d Consonants:%d",10,0

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


mov r8,str
mov rcx,[len]

mov r9,0
mov r10,0


Check:
	
	mov al, [r8]
	
	cmp al, 'A'
	je VowCnt
	cmp al, 'E'
	je VowCnt
	cmp al, 'I'
	je VowCnt
	cmp al, 'O'
	je VowCnt
	cmp al, 'U'
	je VowCnt
	
	jmp ConsCnt
	
	
	VowCnt:
	inc r9
	jmp Last
	
	
	ConsCnt:
	inc r10
	
	
	Last:
	
	add r8,1
Loop Check


mov rdi,outres
mov rsi,r9
mov rdx,r10

mov rax,0

call printf


mov rax,0
pop rbp
ret


