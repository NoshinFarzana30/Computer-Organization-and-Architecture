.MODEL SMALL
.STACK 100H

.DATA
C DB 10,13, "Capital letter converted to small letter: $"  
S DB 10,13, "Small letter $"                               
I DB 10,13, "Invalid input $"                               
MES DB "Enter a letter: $"                                   
linebreak DB 10,13, "$"                                      

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter a letter: "
    MOV AH, 9
    LEA DX, MES
    INT 21H

    ; INPUT
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Check if input is a capital letter
    CMP BL, 'A'
    JL INVALID_INPUT
    CMP BL, 'Z'
    JLE CAPITAL_LETTER

    ; Check if input is a small letter
    CMP BL, 'a'
    JL INVALID_INPUT
    CMP BL, 'z'
    JLE SMALL_LETTER

    ; If not a letter, show invalid input
INVALID_INPUT: 
    ; Display "Invalid input"
    MOV AH, 9
    LEA DX, I
    INT 21H
    


    JMP EXIT

CAPITAL_LETTER:
    
    
    ; Display "Capital letter converted to small letter: "
    MOV AH, 9
    LEA DX, C
    INT 21H   
    
    ; Convert to lowercase by adding 32 to the ASCII value
    ;The ASCII value of 'A' is 65, and the ASCII value of 'a' is 97. So, their difference is 32. 65+32=97
    ADD BL, 32
    
    ; Display the converted letter [output]
    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT

SMALL_LETTER: 
    ; Display "Small letter: "
    MOV AH, 9
    LEA DX, S
    INT 21H
    

    JMP EXIT

EXIT:
    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
