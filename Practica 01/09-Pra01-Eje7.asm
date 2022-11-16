            ORG 1000H
CADENA      DB  "HOLA MUNDO LOCO"
            DB  00H
CAR         DB  "O"

            ORG 3000H
CONCAR:     MOV BX,SP
            ADD BX,2
            MOV BX,[BX]
            XOR AX,AX
LOOP:       CMP BYTE PTR [BX],00H
            JZ FIN
            INC AL
            INC BX
            CMP BYTE PTR [BX],CL
            JNZ SIG
            INC AH
SIG:        JMP LOOP
FIN:        RET
            
            ORG 2000H 
            MOV BX, OFFSET CADENA
            MOV CL, CAR
            PUSH BX
            CALL CONCAR
            POP BX
            HLT
END