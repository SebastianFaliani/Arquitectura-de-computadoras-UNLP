ORG 1000H
    NUM DW 4
    RES DB ?
ORG 3000H
    ;Sub rutina ESPAR
    ;ENTRADA
        ;Pila(1): Direccion de un Valor (De 16 bits) a determinar si es par
    ;SALIDA
        ;Pila(2): Direccion donde se guarda 0FFH si el valor es par, y 00H si es impar
    ESPAR: MOV BX,SP
        ADD BX,4
        MOV BX,[BX]
        MOV AX,[BX]
        AND AX, 0001H
        JZ PAR
        MOV CL, 00H
        JMP FIN
        PAR: MOV CL, 0FFH
    FIN: MOV BX,SP
        ADD BX,2
        MOV BX,[BX]
        MOV [BX],CL
        RET
ORG 2000H
    MOV AX, OFFSET NUM
    PUSH AX
    MOV AX, OFFSET RES
    PUSH AX
    CALL ESPAR
    POP AX
    POP AX
    HLT
END