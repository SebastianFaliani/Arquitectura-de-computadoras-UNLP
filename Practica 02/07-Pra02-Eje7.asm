            ORG 1000H
NUM1        DB ?
NUM2        DB ?
RES         DB ?
            DB ?
FRES        DB ?
            
            ORG 2000H
            MOV BX, OFFSET NUM1
            INT 6
            CALL ES_NUM
            CMP AH,0
            JZ FIN
            MOV BX, OFFSET NUM2
            INT 6
            CALL ES_NUM
            CMP AH,0
            JZ FIN
            MOV CL, NUM1
            MOV CH, NUM2
            MOV BX, OFFSET RES
            CALL SUMA
            
FIN:        INT 0

            ORG 3500H
SUMA:       ADD CL,CH
            SUB CL,60H
            CMP CL, 0AH
            JS UN_DIG
            MOV BYTE PTR [BX],31H
            INC BX
            SUB CL, 0AH
            ADD CL, 30H
            MOV [BX], CL
            JMP RESULTADO
            
UN_DIG:     ADD CL,30H
            MOV BYTE PTR [BX],30H
            INC BX
            MOV [BX], CL
            
RESULTADO:  MOV BX, OFFSET RES
            MOV AL, OFFSET FRES - OFFSET RES
            INT 7
            
            RET

            ORG 3000H
ES_NUM:     MOV AH, 0
            CMP BYTE PTR [BX], 30H
            JS NO_ES
            CMP BYTE PTR [BX], 3AH
            JNS NO_ES
            MOV AH, 0FFH
NO_ES:      RET


END