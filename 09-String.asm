ORG 1000H
CASA DB "}~@ñ+-zZ9}!"
Fin db 0

            ORG 3000H
CARAC:      XOR AL,AL
LOOP:       CMP BYTE PTR [BX],0
            JZ FIN
            INC AL
            CMP AL,8H
            JZ MAS8
            INC BX
            JMP LOOP
MAS8:       MOV AL,1
FIN:        RET   

            ORG 3100H
MINU:       XOR AL,AL
LOOP1:      CMP BYTE PTR [BX],0
            JZ FIN1
            CMP BYTE PTR [BX],61H ;Letra "a"
            JS NOMINUS
            MOV CL, 7AH ;Letra "z"
            CMP CL, [BX] 
            JS NOMINUS
            JMP MINUS
NOMINUS:    INC BX
            JMP LOOP1
MINUS:      MOV AL,1
FIN1:       RET 

            ORG 3200H
MAYU:       XOR AL,AL
LOOP2:      CMP BYTE PTR [BX],0
            JZ FIN2
            CMP BYTE PTR [BX],41H ;Letra "A"
            JS NOMAYUS
            MOV CL, 5AH ;Letra "Z"
            CMP CL, [BX] 
            JS NOMAYUS
            JMP MAYUS
NOMAYUS:    INC BX
            JMP LOOP2
MAYUS:      MOV AL,1
FIN2:       RET 

            ORG 3300H
NUMER:      XOR AL,AL
LOOP3:      CMP BYTE PTR [BX],0
            JZ FIN3
            CMP BYTE PTR [BX],30H ;Numero "0"
            JS NONUM
            MOV CL, 39H ;Numero "9"
            CMP CL, [BX] 
            JS NONUM
            JMP NUM
NONUM:      INC BX
            JMP LOOP3
NUM:        MOV AL,1
FIN3:       RET 

            ORG 2000H
            MOV BX, OFFSET CASA
            CALL CARAC
            MOV BX, OFFSET CASA
            CALL MINU
            MOV BX, OFFSET CASA
            CALL MAYU
            MOV BX, OFFSET CASA
            CALL NUMER
            HLT
END
