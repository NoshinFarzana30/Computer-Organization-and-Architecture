.MODEL SMALL
.STACK 100H

.DATA
C DB 10,13, "Capital letter $"
S DB 10,13, "Small letter $"
I DB 10,13, "Invalid input $"
MES DB "Enter a letter: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter a letter: "
    MOV AH, 9
    LEA DX, MES
    INT 21H

    ; INPUT
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Check if input is a capital letter
    CMP BL, 'A'
    JL INVALID_INPUT
    CMP BL, 'Z'
    JLE CAPITAL_LETTER

    ; Check if input is a small letter
    CMP BL, 'a'
    JL INVALID_INPUT
    CMP BL, 'z'
    JLE SMALL_LETTER

    

    CAPITAL_LETTER:
    ; Display "Capital Letter"
        MOV AH, 9
        LEA DX, C
        INT 21H  
        
        
        JMP EXIT

    SMALL_LETTER: 
    ; Display "Small Letter"
        MOV AH, 9
        LEA DX, S
        INT 21H
        
        
        JMP EXIT  
        
        
    ; If not a letter, show invalid input
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
