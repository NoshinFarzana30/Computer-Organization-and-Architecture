.MODEL SMALL
.STACK 100H

.DATA

.CODE   

 ;Procedure 
 INPUT PROC
    ;Take 1 digit INPUT from user
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    RET
    
    INPUT ENDP
        
        
 ;Procedure 
 OUTPUT PROC 
    ;Display OUTPUT
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    
    RET
    
    OUTPUT ENDP   
        
        


 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
       
    CALL INPUT  ;Calling  
    
    CALL OUTPUT ;Calling
    
    ; Exit Program
    MOV AH,4CH
    INT 21H 
      
    MAIN ENDP
 END MAIN