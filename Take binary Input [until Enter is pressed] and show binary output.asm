.MODEL SMALL
.STACK 100H

.DATA 
inputMsg DB "Enter Binary Input: $"
outputMsg DB "Binary Output: $"
linebreak DB 10,13, "$"

.CODE   
 
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  
    
    
   
         
    ; Display "Enter Binary Input: "
    MOV AH, 9
    LEA DX, inputMsg
    INT 21H   
             
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

    ;linebreak
    MOV AH, 9
    LEA DX, linebreak  
    INT 21H 
     
    ; Display "Binary Output: "
    MOV AH, 9
    LEA DX, outputMsg
    INT 21H   
    
    
    
    MOV CX,16
    IF:
    ROL BX,1
    JNC THEN
    
    
    MOV AH,2
    MOV DL,31H ;1
    INT 21H
    JMP DISPLAY
    
    
    THEN: 
    
    MOV AH,2
    MOV DL,30H ;0
    INT 21H
    JMP DISPLAY
    
    DISPLAY:  
        
    LOOP IF
    
   
             
     
         
             


         
    ; Exit Program
    MOV AH,4CH
    INT 21H 
      
    MAIN ENDP
 END MAIN