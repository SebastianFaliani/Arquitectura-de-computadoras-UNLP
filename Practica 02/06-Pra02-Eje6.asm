            ORG 1000H
        DB  "CERO  "
        DB  "UNO   "
        DB  "DOS   "
        DB  "TRES  "
        DB  "CUATRO"
        DB  "CINCO "
        DB  "SEIS  "
        DB  "SIETE "
        DB  "OCHO  "
        DB  "NUEVE "
NUM     DB  ?


            ORG 2000H
            XOR AH,AH
            MOV BX, OFFSET NUM
            INT 6
            MOV AL, [BX]
            CMP AL,30H
            JS SALTAR
            CMP AL, 3AH
            JNS SALTAR
            CALL TRADUCIR
            MOV AL,6
            INT 7
SALTAR:     INT 0


            ORG 3000H
TRADUCIR:   PUSH DX
            MOV DL,[BX]
            SUB DL,30H
            MOV BX,1000H
LOOP:       CMP DL,0
            JZ FIN
            ADD BX,6
            DEC DL
            JMP LOOP
FIN:        POP DX
            RET
END