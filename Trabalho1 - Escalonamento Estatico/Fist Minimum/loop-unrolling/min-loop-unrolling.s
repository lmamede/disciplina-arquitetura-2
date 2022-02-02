;;min

.data
VETOR1: .double 1.0,1.0,1.0,1.0,1.0,1.0
TAM:    .word 6

.text

ld R3, TAM(R4)

LOOP:
    ld R1, 0(R4)        
    dsll R12, R1, 2      
    dadd R13, R12, R5     
    l.d F1, VETOR1(R31) 
    l.d F0, VETOR1(R13)  
    c.lt.d 7,F1,F0
    daddi R2, R2, 1               
    
    ld R6, 0(R4)        
    dsll R7, R6, 2      
    dadd R8, R7, R5     
    l.d F1, VETOR1(R31) 
    l.d F0, VETOR1(R8)  
    c.lt.d 7,F1,F0
    daddi R2, R2, 1                     
    
    ld R9, 0(R4)        
    dsll R10, R9, 2      
    dadd R11, R10, R5     
    l.d F1, VETOR1(R31) 
    l.d F0, VETOR1(R11)  
    c.lt.d 7,F1,F0

    bc1f 7, GREAT       
    sd R2, 0(R4)        

GREAT:
    daddi R2, R2, 1     
    slt R1, R2, R3      
    bne R1, R0, LOOP