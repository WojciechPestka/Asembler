.section .data
.section .text
.globl _start

funkcja:
        xor %EAX, %EAX
        xor %ECX, %ECX
petla:
        inc %ECX
        cmp %EDI, %ECX
        jge koniec
        mov %EDI, %EAX
        xor %EDX, %EDX
        div %ECX
        test %EDX, %EDX
        jnz petla
        add %ECX, %ESI
        jmp petla
koniec:
        ret

_start:
        mov $28, %EDI
__begin:
        call funkcja
#Jesli jest doskonala w AEX jest 1
        xor %EAX, %EAX
        cmp %EDI, %ESI
        jne nie
        inc %EAX
nie:
__end: nop