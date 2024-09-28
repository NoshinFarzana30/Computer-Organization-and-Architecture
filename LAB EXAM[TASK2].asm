.MODEL SMALL
.STACK 100H  

.DATA

  
Msg3 DB "Enter two num: $"
Msg1 DB "Addition is: $"
Msg2 DB "Subtraction is: $"

I DB 10,13, "Invalid input $" 

O DB "Enter your Choice: $" 

linebreak DB 10,13, "$"
 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 

    ; Display "Enter two num: "
    MOV AH, 9
    LEA DX, Msg3
    INT 21H  
   
    ; Read num1 [input]
    MOV AH,1
    INT 21H
    MOV BH, AL     ; Register BH for num1     
    
         
      
    ; Read num2 [input]     
    MOV AH,1
    INT 21H
    MOV BL, AL    ; Register BL for num2   
    
  
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
    
    ; Display "Enter your Choice: "
    MOV AH, 9
    LEA DX, O
    INT 21H    
   
    ; Read choice [input]
    MOV AH,1
    INT 21H
    MOV CH, AL     ; Register CH for choice
    
    ; Compare the two choice 'A' or 'S'
    CMP CH, 'A'
    JE ADDITION
    
    CMP CH, 'S'
    JE SUBTRACTION
     
    JMP INVALID

ADDITION:     
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
   
    ; Display "Addition is: "
    MOV AH, 9
    LEA DX, Msg1
    INT 21H
      
      
    
    
    ADD BH,BL  ; Add num1+num2
    SUB BH,30H ; ASCII [as we are performing addition, we have to subtract]
    
    
    ; Display addition [output]
    MOV AH,2
    MOV DL,BH
    INT 21H    
    
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H      
    
    JMP EXIT

SUBTRACTION:  
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
     
    ; Display "Subtraction is: "
    MOV AH, 9
    LEA DX, Msg2
    INT 21H
    
                   
    SUB BH,BL  ; Subtraction num1-num2
    ADD BH,30H ; ASCII [as we are performing subtraction, we have to add]
    
    ; Display Subtraction [output]
    MOV AH,2
    MOV DL,BH
    INT 21H    
    
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H      
    
    JMP EXIT

INVALID:
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
