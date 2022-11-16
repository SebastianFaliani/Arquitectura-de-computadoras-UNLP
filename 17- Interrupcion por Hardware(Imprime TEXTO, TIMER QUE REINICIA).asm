EOI    EQU 20H
IMR    EQU 21H
INT0   EQU 25H

CONT   EQU 10H
COMP   EQU 11H

           ORG 1000H
MSJ    DB  "NO DEBO PROGRAMAR EN ASSAMBLER"
MSJ1   DB  0DH ;ENTER
FMSJ   DB  0

           ORG 3000H
SALUDAR:   PUSH BX
           PUSH AX
           MOV BX, OFFSET MSJ
           MOV AL, OFFSET FMSJ - OFFSET MSJ
           INT 7
           MOV AL,0
           OUT CONT,AL
           ;ESTO VA SIEMPRE
           MOV AL, 20H
           OUT EOI, AL
           POP AX
           POP BX
           IRET
           
           ORG 80
       DW SALUDAR
           
           ORG 2000H
           
           ;EL CLI DESHABILITAR LA INTERRUPCIONES MIENTRAS SE CONFIGURA EL PIC
           CLI
              MOV AL,11111101B
              OUT IMR, AL
              
              ;VOY A ELEJIR EL ID20
              MOV AL, 20
              OUT INT0, AL ;MULTIPLICA POR 4
              
              ;CONFIGURO EL TIMER
              MOV AL,5
              OUT COMP, AL
              MOV AL,0
              OUT CONT,AL
           ;EL STI VUELVE HABILITAR LA INTERRUPCIONES AL TERMINAR DE CONFIGURAR EL PIC
           STI
           
           LOOP: JMP LOOP
           INT 0
END