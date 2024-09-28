.MODEL SMALL
.STACK 100H 

.DATA     
A DB "*$"


.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX
    MOV CX,0 ;print 80 stars
     
    
   
    
    PRINT: 
     ; Display "*"
    MOV AH,9
    LEA DX,A
    INT 21H 
        
   
  
    LOOP PRINT
    
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 