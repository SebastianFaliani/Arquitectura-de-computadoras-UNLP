        ORG 1000H
;1ER NUMERO 3489 9314 HEXA
NUM1 DW 3489H
NUM2 DW 9314H
 
;2DO NUMERO 8156 9130 HEXA
NUM3 DW 8156H
NUM4 DW 9130H

RES1 DW ?
RES2 DW ?
        
        ORG 3000H
;Sub rutina ESPAR
;PARAMETRO DE ENTRADA
;Pila(1) Direccion de un Valor de los 16bit mas significativos del Primer Numero
;Pila(2) Direccion de un Valor de los 16bit menos significativos del Primer Numero
;Pila(3) Direccion de un Valor de los 16bit mas significativos del Segundo Numero
;Pila(4) Direccion de un Valor de los 16bit menos significativos del Segundo Numero
;PARAMETRO DE SALIDA
;Pila(5) Direccion de un Valor de los 16bit mas significativos de la Suma
;Pila(6) Direccion de un Valor de los 16bit menos significativos de la Suma
SUM32: MOV BX,SP
        ADD BX, 10
        MOV BX, [BX]
        MOV CX,[BX]
        MOV BX,SP
        ADD BX, 6
        MOV BX, [BX]
        ADD CX,[BX]
        MOV AX,0
SUMA: JC RESTO
        MOV BX,SP
        ADD BX, 12
        MOV BX, [BX]
        ADD AX,[BX]
        MOV BX,SP
        ADD BX, 8
        MOV BX, [BX]
        ADD AX, [BX]
        JMP FIN
RESTO:INC AX
        JMP SUMA
        ;EN DX QUEDA B5E0 HEXA
        ;EN AX QUEDA 2444 HEXA
FIN: MOV BX,SP
        ADD BX, 4
        MOV BX, [BX]
        MOV [BX],AX
        MOV BX,SP
        ADD BX, 2
        MOV BX, [BX]
        MOV [BX],CX
        RET
        
        ORG 2000H
        MOV AX,OFFSET NUM1
        PUSH AX
        MOV AX,OFFSET NUM2
        PUSH AX
        MOV AX,OFFSET NUM3
        PUSH AX
        MOV AX,OFFSET NUM4
        PUSH AX
        MOV AX,OFFSET RES1
        PUSH AX
        MOV AX,OFFSET RES2
        PUSH AX
        CALL SUM32
        POP AX
        POP AX
        POP AX
        POP AX
        POP AX
        POP AX
        HLT
END