;;sum

.data

VETOR1: .double 1.0,2.0,3.0,4.0,5.0,6.0

TAM:    .word 6
ANTIND: .word 32
ULTIMO:  .word 40

.text
ld R3, ANTIND(R5)
ld R2, ULTIMO(R5)
daddi R31, R31, 2

;;interação 1
l.d F0, VETOR1(R2)
l.d F1, VETOR1(R3)
add.d F2, F0, F1

;;interação 2
daddui R7, R2, #-8
daddui R8, R3, #-8
daddi R31, R31, 1
l.d F3, VETOR1(R7)
l.d F4, VETOR1(R8)


;;interação 3
daddui R2, R7, #-8
daddui R3, R8, #-8
daddi R31, R31, 1

L17:
    ;;fim da interacao 1
    s.d F2, 0(R4)

    ;;meio da iteracao 2
    add.d F2, F3, F4
    
    ;;inicio da iteracao 3
    l.d F3, VETOR1(R2)
    l.d F4, VETOR1(R3)
    
    daddi R4, R4, 8
    daddui R2, R2, #-8
    daddui R3, R3, #-8

    daddi R31, R31, 1
    ld R1, TAM(R6)
    slt R1, R31, R1
bne R1, R0, L17

s.d F2, 0(R4)

add.d F2, F3, F4

l.d F3, VETOR1(R2)
l.d F4, VETOR1(R3)

s.d F2, 0(R4)

add.d F2, F3, F4
s.d F2, 0(R4)
