        ORG 1000H
LETRA   DB ?

        ORG 3000H
CONTAR: INC DL
        ;AVISAMOS QUE TERMINAMOS. ES OBLIGATORIO
        MOV AL, 20H
        OUT 20H, AL ;EOI=20H PORQUE SI
        
        ;VOLVEMOS CON IRET
        IRET
        
        ORG 2000H
        ;SELECCIONAMOS EL ID 5 PARA EL F10 (PARA EL EJEMPLO- PUEDE SER CUALQUIERA)
        
        ;TOMO LA DIR DE LA SUBRUTINA
        MOV AX, CONTAR ;AX=DIR 3000
        ;PONGO LA DIR EN EL VECTOR DE INTERRUPCION
        MOV BX,40 ;10*4=40 EN LA POSICION 18H(40)= GUARDO LA DIR 3000H EN EL VECTOR DE INTERRUPCION
        MOV [BX],AX
        
        ;CONFIGURACION DEL PIC
        CLI
        MOV AL, 11111110B
        OUT 21H, AL
        MOV AL,10
        OUT 24H, AL
        STI 
        
        LOOP: JMP LOOP
        INT 0
END