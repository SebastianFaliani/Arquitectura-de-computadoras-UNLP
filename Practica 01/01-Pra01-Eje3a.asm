        ORG 1000H
;1ER NUMERO 3489 9314 HEXA
NUM1H   DW  3489H
NUM1L   DW  9314H
;2DO NUMERO 8156 9130 HEXA
NUM2H   DW  8156H
NUM2L   DW  9130H
RESH    DW  ?
RESL    DW  ?

        ORG 2000H
        MOV AX, NUM1H
        MOV BX, NUM1L
        MOV CX, NUM2H
        MOV DX, NUM2L
        ADD BX, DX
        ADC AX, CX
        MOV RESH,AX 
        MOV RESL,BX
        HLT
END