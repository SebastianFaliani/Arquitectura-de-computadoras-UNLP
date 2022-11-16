TIMER 	EQU 10H
PIC 	EQU 20H
EOI 	EQU 20H
N_CLK 	EQU 10
N_F10 	EQU 20

				    ORG 40
IP_CLK DW RUT_CLK

            		ORG 80
IP_F10 DW RUT_F10

			        ORG 1000H
MIN1 		      	DB 30H
MIN2         		DB 30H
             		DB ":"
SEG1         		DB 30H
SEG2         		DB 30H
             		DB 13
FIN          		DB ?

         			ORG 3000H
RUT_CLK:     		PUSH AX
				    INC SEG2
				    CMP SEG2, 3AH
				    JNZ RESET
				    MOV SEG2, 30H
				    INC SEG1
RESET:       		MOV BX, OFFSET MIN1
				    MOV AL, OFFSET FIN-OFFSET MIN1
             		INT 7
				    CMP SEG1, 33H
				    JZ TERMINAR
				    MOV AL, 0
 			        OUT TIMER, AL
TERMINAR:   		MOV AL, EOI
				    OUT PIC, AL
				    POP AX
				    IRET
				
				    ORG 3700H
RUT_F10:    		PUSH AX
            		IN AL,PIC+1
				    CMP AL, 0FEH
				    JZ SIGUE
				     
				    CLI
				    MOV AL, 0FEH
				    OUT PIC+1, AL ; PIC: registro IMR
				    MOV AL, EOI
				    OUT PIC, AL
            		STI
            		JMP SALTO

SIGUE:      		CLI
				    MOV AL, 0FCH
				    OUT PIC+1, AL ; PIC: registro IMR
				    MOV AL, EOI
				    OUT PIC, AL
            		STI
            
            
SALTO:      	  	POP AX
            		IRET
            
					ORG 2000H
					CLI
					MOV AL, 0FCH
					OUT PIC+1, AL ; PIC: registro IMR
					MOV AL, N_F10
					OUT PIC+4, AL ; PIC: registro INT0
					MOV AL, N_CLK
					OUT PIC+5, AL ; PIC: registro INT1
					MOV AL, 1
					OUT TIMER+1, AL ; TIMER: registro COMP
					MOV AL, 0
					OUT TIMER, AL ; TIMER: registro CONT
					STI
LAZO:				JMP LAZO

END
