         	ORG 1000H
MSJ	DB		"ARQUITECTURA DE COMPUTADORAS-"
	DB		"FACULTAD DE INFORMATICA-"
	DB 		55H
	DB 		4EH
	DB 		4CH
	DB 		50H
FIN	DB 		?


			ORG 2000H
			MOV BX, OFFSET MSJ
			MOV AL, OFFSET FIN - OFFSET MSJ
			INT 7
			INT 0
END
