.MODEL SMALL
.STACK 100H  

.DATA
A DB "Enter letter1: $"  
B DB "Enter letter2: $"
greaterMessage DB " is greater than $" 
equalMessage DB " is equal to $"
I DB 10,13, "Invalid input $"
linebreak DB 10,13, "$"
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 

    ; Display "Enter letter1: "
    MOV AH, 9
    LEA DX, A
    INT 21H  
   
    ; Read letter1 [input]
    MOV AH,1
    INT 21H
    MOV BH, AL     ; Register BH for letter1     
    
    ; Check if input is a letter (A-Z or a-z)
    CMP BH, 'A'
    JL INVALID_INPUT
    CMP BH, 'Z'
    JLE VALID_INPUT
    CMP BH, 'a'
    JL INVALID_INPUT
    CMP BH, 'z'
    JG INVALID_INPUT

VALID_INPUT:
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H

    ; Display "Enter letter2: "   
    MOV AH, 9
    LEA DX, B
    INT 21H       
      
    ; Read letter2 [input]     
    MOV AH,1
    INT 21H
    MOV BL, AL    ; Register BL for letter2   
    
    ; Check if input is a letter (A-Z or a-z)
    CMP BL, 'A'
    JL INVALID_INPUT
    CMP BL, 'Z'
    JLE VALID_INPUT2
    CMP BL, 'a'
    JL INVALID_INPUT
    CMP BL, 'z'
    JG INVALID_INPUT

VALID_INPUT2:
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H

    ; Compare the two letters
    CMP BH, BL
    JE EQUAL_NUMBERS
    JG BH_GREATER
    JL BL_GREATER

BH_GREATER:
    ; Display letter1 [output]
    MOV AH, 2  
    MOV DL, BH    ; Register BH for letter1
    INT 21H
    
    ; Display " is greater than "
    MOV AH, 9
    LEA DX, greaterMessage
    INT 21H
    
    ; Display letter2 [output]
    MOV AH, 2  
    MOV DL, BL    ; Register BL for letter2
    INT 21H
    
    JMP EXIT

BL_GREATER:
    ; Display letter2 [output]
    MOV AH, 2  
    MOV DL, BL    ; Register BL for letter2
    INT 21H
    
    ; Display " is greater than "
    MOV AH, 9
    LEA DX, greaterMessage
    INT 21H
    
    ; Display letter1 [output]
    MOV AH, 2  
    MOV DL, BH    ; Register BH for letter1
    INT 21H
    
    JMP EXIT

EQUAL_NUMBERS:
    ; Display letter1 [output]
    MOV AH, 2  
    MOV DL, BH    ; Register BH for letter1
    INT 21H
    
    ; Display "is equal to "
    MOV AH, 9
    LEA DX, equalMessage
    INT 21H
    
    ; Display letter2 [output]
    MOV AH, 2  
    MOV DL, BL    ; Register BL for letter2
    INT 21H

    JMP EXIT

INVALID_INPUT:
    ; Display "Invalid input"
    MOV AH, 9
    LEA DX, I
    INT 21H  
    
    JMP EXIT  
    
EXIT: 
    ; Exit program
    MOV AH, 4CH
    INT 21H 
    
MAIN ENDP
END MAIN
