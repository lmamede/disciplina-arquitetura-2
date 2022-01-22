;;sum

.data

VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0
TAM:    .word 6
PROXIND: .word 1

.text

ld R3, PROXIND(R5)
L17:
    l.d F0, VETOR1(R2)
    l.d F1, VETOR1(R3)
    add.d F2, F0, F1
    s.d F2, 0(R4)
    daddi R6, R4, 8
    daddi R8, R3, 8
    daddi R31, R31, 1

    l.d F3, VETOR1(R2)
    l.d F4, VETOR1(R8)
    add.d F5, F3, F4
    s.d F5, 0(R6)
    daddi R7, R6, 8
    daddi R9, R8, 8
    daddi R31, R31, 1

    l.d F6, VETOR1(R2)
    l.d F7, VETOR1(R9)
    add.d F8, F6, F7
    s.d F8, 0(R7)
    daddi R4, R7, 8
    daddi R3, R9, 8
    daddi R31, R31, 1

    ;;verifica se chegou na última posição
    ld R1, TAM(R6)
    slt R1, R31, R1
bne R1, R0, L17

;; filled delay slot:
daddi R2, R2, 8