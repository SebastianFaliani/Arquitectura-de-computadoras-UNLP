            ORG 1000H
MSJ     DB      "INGRESE UN NUMERO:"
FINMSJ  DB      ?
MSJ1    DB      "CARACTER NO VALIDO"
FINMSJ1 DB      ?

            ORG 1500H
NUM DB      ?

            ORG 3000H

            ;SUBRUTINA ES_NUM
            ;PARAMETROS DE ENTRADA
                ;BX Direccion de memoria del caracter ingresado
            ;PARAMETRO DE SALIDA
                ;AH Devuelve 00H si es un numero y 0FFH de lo contrario
ES_NUM:     MOV AH, 00H
            CMP BYTE PTR [BX],30H
            JS FIN
            CMP BYTE PTR [BX],3AH
            JNS FIN
            MOV AH, 0FFH
FIN:        RET

            ORG 2000H
            MOV BX, OFFSET MSJ
            MOV AL, OFFSET FINMSJ - OFFSET MSJ
            INT 7
            MOV BX, OFFSET NUM
            INT 6
CALL        ES_NUM
            CMP AH, 00H
            JNZ NUMERO
            MOV BX, OFFSET MSJ1
            MOV AL, OFFSET FINMSJ1 - OFFSET MSJ1
            JMP IMPRIME
NUMERO:     MOV AL,1
IMPRIME:    INT 7
            INT 0
END