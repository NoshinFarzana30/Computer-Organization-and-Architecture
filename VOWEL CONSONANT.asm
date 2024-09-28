.MODEL SMALL
.STACK 100H

.DATA
v DB 10, 13, "Vowel $"
c DB 10, 13, "Consonant $"
I DB 10, 13, "Invalid $"
mes DB "Enter a letter: $"   

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter a letter: "
    MOV AH, 9
    LEA DX, mes
    INT 21H

    ; 1 digit INPUT from user
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Check if input is a letter (A-Z or a-z)
    CMP BL, 'A'
    JL INVALID
    CMP BL, 'Z'
    JLE CHECK_VOWEL
    CMP BL, 'a'
    JL INVALID
    CMP BL, 'z'
    JG INVALID

CHECK_VOWEL:
    ; Check for vowels
    CMP BL, 'A'
    JE VOWEL
    CMP BL, 'E'
    JE VOWEL
    CMP BL, 'I'
    JE VOWEL
    CMP BL, 'O'
    JE VOWEL
    CMP BL, 'U'
    JE VOWEL
    CMP BL, 'a'
    JE VOWEL
    CMP BL, 'e'
    JE VOWEL
    CMP BL, 'i'
    JE VOWEL
    CMP BL, 'o'
    JE VOWEL
    CMP BL, 'u'
    JE VOWEL

CONSONANT:
    ; Display "Consonant"
    MOV AH, 9
    LEA DX, c
    INT 21H  
    
    JMP EXIT

VOWEL:
    ; Display "Vowel"
    MOV AH, 9
    LEA DX, v
    INT 21H  
    
    JMP EXIT

INVALID:
    ; Display "Invalid"
    MOV AH, 9
    LEA DX, I
    INT 21H

EXIT:
    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

