.MODEL SMALL
.STACK 100H

.DATA
O DB 10,13, "Odd Number $" 
E DB 10,13, "Even Number $" 

.CODE
MAIN PROC  

    MOV AX, @DATA  
    MOV DS, AX  

    ; [Input]
    MOV AH, 1
    INT 21H  
    MOV AL, AL  ; Store input in AL (this will be in ASCII format)
    
    ; Check if the number is odd or even using TEST
    TEST AL, 1
    JZ EVEN       ; Jump to EVEN if the number is even
    JMP ODD       ; Else, jump to ODD

ODD:                

     ; Display "Odd Number"
    MOV AH, 9
    LEA DX, O
    INT 21H

    JMP EXIT

EVEN: 
     ; Display "Even Number"
    MOV AH, 9
    LEA DX, E
    INT 21H              
    
    JMP EXIT

EXIT:
    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
