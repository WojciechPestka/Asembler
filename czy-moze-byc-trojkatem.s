.section .text
.globl _start

funkcja:
#sortowanie od największego
        cmp %EBX, %ECX
        jl cmniejsze
        xchg %EBX, %ECX

cmniejsze:
        cmp %ECX, %EDX
        jl dmniejsze
        xchg %ECX, %EDX

dmniejsze:
        cmp %EBX, %ECX
        jl posortowane
        xchg %EBX, %ECX

posortowane:
        add %EDX, %ECX
        cmp %ECX, %EBX
        jg moze
        mov $0, %AL
        jmp koniec

moze:
        mov $1, %AL
        jmp koniec

koniec:
        ret

_start:
        mov $5, %EBX
        mov $7, %ECX
        mov $4, %EDX
        xor %EAX, %EAX
__begin:
        call funkcja
__end: nop