.section .data
tab:
        .long 1, 2, -3, 3, 0, -5, -7, 7,
end_tab:
rozmiar = (. - tab) / 4
.section .text
.globl _start

funkcja:
        push %EBP
        mov %ESP, %EBP

        push %EAX
        movl 8(%EBP), %EAX
        push %EBX
        movl 12(%EBP), %EBX
petla:
        cmp $0, %EAX
        jle koniec
        cmp $0, (%EBX)
        je koniec
        add $4, %EBX
        dec %EAX
        add (%EBX), %EDX
        jmp petla

koniec:
        pop %EBX
        pop %EAX
        movl %EBP, %ESP
        pop %EBP
        ret
_start:
        mov $5, %EAX
        mov $7, %EBX
        pushl $tab
        pushl $rozmiar
__begin:
        xor %EAX, %EAX
        xor %EBX, %EBX

        call funkcja
__end: nop