			ORG 1000H
NUM		DB	0B5H
GIROS	DB	5

			ORG 3000H
ROTARDER:	CMP	AL,0
          	JZ FIN
          	CMP CL,0
          	JZ FIN
          	SUB CL,8 ; DA NEGATIVO
          	NEG CL ;LO PASO A POSITIVO
          	CMP CL,8
          	JZ FIN
LOOP:     	ADD AL,AL
          	ADC AL,0
          	DEC CL
          	CMP CL,0
          	JNZ LOOP
FIN:      	RET

          	ORG 2000H
          	MOV AL, NUM
          	MOV CL, GIROS
          	CALL ROTARDER
          	HLT
END