.MODEL SMALL
.STACK 100H

.DATA
  
    
.CODE
MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX



    MOV BX, 0       ; Initialize BX register to 0
    MOV CL, 4       ; Set the shift count to 4 (for hex conversion)
    MOV AH, 1       ; Prepare for input function (INT 21h)

    ; Input hex characters
FOR1:
    INT 21H         ; Get user input (hex digit or character)
    CMP AL, 0DH     ; Check if input is Enter (carriage return)
    JE OUTPUT       ; If Enter is pressed, go to OUTPUT section
    CMP AL, 41H     ; Check if input is a letter (A-F)
    JGE LETTER      ; If A-F, jump to LETTER section
    AND AL, 0FH     ; Convert 0-9 input to hexadecimal value
    JMP SHIFT       ; Jump to shift section

LETTER:
    SUB AL, 37H     ; Convert A-F input to hexadecimal value (A=10, B=11, etc.)

SHIFT:
    SHL BX, CL      ; Shift BX left by 4 bits to make space for the new hex digit
    OR BL, AL       ; Combine BX with the new hex digit
    JMP FOR1        ; Loop back for more input

OUTPUT:
 

    ; Print newline characters
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    MOV CX, 4       ; Set loop counter for 4 hex digits (16-bit number)
    MOV AH, 2       ; Set AH to 2 for ROL instruction

FOR2:
    MOV DL, BH      ; Move the high byte of BX into DL
    SHR DL, 4       ; Shift the high nibble to the lower nibble for output
    ROL BX, 4      ; Rotate BX left by 4 bits
    CMP DL, 10      ; Compare the value in DL with 10 (for hex digits)
    JGE OUTPUTLETTER; If DL >= 10, jump to output a letter

    ADD DL, 48      ; Convert the digit (0-9) to ASCII ('0'-'9')
    INT 21H         ; Output the digit
    JMP NEXT        ; Jump to process next hex digit

OUTPUTLETTER:
    ADD DL, 55      ; Convert the hex letter (A-F) to ASCII ('A'-'F')
    INT 21H         ; Output the letter

NEXT:
    LOOP FOR2       ; Repeat until all digits are processed




EXIT:
    MOV AH, 4CH     
    INT 21H  
    
MAIN ENDP
END MAIN