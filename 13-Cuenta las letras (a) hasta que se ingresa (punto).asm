        ORG 1000H
FINLE   DB "."
LETRA   DB ?

        ORG 2000H
        MOV CL, FINLE
        XOR CH,CH
        MOV BX, OFFSET LETRA
LOOP:   INT 6
        CMP BYTE PTR [BX], CL
        JZ FIN
        CMP BYTE PTR [BX], 61H ; LETRA "a"
        JNZ LOOP
        INC CH
        JMP LOOP
 FIN:   INT 0
END