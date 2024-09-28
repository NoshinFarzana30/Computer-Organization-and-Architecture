.MODEL SMALL
.STACK 100H 

.DATA     

 

.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX
    
    
    ;Take 1 digit INPUT from user
    MOV AH,1
    INT 21H
    MOV BH,AL   
    
    ;Display OUTPUT
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    
    
    ;EXIT
    MOV AH,4CH
    INT 21H 
    
MAIN ENDP
END MAIN 
 