.MODEL SMALL
.STACK 100H

.DATA
C DB 10,13, "Small letter converted to capital letter: $"  
MES DB "Enter a letter: $"
linebreak DB 10,13, "$"

.CODE 

; Procedure to take input
INPUT PROC
    ; Display "Enter a letter: "
    MOV AH, 9
    LEA DX, MES
    INT 21H

    ; Take Input character
    MOV AH, 1
    INT 21H
    MOV BL, AL  ; Store input character in BL    
    
    RET
INPUT ENDP  

; Procedure to convert the letter to uppercase
CONVERT PROC
    ; Convert to uppercase by clearing the 6th bit (bit position 5) using AND
    AND BL, 1101_1111B  ; Clearing the 6th bit to convert to uppercase
    
    RET
CONVERT ENDP  

; Procedure to output the converted letter
OUTPUT PROC
    ; Display "Small letter converted to capital letter: "
    MOV AH, 9
    LEA DX, C
    INT 21H

    ; Output the converted letter
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    RET
OUTPUT ENDP

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Call Input procedure to get the letter
    CALL Input

    ; Call Convert procedure to convert the letter lowercase to uppercase
    CALL Convert

    ; Call Output procedure to display the converted letter
    CALL Output

    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN
