;;sum

.data

VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0
TAM:    .word 6
PROXIND: .word 1

.text

ld R3, PROXIND(R5)

L17:
    daddi R31, R31, 1   ;;21
    l.d F1, VETOR1(R3)  ;;15
    daddi R3, R3, 8     ;;19
    l.d F0, VETOR1(R2)  ;;14
    ld R1, TAM(R6)      ;;22
    add.d F2, F0, F1    ;;16
    slt R5, R31, R1     ;;23
    s.d F2, 0(R4)       ;;17
    daddi R4, R4, 8     ;;18
bne R5, R0, L17         ;;24

;; filled delay slot:
daddi R2, R2, 8