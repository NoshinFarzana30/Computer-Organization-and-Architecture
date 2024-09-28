.MODEL SMALL
.STACK 100H 

.DATA 
A DB 10,13, "Enter a number: $"
O DB 10,13, "Odd number: $"
E DB 10,13, "Even number: $"      
I DB 10,13, "Invalid number: $"
linebreak DB 10,13, "$"

.CODE   

; Procedure to take input from the user
INPUT PROC    
    
    ; Display "Enter a number: "
    MOV AH, 9
    LEA DX, A
    INT 21H
    
    ; Take 1 digit INPUT from the user
    MOV AH, 1
    INT 21H
    MOV BH, AL  ; Store the input in BH 
    
    RET
INPUT ENDP

; Procedure to display the output
OUTPUT PROC
    MOV AH, 2
    MOV DL, BH  ; Display character in DL
    INT 21H
    
    RET
OUTPUT ENDP

; Procedure to check if the input is odd, even or invalid
CHECK_ODD_EVEN PROC
    CMP BH, 31H   ; Compare input with ASCII '1'
    JE ODD        ; Jump if input is '1'
    CMP BH, 33H   ; Compare input with ASCII '3'
    JE ODD        ; Jump if input is '3'
    
    CMP BH, 32H   ; Compare input with ASCII '2'
    JE EVEN       ; Jump if input is '2'
    CMP BH, 34H   ; Compare input with ASCII '4'
    JE EVEN       ; Jump if input is '4'
    
    JMP INVALID   ; If input is not 1, 2, 3, or 4, jump to INVALID

ODD:
    ; Display "Odd number: "
    MOV AH, 9
    LEA DX, O
    INT 21H
    
    
    CALL OUTPUT   
    JMP EXIT

EVEN:
    
     ; Display "Even number: "
    MOV AH, 9
    LEA DX, E
    INT 21H
    
    CALL OUTPUT   
    JMP EXIT

INVALID:  
 ; Display "Invalid number: "
    MOV AH, 9
    LEA DX, I
    INT 21H
    
    CALL OUTPUT   

EXIT:
    RET
CHECK_ODD_EVEN ENDP 



MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    CALL INPUT        ; Call the input procedure
    CALL CHECK_ODD_EVEN ; Call the check procedure
    
    ; Exit program
    MOV AH, 4CH
    INT 21H 
MAIN ENDP

END MAIN
