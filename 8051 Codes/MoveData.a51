ORG 0000H

MOV R0, #50H
MOV R1, #70H
MOV R2, #08H

LOOP: MOV A, @R0
    MOV @R1, A
    INC R0
    INC R1
    DJNZ R2, LOOP
END