.MODEL SMALL
.STACK 100H  

.DATA
 
A DB "Enter num1: $"  
B DB "Enter num2: $"
C DB "Addition of $" 
andMessage DB " and $"   
isMessage DB " is: $" 
greaterThan DB 10,13, "Addition is greater than 5 $"
lessThan DB 10,13, "Addition is less than 5 $"
equalTo DB 10,13, "Addition is equal to 5 $"
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
     
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
    
    

    
    
    ; Display "Addition of "
    MOV AH, 9
    LEA DX, C
    INT 21H
      
      
    ; Display num1[output]
    MOV AH,2  
    MOV DL, BH    ; Register BH for num1
    INT 21H
    
    
    
    ; Display " and "
    MOV AH, 9
    LEA DX, andMessage
    INT 21H 
    
    ; Display num2 [output]
    MOV AH,2  
    MOV DL, BL    ; Register BL for num2
    INT 21H
   
    ; Display " is: "
    MOV AH, 9
    LEA DX, isMessage
    INT 21H    
    
    
    ADD BH,BL  ; Add num1 and num2
    SUB BH,30H ; ASCII [as we are performing addition, we have to subtract]
    
    
    ; Display addition [output]
    MOV AH,2
    MOV DL,BH
    INT 21H    
    
    
        
    
         
    ; Check if addition is greater than, less than, or equal to 5
   
    CMP BH, '5'
    JG GREATER_THAN
    JL LESS_THAN
    JE EQUAL_TO

GREATER_THAN:
    ; Display "Addition is greater than 5"
    MOV AH, 9
    LEA DX, greaterThan
    INT 21H 
    
    JMP EXIT

LESS_THAN:
    ; Display "Addition is less than 5"
    MOV AH, 9
    LEA DX, lessThan
    INT 21H  
    
    JMP EXIT

EQUAL_TO:
    ; Display "Addition is equal to 5"
    MOV AH, 9
    LEA DX, equalTo 
    INT 21H

EXIT: 
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 

    ; Exit program
    MOV AH, 4CH
    INT 21H 
    
    
    
MAIN ENDP
END MAIN

