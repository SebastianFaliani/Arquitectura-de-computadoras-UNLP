            ORG 1000H
CADENA      DB  "HOLA MUNDO"
            DB  0

            ORG 3000H
CONCAR:     XOR AL,AL
LOOP:       CMP BYTE PTR [BX], 0
            JZ FIN
            INC BX
            INC AL
            JMP LOOP
FIN:        RET
            
            ORG 2000H 
            MOV BX, OFFSET CADENA
            CALL CONCAR
            HLT
END