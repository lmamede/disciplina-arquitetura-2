;;inner

.data

VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0
VETOR2: .double 1.0,1.0,1.0,1.0,1.0,1.0

PRODIN: .double 0.0

TAM:    .word 6
.text

LOOP:
    daddi R31, R31, 1  ;;22
    l.d F4, VETOR1(R2) ;;14
    l.d F2, VETOR2(R3) ;;15
    daddi R3, R3, 8    ;;20
    daddi R2, R2, 8    ;;21
    l.d F0, PRODIN(R4) ;;17
    mul.d F1, F4, F2   ;;16
    ld R1, TAM(R5)     ;;23
    add.d F3, F0, F1   ;;18
    slt R1, R31, R1    ;;24
    s.d F3, PRODIN(R4) ;;19
bne R1, R0, LOOP       ;;25
