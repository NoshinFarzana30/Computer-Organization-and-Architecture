.MODEL SMALL
.STACK 100H

.DATA

.CODE   

 ;Procedure
 INPUT PROC
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    RET
    
    INPUT ENDP
        
        
        
        
        


 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
       
    CALL INPUT  ;Calling
    
    ; Exit Program
    MOV AH,4CH
    INT 21H 
      
    MAIN ENDP
 END MAIN