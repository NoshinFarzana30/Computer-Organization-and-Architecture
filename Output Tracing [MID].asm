.MODEL SMALL
 
.STACK 100H
 

.DATA
 
CR EQU '0DH'
 
LF EQU '0AH'
 
MSG1 DB 'DO NOT STOP$'
 
MSG2 DB 'STOP$'
 

.CODE 
 
MAIN PROC
 
MOV AX, @DATA
 
MOV DS, AX
 
MOV CX, 7H
 
PRINT:
 
LEA DX, MSG1
 
MOV AH,9
 
INT 21H
 
MOV AH, 2
 
MOV DL, 0DH
 
INT 21H
 
MOV DL,0AH
 
INT 21H
 
DEC CX
 
JNZ PRINT
 
MOV AH, 2
 
MOV DL, 0DH
 
INT 21H
 
MOV DL, 0AH
 
INT 21H
 
LEA DX, MSG2
 
MOV AH,9
 
INT 21H
 
Exit:
 
LEA DX, MSG2
 
MOV AH, 9
 
INT 21H
 
MOV AH, 4CH
 
INT 21H
 
MAIN ENDP
 
END MAIN