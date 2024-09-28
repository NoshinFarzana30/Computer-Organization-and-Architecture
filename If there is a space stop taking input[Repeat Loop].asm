.MODEL SMALL
.STACK 100H 

.DATA     



.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX                 
    
    MOV AH,1
    
   
    
    REPEAT: 
    
  
    INT 21H 
    CMP AL,' '
    JNE REPEAT   
   
    
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 