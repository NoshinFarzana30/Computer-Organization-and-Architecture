.MODEL SMALL
.STACK 100H

.DATA  
N DB 10,13, "Number $"
C DB 10,13, "Capital letter $"
S DB 10,13, "Small letter $" 
I DB 10,13, "Invalid input $"
MES DB "Enter an input: $"
 
input DB ?


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
    MOV input, AL    ; store the INPUT in input variable
    
    ; Check if input is a number
    CMP input, '0'
    JL INVALID_INPUT
    CMP input, '9'
    JLE NUMBER

    ; Check if input is a capital letter
    CMP input, 'A'
    JL INVALID_INPUT
    CMP input, 'Z'
    JLE CAPITAL_LETTER

    ; Check if input is a small letter
    CMP input, 'a'
    JL INVALID_INPUT
    CMP input, 'z'
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
