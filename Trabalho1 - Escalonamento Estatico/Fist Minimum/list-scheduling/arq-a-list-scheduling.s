;;min

.data
VETOR1: .double 3.0,4.0,5.0,1.0,6.0,7.0
TAM:    .word 6
MIN:    .word 0

.text
ld R3, TAM(R4)



LOOP:
    ld R1, MIN(R4)      ;;14      
    dsll R6, R1, 2      ;;15      
    l.d F1, VETOR1(R31) ;;17        
    dadd R7, R6, R5     ;;16      
    l.d F0, VETOR1(R7)  ;;18        
    c.lt.d 7,F1,F0      ;;19      
    bc1f 7, GREAT       ;;20      
    nop ; not filled.   ;;21
    sd R2, MIN(R4)      ;;22
GREAT:
    daddi R2, R2, 1
    slt R1, R2, R3
    bne R1, R0, LOOP