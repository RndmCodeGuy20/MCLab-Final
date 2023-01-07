ORG 0000H

MOV R2, #05H
DEC R2

BACK1: MOV R0, #50H
    MOV R1, #51H
    MOV A, R2
    MOV R3, A

    BACK: MOV A,@R0
        MOV B,@R1
        CJNE A, B, LOOP

        LOOP: JC LOOP1
            MOV @R0,B
            MOV @R1, A

            LOOP1: INC R0
                INC R1
                DJNZ R3, BACK
                DJNZ R2, BACK1
END