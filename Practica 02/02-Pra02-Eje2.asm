            ORG 1000H
MSJ     DB  01H

            ORG 2000H
            MOV BX, OFFSET MSJ
            MOV AL, 1
LOOP:       INT 7
            CMP BYTE PTR [BX],0FFH
            JZ FIN
            INC BYTE PTR [BX]
            JMP LOOP
FIN:        INT 0
END