.MODEL SMALL
.STACK 100H 

.DATA     
A DB 0

.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX                 
        
    ;take input and store in AL
    MOV AH,1  

    
   
    
    REPEAT:
  
    INT 21H 
    
    
    CMP AL,' ' 
    JE SSS   ;if space is pressed stop taking input and show the total count of input
                                                  
    
    INC A
    
    JNE REPEAT   
   
          
    SSS:
    ;display total count of input [output]
    MOV AH,2
    ADD A,30H
    MOV DL,A
    INT 21H
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 