;;inner

.data

VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0
VETOR2: .double 1.0,1.0,1.0,1.0,1.0,1.0

PRODIN: .double 0.0

TAM:    .word 6
.text

ld R1, TAM(R5)

LOOP:
    l.d F1, VETOR1(R2)
    l.d F0, VETOR2(R3)
    mul.d F2, F1, F0
    l.d F3, PRODIN(R4)
    add.d F4, F3, F2
    s.d F4, PRODIN(R4)
    daddi R3, R3, 8
    daddi R2, R2, 8
    
    l.d F5, VETOR1(R2)
    l.d F6, VETOR2(R3)
    mul.d F7, F5, F6
    l.d F8, PRODIN(R4)
    add.d F9, F8, F7
    s.d F9, PRODIN(R4)
    daddi R3, R3, 8
    daddi R2, R2, 8
    
    l.d F10, VETOR1(R2)
    l.d F11, VETOR2(R3)
    mul.d F12, F10, F11
    l.d F13, PRODIN(R4)
    add.d F14, F13, F12
    s.d F14, PRODIN(R4)
    daddi R3, R3, 8
    daddi R2, R2, 8

    daddi R31, R31, 1
    slt R1, R31, R1
bne R1, R0, LOOP
