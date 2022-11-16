TIMER EQU 10H
PIC EQU 20H
EOI EQU 20H
N_CLK EQU 10
				ORG 40
IP_CLK DW RUT_CLK
		
				ORG 1000H
MIN1 		    DB 30H
MIN2 	        DB 30H
        	    DB ":"
SEG1        	DB 30H
SEG2        	DB 30H
            	DB 13
FIN         	DB ?

				ORG 3000H
				RUT_CLK: PUSH AX
;    			INC SEG2
;				CMP SEG2, 3AH
;				JNZ RESET
;				MOV SEG2, 30H
				INC SEG1
				CMP SEG1, 36H
				JNZ RESET
				MOV SEG1, 30H
				INC MIN2
				CMP MIN2, 3AH
				JNZ RESET
				MOV MIN2, 30H
				INC MIN1
    			CMP MIN1, 36H
    			JNZ RESET
    			MOV MIN1, 30H
    			RESET: INT 7
				MOV AL, 0
				OUT TIMER, AL
				MOV AL, EOI
				OUT PIC, AL
				POP AX
				IRET

				ORG 2000H
				CLI
				IN AL, PIC+1
				AND AL, 11111101B ;PONE UN CERO EN TIMER SIN ALTERAR EL RESTO
				OUT PIC+1, AL ; PIC: registro IMR
				MOV AL, N_CLK
				OUT PIC+5, AL ; PIC: registro INT1
				MOV AL, 1
				OUT TIMER+1, AL ; TIMER: registro COMP
				MOV AL, 0
				OUT TIMER, AL ; TIMER: registro CONT
				MOV BX, OFFSET MIN1
				MOV AL, OFFSET FIN-OFFSET MIN1
				STI
				LAZO: JMP LAZO
END