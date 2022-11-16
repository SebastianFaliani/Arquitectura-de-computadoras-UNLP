ORG 1000H
	NUM DW 4
	RES DB ?
ORG 3000H
	;Sub rutina ESPAR
	;ENTRADA
	;AX: Direccion que apunta al Valor a determinar si es par
	;SALIDA
	;CX: Direccion que apunta donde se guarda 0FFH si el valor es par, y 00H si es impar
	ESPAR: MOV BX, AX
		AND WORD PTR [BX],0001H ;Tener en cuenta que el valor se modifica
		JZ PAR
		MOV BX,CX
		MOV BYTE PTR [BX], 00H
		JMP FIN
		PAR:MOV BX,CX
		MOV BYTE PTR [BX], 0FFH
	FIN:RET
ORG 2000H
	MOV AX,OFFSET NUM
	MOV CX,OFFSET RES
	CALL ESPAR
	HLT
END