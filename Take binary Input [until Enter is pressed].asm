.MODEL SMALL
.STACK 100H

.DATA

.CODE   
 
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    
    XOR BX,BX  ;Clear BX
     
    ;Input
    MOV AH,1   
    INT 21H
    

WHILE_:
    
    CMP AL,0DH  ;CR?
    JE END_WHILE ;yes,done
    AND AL,0FH  ;no,convert to binary value
    SHL BX,1    ;make room for new value
    OR BL,AL    ;put value into BX
    INT 21H     ;read character
    JMP WHILE_  ;loop back
    
END_WHILE:
       
   
    
    ; Exit Program
    MOV AH,4CH
    INT 21H 
      
    MAIN ENDP
 END MAIN