.MODEL SMALL
.STACK 100H 

.DATA     
A DB "Hello World $"
B DB "Bye World $"
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
    CMP CX,5 ; 5 baar print hobe Hello World
    JL PRINT 
    
       
    MOV CX,0
    PRINT2: 
     ; Display "Bye World "
    MOV AH,9
    LEA DX,B
    INT 21H 
        
     ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
             
             
    INC CX
    CMP CX,3 ; 3 baar print hobe Bye World
    JL PRINT2
     
   
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 