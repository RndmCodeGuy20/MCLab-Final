ORG 0000H
MOV SP, #70H
MOV PSW, #00H

LCD_INPUT: MOV A, #38H 
        LCALL COMNWRT 
        LCALL DELAY 

        MOV A, #0EH 
        LCALL COMNWRT 
        LCALL DELAY 

        MOV A, #01H
        LCALL COMNWRT 
        LCALL DELAY 

        MOV A, #06H 
        LCALL COMNWRT 
        LCALL DELAY 

        MOV A, #85H 
        LCALL COMNWRT 
        LCALL DELAY

        MOV A, #'W' 
        LCALL DATAWRT 
        LCALL DELAY

        MOV A, #0C5H
        LCALL COMNWRT
        LCALL DELAY

        MOV A, #'E' 
        LCALL DATAWRT 
        LCALL DELAY

        LCD_INPUT

COMNWRT: LCALL READY ;send command to LCD
        MOV P1, A ;copy reg A to port 1
        CLR P3.4 ;RS=0 for command
        CLR P3.5 ;R/W=0 for write
        SETB P3.6 ;E-1 for high pulse
        ACALL DELAY ;give LCD some time
        CLR P3.6 ;E=0 for H-to-L pulse
        RET

DATAWRT: LCALL READY ;write data to LCD
        MOV P1, A ;copy reg A to port1
        SETB P3.4 ;RS=1 for data
        CLR P3.5 ;R/W=0 for write
        SETB P3.6 ;E=1 for high pulse
        ACALL DELAY ;give LCD some time
        CLR P3.6 ;E=0 for H-to-L pulse
        RET

READY: CLR P3.4
    SETBP3.5
    RET

DELAY: MOV R3, #255 ;50 or higher for fast CPUs
    HERE2: MOV R4, #255 ;R4=255
    HERE:DJNZ R4, HERE ;stay untill R4 becomes 0
        DJNZ R3, HERE2
        RET