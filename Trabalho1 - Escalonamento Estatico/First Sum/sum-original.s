;;sum

.data

VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0

TAM:    .word 6
PROXIND: .word 1

.text

ld R3, PROXIND(R5)
L17:
    ;;carrega os vetores
    l.d F0, VETOR1(R2)
    l.d F1, VETOR1(R3)

    ;;soma as posições correspondentes
    add.d F0, F0, F1
    
    ;;salva o resultado na memória
    s.d F0, 0(R4)
    
    ;;incrementa o apontador do índice
    daddi R4, R4, 8
    daddi R3, R3, 8

    ;;verifica se chegou na última posição
    daddi R31, R31, 1
    ld R1, TAM(R6)
    slt R1, R31, R1
bne R1, R0, L17

;; filled delay slot:
daddi R2, R2, 8