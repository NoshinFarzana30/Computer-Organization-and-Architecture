.MODEL SMALL
.STACK 100H 

.DATA 
    
.CODE
 MAIN PROC  
 
    MOV AX, @DATA  
    MOV DS, AX  
      
    ; [Input]
    MOV AH, 1
    INT 21H  
    MOV BH,AL
    
    
    CMP BH,31H  ;1
    JE ODD
    CMP BH,33H  ;3
    JE ODD   
    
    
    
    CMP BH,32H  ;2
    JE EVEN 
    CMP BH,34H  ;4
    JE EVEN 
    
    
    
    
    JMP INVALID 
    
    
    
    
    ODD: ;label name ODD
    MOV AH,2
    MOV DL,'o'   ; if user gives 1 or 3 input.. show o
    INT 21H
       
    JMP EXIT
             
             
             
    EVEN:  ;label name EVEN
    MOV AH,2
    MOV DL,'e'    ; if user gives 2 or 4 input.. show e
    INT 21H
     
    JMP EXIT 
    
    
     
    INVALID:  ;label name INVALID
    MOV AH,2
    MOV DL,'i' ; if the input is other value, except 1/2/3/4 ..show i
    INT 21H
       
       
    EXIT:
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
