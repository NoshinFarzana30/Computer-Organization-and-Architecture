.MODEL SMALL
.STACK 100H

.DATA
v DB 10, 13, "Vowel $"
c DB 10, 13, "Consonant $"
I DB 10, 13, "Invalid $"
mes DB "Enter a letter: $"  
letter DB ? 

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
    MOV letter, AL

    ; Check if input is a letter (A-Z or a-z)
    CMP letter, 'A'
    JL INVALID
    CMP letter, 'Z'
    JLE CHECK_VOWEL
    CMP letter, 'a'
    JL INVALID
    CMP letter, 'z'
    JG INVALID

CHECK_VOWEL:
    ; Check for vowels
    CMP letter, 'A'
    JE VOWEL
    CMP letter, 'E'
    JE VOWEL
    CMP letter, 'I'
    JE VOWEL
    CMP letter, 'O'
    JE VOWEL
    CMP letter, 'U'
    JE VOWEL
    CMP letter, 'a'
    JE VOWEL
    CMP letter, 'e'
    JE VOWEL
    CMP letter, 'i'
    JE VOWEL
    CMP letter, 'o'
    JE VOWEL
    CMP letter, 'u'
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

