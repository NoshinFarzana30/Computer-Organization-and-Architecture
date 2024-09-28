.MODEL SMALL
.STACK 100H

.DATA
    O DB 10,13, "Odd Number $"    
    E DB 10,13, "Even Number $"   

.CODE   

; Procedure to take 1 digit input from user
INPUT PROC
    MOV AH, 1       ; Input function
    INT 21H         ; Get user input
    MOV BH, AL      ; Store the input in BH
    
    RET
INPUT ENDP

; Procedure to display output depending on odd/even status
OUTPUT PROC
    ; Check if the number is odd or even using TEST
    TEST BH, 1      ; Check the least significant bit (odd/even)
    JZ EVEN         ; Jump to EVEN if number is even
    ; If odd, display "Odd Number"
    MOV AH, 9
    LEA DX, O       ; Load address of "Odd Number" message
    INT 21H
    RET

  EVEN:
    ; If even, display "Even Number"
    MOV AH, 9
    LEA DX, E       ; Load address of "Even Number" message
    INT 21H
    
    RET
OUTPUT ENDP   

MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX
    
    CALL INPUT      ; Call the INPUT procedure to take input
    CALL OUTPUT     ; Call the OUTPUT procedure to display result
    
    ; Exit Program
    MOV AH, 4CH
    INT 21H 
MAIN ENDP

END MAIN
