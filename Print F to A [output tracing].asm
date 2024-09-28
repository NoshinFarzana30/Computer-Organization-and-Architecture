.MODEL SMALL
.STACK 100H 

.DATA     
linebreak DB 10,13, "$"

.CODE
MAIN PROC  
    MOV AX, @DATA  
    MOV DS, AX  
    
    MOV CH, 70  ; ASCII value for 'F'
    
PRINT: 
    ; Output character in CH
    MOV AH, 2
    MOV DL, CH
    INT 21H 
        
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
             
    ; Increment character
    DEC CH
    CMP CH, 65  ; ASCII value for 'A', stop after 'A'
    JGE PRINT
    
    ; Exit Program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
