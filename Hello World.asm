.MODEL SMALL
.STACK 100H 

.DATA     
A DB "Hello World $"
 

.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX
     
    ; Display "Hello World "
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 
 