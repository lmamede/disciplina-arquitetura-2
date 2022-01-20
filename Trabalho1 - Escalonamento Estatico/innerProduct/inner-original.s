;;inner

.data

VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0
VETOR2: .double 1.0,1.0,1.0,1.0,1.0,1.0

PRODIN: .double 0.0

TAM:    .word 6
.text

LOOP:
    l.d F1, VETOR1(R2)
    l.d F0, VETOR2(R3)
    mul.d F1, F1, F0
    l.d F0, PRODIN(R4)
    add.d F0, F0, F1
    s.d F0, PRODIN(R4)
    daddi R3, R3, 8
    daddi R2, R2, 8
    daddi R31, R31, 1
    ld R1, TAM(R5)
    slt R1, R31, R1
bne R1, R0, LOOP
