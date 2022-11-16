ORG 1000H
	NUM DW 4
	RES DB ?
ORG 3000H
	;Sub rutina ESPAR
	;Entrada
		;AX: Valor a determinar si es par
	;Salida
		;CL: Devuelve 0FFH si el valor es par, y 00H si es impar
	ESPAR: AND AX, 0001H ;Tener en cuenta que el valor se modifica
		JZ PAR
		MOV CL, 00H
		JMP FIN
		PAR: MOV CL, 0FFH
	FIN: RET
ORG 2000H
	MOV AX, NUM
	CALL ESPAR
	MOV RES, CL
	HLT
END
