.MODEL SMALL
.STACK 100H

.DATA
A DW ?

.CODE
 MAIN PROC
  MOV AX,@DATA
  MOV DS,AX

MOV A,0
  
;take input and store in AL
MOV AH,1
INT 21H  


WHILE:
CMP AL,0DH
JE END_WHILE  ;if enter is pressed stop taking input


INC DX 


;input
MOV AH,1
INT 21H

JMP WHILE


END_WHILE:
  
  
MAIN ENDP
 END MAIN