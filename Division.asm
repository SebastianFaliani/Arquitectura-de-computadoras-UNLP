; DIVISION
            ORG 1000H
DIVIDENDO   DW  7H
DIVISOR     DW  2H
COCIENTE    DW  ?
RESTO       DW ?

            ORG 3000H
DIVIDIR:    PUSH CX
            PUSH DX
            MOV CX, 0H
LOOP:       CMP AX, BX
            JS FIN
            SUB AX, BX
            INC CX
            JMP LOOP
FIN:        POP BX
            MOV [BX], AX
            POP BX
            MOV [BX], CX
            RET

            ORG 2000H
            MOV AX, DIVIDENDO
            MOV BX, DIVISOR
            MOV CX, OFFSET COCIENTE
            MOV DX, OFFSET RESTO
            CALL DIVIDIR
            HLT
END