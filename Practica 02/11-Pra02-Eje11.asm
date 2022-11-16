PIC EQU 20H
EOI EQU 20H
N_F10 EQU 10
              ORG 40
DW RUT_F10
              ORG 1000
CARACTER      DB ?

              ORG 2000H
              CLI
              MOV AL, 0FEH
              OUT PIC+1, AL ; PIC: registro IMR
              MOV AL, N_F10
              OUT PIC+4, AL ; PIC: registro INT0
              MOV DX, 41H
              STI
              LAZO: INC DX
              CMP DX, 5AH
              JNZ LAZO  
              MOV DX, 41H
              JMP LAZO
              
              ORG 3000H
              RUT_F10: PUSH AX
              MOV CARACTER, DX
              MOV BX, OFFSET CARACTER
              MOV AL, 1
              INT 7
              MOV AL, EOI
              OUT EOI, AL ; PIC: registro EOI
              POP AX
              IRET
END
