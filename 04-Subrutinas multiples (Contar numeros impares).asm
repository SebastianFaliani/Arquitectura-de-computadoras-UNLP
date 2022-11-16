ORG 1000H
	VEC DB 5,1,4,3,1,12,20,5,1,6
	CANT_PARES DB ?
ORG 3000H
	;Sub rutina ESPAR
	;Entrada
	;AX: Valor a determinar si es par
	;Salida
	;CL: Devuelve 0FFH si el valor es par, y 00H si es impar
	ESPAR: AND AH, 01H ;Tener en cuenta que el valor se modifica
		JZ PAR
		MOV CL, 00H
		JMP FIN
		PAR: MOV CL, 0FFH
	FIN: RET
ORG 2500H
	;Sub rutina SUMAR
	;ENTRADA
	;BX: Direccion que apunta al Vector
	;CL: Recivo la cant. de Elementos del Vector
	;SALIDA
	;DL: Retorno la suma del Vector
	CONTAR_PARES: MOV DL,00H
  		BUCLE: CMP CH,00H
  			JZ SALIR
  			MOV AH, [BX]
		  	CALL ESPAR
			CMP CL,0FFH
  			JNZ SEGUIR
  			INC DL
  		SEGUIR:INC BX
  		DEC CH
  		JMP BUCLE
 	SALIR: RET
ORG 2000H
	MOV BX,OFFSET VEC
	MOV CH,OFFSET CANT_PARES - OFFSET VEC
	CALL CONTAR_PARES
	MOV CANT_PARES,DL
	HLT
END