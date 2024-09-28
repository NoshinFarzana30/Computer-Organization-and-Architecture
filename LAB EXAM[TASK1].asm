.MODEL SMALL
.STACK 100H  

.DATA
msg DB "Enter two num: $"
ascOrder DB "Numbers in ascending order: $" 
equalMessage DB "is equal to $"
I DB 10,13, "Invalid input $"
linebreak DB 10,13, "$" 

num1 DB ?
num2 DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 

    ; Display "Enter two num: "
    MOV AH, 9
    LEA DX, msg
    INT 21H  
   
    ; Read num1 [input]
    MOV AH, 1
    INT 21H
    MOV num1, AL ; 1st input Store in num1

    ; Check if input is a digit (0-9)
    CMP num1, '0'
    JL INVALID_INPUT
    CMP num1, '9'
    JG INVALID_INPUT

         
      
    ; Read num2 [input]     
    MOV AH, 1
    INT 21H
    MOV num2, AL ; 2nd input Store in num2

    ; Check if input is a digit (0-9)
    CMP num2, '0'
    JL INVALID_INPUT
    CMP num2, '9'
    JG INVALID_INPUT  
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H  
    
    
    

    ; Compare the two numbers
    MOV BH, num1
    
    CMP BH, num2
    JE EQUAL_NUMBERS
    JG NUM1_GREATER
    JL NUM2_GREATER

NUM1_GREATER:     

     ; Display "Numbers in ascending order: "
    MOV AH, 9
    LEA DX, ascOrder
    INT 21H 
    
    ; Display num2 [output] 
    MOV AH, 2 
    MOV DL, num2
    INT 21H
            
    
    ; Display num1 [output]
    MOV AH, 2 
    MOV DL, num1
    INT 21H
    
   
    
  
    JMP EXIT

NUM2_GREATER: 
    
     ; Display "Numbers in ascending order: "
    MOV AH, 9
    LEA DX, ascOrder
    INT 21H 

     
    ; Display num1 [output]   
    MOV AH, 2  
    MOV DL, num1
    INT 21H
    
    ; Display num2 [output] 
    MOV AH, 2 
    MOV DL, num2
    INT 21H
    
   
   
    
    JMP EXIT

EQUAL_NUMBERS:
    ; Display num1 [output]
    MOV AH, 2 
    MOV DL, num1
    INT 21H
    
   
     
     ; Display " is equal to"
    MOV AH, 9
    LEA DX, equalMessage
    INT 21H
    
    ; Display num2 [output]  
    MOV AH, 2 
    MOV DL, num2
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
