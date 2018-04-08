       length equ $ - string

        msg1 db "is pallindrome",0
        msg2 db "is not pallindrome",0

        section .text
        global main
        extern puts

main:
        mov ebx, string                   ; start of word                                 
        mov eax, (string + length - 1)    ; end of word                                   

        mov ecx, (length / 2)             ; check will run for half of the word           
check:
        mov dl, [ebx]                     ; compare first and last letters                
        cmp [eax], dl
        jne failure
        inc ebx
        dec eax
        loop check

        ;; success                                                                  
        push msg1
        call puts
        add esp,4
        jmp done

failure:
        push msg2
        call puts
        add esp,4

done:
        ret

