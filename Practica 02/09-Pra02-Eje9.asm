            ORG 1000H
INGRESE     DB  "INGRESE SU CLAVE:"
            DB  10 ;SALTO DE LINEA
PERMITIDO   DB  "ACCESO PERMITIDO"
            DB  10 
DENEGADO    DB  "ACCESO DENEGADO"
            DB  10
CLAVE       DB  ":%)2"
CLAVE_ING   DB  ""


            ORG 2000H
            MOV BX, OFFSET INGRESE
            MOV AL, OFFSET PERMITIDO - OFFSET INGRESE
            INT 7
            MOV CL, OFFSET CLAVE_ING - OFFSET CLAVE
            MOV BX, OFFSET CLAVE_ING
LEER:       INT 6
            INC BX
            DEC CL            
            JNZ LEER

            MOV DL, 0FFH ;CLAVE CORRECTA
            
            MOV CL, 4
            MOV BX, OFFSET CLAVE
CHEQUEAR:   MOV AH, [BX]
            ADD BX, 4
            CMP AH, [BX]
            JZ LOOP
            MOV DL,0 ;CLAVE INCORRECTA
            JMP BREAK
LOOP:       SUB BX, 3
            DEC CL
            JNZ CHEQUEAR

BREAK:      CMP DL,0FFH
            JZ CORRECTO
            MOV BX, OFFSET DENEGADO
            MOV AL, OFFSET CLAVE - OFFSET DENEGADO
            JMP FIN
CORRECTO:   MOV BX, OFFSET PERMITIDO
            MOV AL, OFFSET DENEGADO - OFFSET PERMITIDO
FIN:        INT 7
            INT 0

END