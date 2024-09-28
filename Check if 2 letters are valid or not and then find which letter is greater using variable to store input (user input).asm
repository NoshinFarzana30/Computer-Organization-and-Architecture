.MODEL SMALL
.STACK 100H  

.DATA
A DB "Enter letter1: $"  
B DB "Enter letter2: $"
greaterMessage DB " is greater than $" 
equalMessage DB " is equal to $"
I DB 10,13, "Invalid input $"
linebreak DB 10,13, "$" 
letter1 DB ?
letter2 DB ?
 
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
    MOV letter1, AL     ; 1st input store in letter1     
    
    ; Check if input is a letter (A-Z or a-z)
    CMP letter1, 'A'
    JL INVALID_INPUT
    CMP letter1, 'Z'
    JLE VALID_INPUT
    CMP letter1, 'a'
    JL INVALID_INPUT
    CMP letter1, 'z'
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
    MOV letter2, AL    ; 2nd input store in letter2   
    
    ; Check if input is a letter (A-Z or a-z)
    CMP letter2, 'A'
    JL INVALID_INPUT
    CMP letter2, 'Z'
    JLE VALID_INPUT2
    CMP letter2, 'a'
    JL INVALID_INPUT
    CMP letter2, 'z'
    JG INVALID_INPUT

VALID_INPUT2:
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H

    ; Compare the two letters
    MOV BH, letter1
    CMP BH, letter2
    JE EQUAL_LETTERS
    JG LETTER1_GREATER
    JL LETTER2_GREATER

LETTER1_GREATER:
    ; Display letter1 [output]
    MOV AH, 2  
    MOV DL, letter1    
    INT 21H
    
    ; Display " is greater than "
    MOV AH, 9
    LEA DX, greaterMessage
    INT 21H
    
    ; Display letter2 [output]
    MOV AH, 2  
    MOV DL, letter2
    INT 21H
    
    JMP EXIT

LETTER2_GREATER:
    ; Display letter2 [output]
    MOV AH, 2  
    MOV DL, letter2
    INT 21H
    
    ; Display " is greater than "
    MOV AH, 9
    LEA DX, greaterMessage
    INT 21H
    
    ; Display letter1 [output]
    MOV AH, 2  
    MOV DL, letter1
    INT 21H
    
    JMP EXIT

EQUAL_LETTERS:
    ; Display letter1 [output]
    MOV AH, 2  
    MOV DL, letter1
    INT 21H
    
    ; Display "is equal to "
    MOV AH, 9
    LEA DX, equalMessage
    INT 21H
    
    ; Display letter2 [output]
    MOV AH, 2  
    MOV DL, letter2
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
