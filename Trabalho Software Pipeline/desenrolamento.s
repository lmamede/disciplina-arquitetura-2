.data
0: .double 1.0,2.0,3.0,4.0,5.0,6.0
TAM: .word 48

.text
LD R1, TAM(R0);
L.D F0, 0(R1) ;      //F0 = 0[R1]
ADD.D F4, F0, F2;    //F4 = F0+F2
DADDUI R1, R1, #-8 ; //R1 = R1-1 
L.D F0, 0(R1);       //F0 = 0[R1]
DADDUI R1, R1, #-8 ; //R1 = R1-1 

S.D F4, 16(R1) ;     //16[R1] = F4 (soma dos valores) 
ADD.D F4, F0, F2 ;   //F4 = F0+F2 

LOOP: 
    L.D F0, 0(R1) ;
    ADD.D F4, F0, F2 ; 
    S.D F4, 16(R1) ; 
    DADDUI R1, R1, #-8 ; //R1= R1-1 atualiza o valor de i 
BNE R1, R2, LOOP ;   // R1 != R2?LOOP fim no novo “loop” 

L.D F0, 0(R1) ;
ADD.D F4, F0, F2 ;

S.D F4, 8(R1) ;      //R1[8] = F4
ADD.D F4, F0, F2 ;   // F4 = F0 + F2
S.D F4, 0(R1) ;      //R1[0] = F4 



----

