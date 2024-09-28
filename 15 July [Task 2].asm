.MODEL SMALL
.STACK 100H 

.DATA     



.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX 
    
    MOV CX,20 ;100+95+90+...5 ;decresing by 5 ;so,100/5=20 ;Total term is 20
     
    MOV AX,0
    MOV BX,100  ;100+95+90+...5 ;1st term is 100 [in series] ; 100 stored in BX
   
    
    SUM: 
     
    ADD AX,BX  ;Sum will be stored in AX [ques]
    SUB BX,5   ;100+95+90+...5 ;SUB because decresing by 5 
    
        
   
  
    LOOP SUM
    
    
    
    
    ; Exit Program
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN 