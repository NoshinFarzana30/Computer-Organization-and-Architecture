.MODEL SMALL
.STACK 100H  

.DATA
A DB "Enter num1: $"  
B DB "Enter num2: $"
greaterMessage DB " is greater than $" 
equalMessage DB " is equal to $"
I DB 10,13, "Invalid input $"
linebreak DB 10,13, "$"
 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 

    ; Display "Enter num1: "
    MOV AH, 9
    LEA DX, A
    INT 21H  
   
    ; Read num1 [input]
    MOV AH,1
    INT 21H
    MOV BH, AL     ; Register BH for num1     
    
    ; Check if input is a digit (0-9)
    CMP BH, '0'
    JL INVALID_INPUT
    CMP BH, '9'
    JG INVALID_INPUT

    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H

    ; Display "Enter num2: "   
    MOV AH, 9
    LEA DX, B
    INT 21H       
      
    ; Read num2 [input]     
    MOV AH,1
    INT 21H
    MOV BL, AL    ; Register BL for num2   
    
    ; Check if input is a digit (0-9)
    CMP BL, '0'
    JL INVALID_INPUT
    CMP BL, '9'
    JG INVALID_INPUT  
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H

    ; Compare the two numbers
    CMP BH, BL
    JE EQUAL_NUMBERS
    JG BH_GREATER
    JL BL_GREATER

BH_GREATER:
    ; Display num1 [output]
    MOV AH, 2  
    MOV DL, BH    ; Register BH for num1
    INT 21H
    
    ; Display " is greater than "
    MOV AH, 9
    LEA DX, greaterMessage
    INT 21H
    
    ; Display num2 [output]
    MOV AH, 2  
    MOV DL, BL    ; Register BL for num2
    INT 21H
    
    JMP EXIT

BL_GREATER:
    ; Display num2 [output]
    MOV AH, 2  
    MOV DL, BL    ; Register BL for num2
    INT 21H
    
    ; Display " is greater than "
    MOV AH, 9
    LEA DX, greaterMessage
    INT 21H
    
    ; Display num1 [output]
    MOV AH, 2  
    MOV DL, BH    ; Register BH for num1
    INT 21H
    
    JMP EXIT

EQUAL_NUMBERS:
    ; Display num1 [output]
    MOV AH, 2  
    MOV DL, BH    ; Register BH for num1
    INT 21H
    
    ; Display "is equal to "
    MOV AH, 9
    LEA DX, equalMessage
    INT 21H
    
    ; Display num2 [output]
    MOV AH, 2  
    MOV DL, BL    ; Register BL for num2
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
