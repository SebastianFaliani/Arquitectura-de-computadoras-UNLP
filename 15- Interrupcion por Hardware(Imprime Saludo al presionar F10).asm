EOI    EQU 20H
IMR    EQU 21H
INT0   EQU 24H


           ORG 1000H
MSJ    DB  "CHAU"
FMSJ   DB  ?

           ORG 3000H
SALUDAR:   MOV BX, OFFSET MSJ
           MOV AL, OFFSET FMSJ - OFFSET MSJ
           INT 7
           ;ESTO VA SIEMPRE
           MOV AL, 20H
           OUT EOI, AL
           IRET
           
           ORG 2000H
           
           ;EL CLI DESHABILITAR LA INTERRUPCIONES MIENTRAS SE CONFIGURA EL PIC
           CLI
           MOV AL,11111110B
           OUT IMR, AL
           
           ;VOY A ELEJIR EL ID24
           MOV AL, 24
           OUT INT0, AL
           ;EL STI VUELVE HABILITAR LA INTERRUPCIONES AL TERMINAR DE CONFIGURAR EL PIC
           STI
           
           MOV BX, 96 ;COMO ELEJI EL ID24 LO TENGO QEU MULTIPLICAR POR 4 Y DA 96 (60H)
           MOV WORD PTR [BX], SALUDAR
           
           LOOP: JMP LOOP
END

                                ;**********************************
                                ;MISMO PROGRAMA PERO MAS EFICIENTE
                                ;**********************************

EOI    EQU 20H
IMR    EQU 21H
INT0   EQU 24H


           ORG 1000H
MSJ    DB  "CHAU"
FMSJ   DB  ?

           ORG 3000H
SALUDAR:   PUSH BX
           PUSH AX
           MOV BX, OFFSET MSJ
           MOV AL, OFFSET FMSJ - OFFSET MSJ
           INT 7
           ;ESTO VA SIEMPRE
           MOV AL, 20H
           OUT EOI, AL
           POP AX
           POP BX
           IRET
           
           ORG 96
       DW SALUDAR
           
           ORG 2000H
           
           ;EL CLI DESHABILITAR LA INTERRUPCIONES MIENTRAS SE CONFIGURA EL PIC
           CLI
           MOV AL,11111110B
           OUT IMR, AL
           
           ;VOY A ELEJIR EL ID24
           MOV AL, 24
           OUT INT0, AL
           ;EL STI VUELVE HABILITAR LA INTERRUPCIONES AL TERMINAR DE CONFIGURAR EL PIC
           STI
           
           LOOP: JMP LOOP
END