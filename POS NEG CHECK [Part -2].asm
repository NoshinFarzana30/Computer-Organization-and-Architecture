.MODEL SMALL
.STACK 100H

.DATA
P DB 10,13, "Positive $" 
N DB 10,13, "Negative $"
I DB 10,13, "Invalid input $"
MES DB "Enter a number: $"


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter a number: "
    MOV AH, 9
    LEA DX, MES
    INT 21H

    ; INPUT
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Check if input is '-'
    CMP BL, '-'
    JE CHECK_NEGATIVE

    ; Check if input is a digit (0-9)
    CMP BL, '0'
    JL INVALID_INPUT
    CMP BL, '9'
    JG INVALID_INPUT

    ; If input is '0'to'9', it's a valid digit
    JMP POSITIVE
                   
                   
                   
                   
                   
CHECK_NEGATIVE:
    ; Get the next character to check if it's a digit (1-9)..take 1 digit inut
    MOV AH, 1
    INT 21H
    MOV BH, AL

    ; Check if input is a digit (1-9)
    CMP BH, '1'
    JL INVALID_INPUT
    CMP BH, '9'
    JG INVALID_INPUT

    ; If input is '-1'to'-9', it's a valid negative digit
    JMP NEGATIVE

POSITIVE:
    ; Display "Positive"
    MOV AH, 9
    LEA DX, P
    INT 21H   
    
    JMP EXIT

NEGATIVE:
    ; Display "Negative"
    MOV AH, 9
    LEA DX, N
    INT 21H 
    
    JMP EXIT

INVALID_INPUT:
    ; Display "Invalid input"
    MOV AH, 9
    LEA DX, I
    INT 21H
    
    JMP EXIT

EXIT:
    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
