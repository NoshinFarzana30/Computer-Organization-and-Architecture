.MODEL SMALL
.STACK 100H  

.DATA
 
A DB "Enter num1: $"  
B DB "Enter num2: $"
C DB "Addition is: $"  
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
    
    

    

    
    
    ; Display "Addition is: "
    MOV AH, 9
    LEA DX, C
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
    
        
    
    ; Exit program
    MOV AH, 4CH
    INT 21H 
    
    
MAIN ENDP
END MAIN

