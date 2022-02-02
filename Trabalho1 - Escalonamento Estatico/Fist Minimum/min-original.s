;;min

.data
VETOR1: .double 3.0,4.0,5.0,1.0,6.0,7.0
TAM:    .word 6
MIN:    .word 0

.text
ld R3, TAM(R4)
LOOP:
    ld R1, MIN(R4)       
    dsll R1, R1, 2     
    dadd R1, R1, R5     
    l.d F1, VETOR1(R31)   
    l.d F0, VETOR1(R1)    
    c.lt.d 7,F1,F0     
    bc1f 7, GREAT
    nop ; not filled.
    sd R2, MIN(R4)
GREAT:
    daddi R2, R2, 1
    slt R1, R2, R3
    bne R1, R0, LOOP