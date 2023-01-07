ORG 0000H

MOV DPTR,#CC_PATTERNS

START: MOV A, #0FFH
    MOV B, A
    MOV R0, #0AH

    LOOP: MOV A, B
    INC A
    MOV B, A
    ACALL DISPLAY
    MOV P0, A
    ACALL DELAY
    DEC R0
    MOV A, R0

    JZ START
    SJMP LOOP

DELAY: MOV R3, #255 ;50 or higher for fast CPUs
    HERE2: MOV R4, #255 ;R4=255
    HERE:DJNZ R4, HERE ;stay untill R4 becomes 0
        DJNZ R3, HERE2
        RET

DISPLAY: MOVC A, @A + DPTR
    RET


CC_PATTERNS: DB 0c0h,0f9h,0a4h,0b0h,099h,092h,082h,0f8h,080h,090h,0

END