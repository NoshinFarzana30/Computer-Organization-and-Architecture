.MODEL SMALL
.STACK 100H 

.DATA     
A DB "Hello World $"
linebreak DB 10,13, "$"

.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX
     
    
   
    
    PRINT: 
     ; Display "Hello World "
    MOV AH,9
    LEA DX,A
    INT 21H 
        
     ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
    
    JMP PRINT  ; eta deway non stop PRINT label e jump korbe ar Hello World print korbe
    
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 