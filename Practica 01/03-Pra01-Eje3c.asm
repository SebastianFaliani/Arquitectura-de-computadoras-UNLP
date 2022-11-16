        ORG 1000H
;1ER NUMERO 3489 9314 HEXA
NUM1    DW  9314H
        DW  3489H
;2DO NUMERO 8156 9130 HEXA
NUM2    DW  9130H
        DW  8156H
RESL    DW  ?
RESH    DW  ?

        ORG 3000H
        ;Sub rutina SUM32
        ;PARAMETRO DE ENTRADA
        ;AX: Direccion que apunta a la parte baja del Valor del PRIMER numero de 32bit
        ;BX: Direccion que apunta a la parte baja del Valor del SEGUNDO numero de 32bit
        ;PARAMETRO DE SALIDA
        ;AX: se guarda el valor resultado de la parte baja de suma
        ;BX: se guarda el valor resultado de la parte alta de suma
SUM32:  MOV CX, [BX]
        ADD BX,2
        MOV DX, [BX]
        MOV BX, AX
        MOV AX,[BX]
        ADD BX,2
        MOV BX,[BX]
        ADD AX, CX
        ADC BX, DX
        RET
        
        ORG 2000H
        MOV AX, OFFSET NUM1
        MOV BX, OFFSET NUM2
        CALL SUM32
        MOV RESL, AX
        MOV RESH, BX
        HLT
END