ORG 1000H
    NUM DW 4
    RES DW ?
ORG 3000H
    ;Sub rutina ESPAR
    ;ENTRADA
        ;Pila(1): Valor (De 16 bits) a determinar si es par
    ;SALIDA
        ;Pila(2): Devuelve 0FFH si el valor es par, y 00H si es impar
    ESPAR: MOV BX, SP
        ADD BX, 4
        MOV AX,[BX]
        AND AX, 0001H ;Tener en cuenta que el valor se modifica
        JZ PAR
        MOV CX, 00H
        JMP FIN
        PAR: MOV CX, 0FFH
    FIN: SUB BX, 2
        MOV [BX],CX
        RET
ORG 2000H
    MOV AX, NUM
    PUSH AX
    MOV AX, 0
    PUSH AX
    CALL ESPAR
    POP AX
    MOV RES, AX
    POP AX
    HLT
END