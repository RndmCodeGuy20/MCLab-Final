ORG 0000H

MOV R0, #40H
MOV R2, #0AH

MOV R3, @R0

LOOP: MOV A, @R0
    CJNE A, R3, NE
    AJMP SKIP

    NE: JC SKIP
        MOV R3, A

    SKIP: INC R0
        DJNZ R2, LOOP
END