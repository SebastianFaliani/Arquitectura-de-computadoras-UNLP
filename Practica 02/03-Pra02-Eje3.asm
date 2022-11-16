            ORG 1000H
MSJ     DB  41H
    	   
            ORG 2000H
            MOV BX, OFFSET MSJ
            MOV AL, 1
LOOP:       INT 7
            ADD BYTE PTR [BX], 32
            INT 7
            CMP BYTE PTR [BX],7AH
            JZ FIN
            SUB BYTE PTR [BX], 31
            JMP LOOP
FIN:        INT 0
END