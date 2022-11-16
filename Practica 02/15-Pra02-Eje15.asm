TIMER 				EQU 10H
PIC 				EQU 20H
EOI 				EQU 20H
N_CLK			 	EQU 10
N_F10 				EQU 20

				    ORG 40
IP_CLK DW RUT_CLK

            		ORG 80
IP_F10 DW RUT_F10

				    ORG 1000H
MIN1 		      	DB 30H
MIN2         		DB 30H
             		DB ":"
SEG1         		DB 35H
SEG2         		DB 3AH
             		DB 13
FIN          		DB ?
MSJ          		DB "INGRESE LOS SEGUNDOS DE 1 A 59"
             		DB 13
FIN2         		DB ?

			 	    ORG 3000H
RUT_CLK:     		PUSH AX
             		DEC SEG2
				    CMP SEG2, 2FH
				    JNZ RESET
				    MOV SEG2, 39H
				    DEC SEG1
				    CMP SEG1, 2FH
				    JZ FIN1
RESET:       		MOV BX, OFFSET MIN1
				    MOV AL, OFFSET FIN-OFFSET MIN1
             		INT 7
				    MOV AL, 0
FIN1:		        OUT TIMER, AL
				    MOV AL, EOI
				    OUT PIC, AL
				    POP AX
				    IRET
				
				
				    ORG 3500H
RUT_F10:     		PUSH AX
				    CLI
				    MOV AL, 0FDH
				    OUT PIC+1, AL ; PIC: registro IMR
				    MOV AL, N_CLK
				    OUT PIC+5, AL ; PIC: registro INT1
				    MOV AL, 1
				    OUT TIMER+1, AL ; TIMER: registro COMP
				    MOV AL, 0
				    OUT TIMER, AL ; TIMER: registro CONT
				    MOV AL, EOI
				    OUT PIC, AL
				    STI
             		POP AX
             		IRET
              
				    ORG 2000H
					MOV BX, OFFSET MSJ
					MOV AL, OFFSET FIN2 - OFFSET MSJ
					INT 7
					MOV BX, OFFSET SEG1
					INT 6
					MOV BX, OFFSET SEG2
					INT 6
					CLI
					MOV AL, 0FEH
					OUT PIC+1, AL ; PIC: registro IMR
					MOV AL, N_F10
					OUT PIC+4, AL ; PIC: registro INT0
					STI
LAZO:				JMP LAZO
END
