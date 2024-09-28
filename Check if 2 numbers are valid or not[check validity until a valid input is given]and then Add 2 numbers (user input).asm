.MODEL SMALL
.STACK 100H  

.DATA
 
A DB "Enter num1: $"  
B DB "Enter num2: $"
C DB "Addition of $" 
andMessage DB " and $"   
isMessage DB " is: $" 
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
    JL INVALID_INPUT1
    CMP BH, '9'
    JG INVALID_INPUT1
    
    INVALID_INPUT1:
    ; Display "Invalid input"
    MOV AH, 9
    LEA DX, I
    INT 21H  
    
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
    
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
    JL INVALID_INPUT1
    CMP BH, '9'
    JG INVALID_INPUT1
   
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
    JL INVALID_INPUT2
    CMP BL, '9'
    JG INVALID_INPUT2
    
    
    INVALID_INPUT2:
    
     ; Display "Invalid input"
    MOV AH, 9
    LEA DX, I
    INT 21H    
    
    
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
    MOV BL, AL     ; Register BL for num1   
     
      
    ; Check if input is a digit (0-9)
    CMP BL, '0'
    JL INVALID_INPUT2
    CMP BL, '9'
    JG INVALID_INPUT2
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
   
      
    JMP ADDITION 
    
   
    
    
   

    
        
     
    
ADDITION:
    
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
    
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H      
    
        
EXIT: 
    ; Exit program
    MOV AH, 4CH
    INT 21H 
    
    
MAIN ENDP
END MAIN
