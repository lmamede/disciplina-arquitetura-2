;;inner

.data

VETOR1: .double 1.0,2.0,3.0,4.0,5.0,6.0
VETOR2: .double 1.0,2.0,3.0,4.0,5.0,6.0

PRODIN: .double 0.0

TAM:       .word 6
ULTIMO:    .word 40

.text

ld R1, TAM(R5)
ld R2, ULTIMO(R5)
ld R3, ULTIMO(R5)

;;iteracao 1
l.d F1, VETOR1(R2)
l.d F0, VETOR2(R3)
mul.d F1, F1, F0
l.d F0, PRODIN(R4)
add.d F0, F0, F1

;;iteracao 2
daddui R3, R3, #-8
daddui R2, R2, #-8

l.d F1, VETOR1(R2)
l.d F2, VETOR2(R3)

;;iteracao 3
daddui R3, R3, #-8
daddui R2, R2, #-8

LOOP:
    ;;fim da iteracao 1
    s.d F0, PRODIN(R4) ;;6
    
    ;;conta da interacao 2
    mul.d F1, F1, F2
    l.d F3, PRODIN(R4)
    add.d F0, F3, F1
    
    ;;load da iteracao 3
    l.d F1, VETOR2(R3) ;;2
    l.d F2, VETOR1(R2) ;;1
    
    ;;começo da iteracao 4
    daddui R3, R3, #-8
    daddui R2, R2, #-8
    daddi R31, R31, 1
    slt R1, R31, R1
bne R1, R0, LOOP

;;fim da iteracao 3
s.d F0, PRODIN(R4) ;;6

;;conta da iteracao 4
mul.d F1, F1, F2
l.d F3, PRODIN(R4)
add.d F0, F3, F1

;;load da iteracao 5
l.d F1, VETOR2(R3) ;;2
l.d F2, VETOR1(R2) ;;1

;;fim da iteracao 4
s.d F0, PRODIN(R4) ;;6

;;conta da iteracao 5
mul.d F1, F1, F2
l.d F3, PRODIN(R4)
add.d F0, F3, F1

;;conta da iteracao 5
s.d F0, PRODIN(R4) ;;6
