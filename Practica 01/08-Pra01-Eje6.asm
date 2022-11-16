            ORG 1000H
CAD1        DW  089ABH
CAD2        DW  0CDEFH


            ORG 3000H
SWAP:       MOV BX,SP
            ADD BX,2
            MOV BX,[BX]
            MOV CX, [BX]
            MOV DX, BX
            
            
            MOV BX,SP
            ADD BX,4
            MOV BX,[BX]
            MOV AX, [BX]
            
            MOV [BX],CX
            MOV BX,DX
            MOV [BX],AX
FIN:        RET
            
            ORG 2000H 
            MOV BX, OFFSET CAD1
            PUSH BX
            MOV BX, OFFSET CAD2
            PUSH BX
            CALL SWAP
            POP BX
            POP BX
            HLT
END