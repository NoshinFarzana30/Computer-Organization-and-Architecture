.MODEL SMALL
.STACK 100H

.DATA  
N DB 10,13, "Number $"
C DB 10,13, "Capital letter $"
S DB 10,13, "Small letter $" 
I DB 10,13, "Invalid input $"
MES DB "Enter an input: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter an input: "
    MOV AH, 9
    LEA DX, MES
    INT 21H

    ; INPUT
    MOV AH, 1
    INT 21H
    MOV BL, AL  
    
    ; Check if input is a number
    CMP BL, '0'
    JL INVALID_INPUT
    CMP BL, '9'
    JLE NUMBER

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

    ; If not a number or capital or samall letter, show invalid input
    INVALID_INPUT: 
    ; Display "Invalid input"
        MOV AH, 9
        LEA DX, I
        INT 21H 
        
        
        JMP EXIT  
        
        
      NUMBER: 
    ; Display "Number"
        MOV AH, 9
        LEA DX, N
        INT 21H   
        
        
        JMP EXIT 
        

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
        
        
         
      

    EXIT:
        ; Exit Program
        MOV AH, 4CH
        INT 21H

MAIN ENDP
END MAIN
