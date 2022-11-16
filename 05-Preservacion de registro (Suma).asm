ORG 1000H
	VEC DB 5,1,4,3,1,12,20,5,1,6
	RES DB ?
ORG 3000H
	;Sub rutina SUMAR
	;ENTRADA
	;BX: Direccion que apunta al Vector
	;CL: Recivo la cant. de Elementos del Vector
	;SALIDA
	;DL: Retorno la suma del Vector
	SUMAR: PUSH BX
		PUSH CX
		MOV DL,00H
  		BUCLE: CMP CL,00H
  		JZ SALIR
  		ADD DL,[BX]
  		INC BX
  		DEC CL
  		JMP BUCLE
 	SALIR: POP CX
  	POP BX
 	RET
ORG 2000H
	MOV BX,OFFSET VEC
	MOV CL,OFFSET RES - OFFSET VEC
	CALL SUMAR
	MOV RES,DL
	HLT
END