.MODEL SMALL
.STACK 100H

.DATA

mes DB "Hi $"   

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

   
  MOV BL,1
  CMP BL,31H ; 1 (AFTER ADDING 30)
  JE PRINT ; BL er moddhe 1 thakle print hobe  Hi
  
  PRINT:
    ; Display "Hi "
    MOV AH, 9
    LEA DX, mes
    INT 21H

EXIT:
    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

