.MODEL SMALL
.STACK 100H 

.DATA     



.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX 
    
    MOV CX,50 ;total term 50
     
    MOV DX,0
    MOV BX,1  ;1 + 5 + 9+ 13 + ..... 50th ;1st term is 1 [in series] ; 1 stored in BX
   
    
    SUM: 
     
    ADD DX,BX  ;Sum will be stored in DX [ques]
    ADD BX,4   ;1 + 5 + 9+ 13 + ..... 50th  ;ADD because increasing by 4
    
        
   
  
    LOOP SUM
    
    
    
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 