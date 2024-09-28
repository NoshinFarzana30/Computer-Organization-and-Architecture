.MODEL SMALL
.STACK 100H  

.DATA
 
A DB "Enter num1: $"  
B DB "Enter num2: $"
C DB "Addition of $" 
andMessage DB " and $"   
isMessage DB " is: $" 
linebreak DB 10,13, "$" 
num1 DB ?
num2 DB ?
 


 
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
    MOV num1, AL     ; Register BH for num1
    
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
    MOV num2, AL    ; Register BL for num2
     
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
    MOV DL, num1    ; Register BH for num1
    INT 21H
    
    
    
    ; Display " and "
    MOV AH, 9
    LEA DX, andMessage
    INT 21H 
    
    ; Display num2 [output]
    MOV AH,2  
    MOV DL, num2    ; Register BL for num2
    INT 21H
   
    ; Display " is: "
    MOV AH, 9
    LEA DX, isMessage
    INT 21H    
    
   
    MOV BH, num1
     
    ADD BH, num2  ; Add num1 and num2
    SUB BH,30H ; ASCII [as we are performing addition, we have to subtract]
    
    MOV num1, BH
    
    ; Display addition [output]
    MOV AH,2
    MOV DL,num1
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

