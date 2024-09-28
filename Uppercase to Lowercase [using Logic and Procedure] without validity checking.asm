.MODEL SMALL
.STACK 100H

.DATA
C DB 10,13, "Capital letter converted to small letter: $"
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



; Procedure to convert the letter to lowercase
CONVERT PROC
    ; Convert to lowercase by setting the 6th bit (bit position 5) using OR
    OR BL, 0010_0000B  ; Setting the 6th bit to convert to lowercase
    
    RET
CONVERT ENDP  




; Procedure to output the converted letter
OUTPUT PROC
    ; Display "Capital letter converted to small letter: "
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

    ; Call Convert procedure to convert the letter uppercase to lowercase
    CALL Convert

    ; Call Output procedure to display the converted letter
    CALL Output

    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP



END MAIN
