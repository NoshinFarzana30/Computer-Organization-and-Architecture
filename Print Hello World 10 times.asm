.MODEL SMALL
.STACK 100H 

.DATA     
A DB "Hello World $"
linebreak DB 10,13, "$"

.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX
    MOV CX,0
     
    
   
    
    PRINT: 
     ; Display "Hello World "
    MOV AH,9
    LEA DX,A
    INT 21H 
        
     ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
             
             
    INC CX
    CMP CX,10 ; 10 baar print er jonno 10
    JL PRINT
    
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 