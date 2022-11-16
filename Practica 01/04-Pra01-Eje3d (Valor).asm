        ORG 1000h
NUM1L   DW  9314H
NUM1H   DW  3489H
NUM2L   DW  9130H
NUM2H   DW  8156H
RESL    DW      ?
RESH    DW      ?
 
        ORG 3000h
        ;Sub rutina SUM32
        ;PARAMETRO DE ENTRADA
        ; Pila(3) Valor de la parte alta del Segundo Numero
        ; Pila(4) Valor de la parte alta del primer Numero
        ; Pila(5) Valor de la parte baja del Segundo Numero
        ; Pila(6) Valor de la parte baja del primer Numero
        ;PARAMETRO DE SALIDA
        ; Pila(1) Direccion donde se guarda la parte alta del resultado de la suma
        ; Pila(2) Direccion donde se guarda la parte baja del resultado de la suma

SUM32:  MOV BX, SP
        ADD BX, 2    ;  salteo el registro IP que apila el CALL
        MOV AX, [BX] ;  NUM1L -> AX
        ADD BX, 2
        MOV CX, [BX] ;  NUM2L -> CX
        ADD BX, 2
        MOV DX, [BX] ;  NUM1H -> DX
        ADD BX, 2
        MOV BX, [BX] ;  NUM2H -> BX
        ADD CX, AX   ;  NUM1L + NUM2L
        ADC DX, BX   ;  NUM1H + NUM2H + carry
        MOV BX, SP
        ADD BX, 10   ;  salteo hasta offset RESL
        MOV AX, [BX] ;  OFFSET RESL -> AX
        ADD BX, 2
        MOV BX, [BX] ;  OFFSET RESH -> BX
        MOV [BX], DX ;  NUM1H + NUM2H + carry -> RESH
        MOV BX, AX
        MOV [BX], CX ;  NUM1L + NUM2L -> RESL
        RET
 
 
        ORG 2000h
        MOV AX, OFFSET RESH
        PUSH AX
        MOV AX, OFFSET RESL
        PUSH AX
        MOV AX, NUM2H
        PUSH AX
        MOV AX, NUM1H
        PUSH AX
        MOV AX, NUM2L
        PUSH AX
        MOV AX, NUM1L
        PUSH AX
        CALL SUM32
        HLT
END