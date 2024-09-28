.MODEL SMALL
.STACK 100H

.DATA

.CODE

; Procedure to take binary input and store it in BX
INPUT PROC
    XOR BX, BX      ; Clear BX register for binary input
    MOV AH, 1       ; Prepare for input function (INT 21h)

  INPUT_LOOP:
    INT 21H         ; Get user input (binary digit: '0' or '1')
    CMP AL, 0DH     ; Check if input is Enter (carriage return)
    JE RET_OUTPUT   ; If Enter is pressed, go to output section

    CMP AL, '0'     ; Check if the input is '0'
    JE BINARY_0     ; If input is '0', jump to BINARY_0
    CMP AL, '1'     ; Check if the input is '1'
    JE BINARY_1     ; If input is '1', jump to BINARY_1
    JMP INPUT_LOOP  ; If invalid input, loop back for more input

  BINARY_0:
    SHL BX, 1       ; Shift BX left by 1 to make room for the next bit
    JMP INPUT_LOOP  ; Loop back for more input

  BINARY_1:
    SHL BX, 1       ; Shift BX left by 1
    OR BX, 1        ; Set the least significant bit to 1
    JMP INPUT_LOOP  ; Loop back for more input

  RET_OUTPUT:
    RET
INPUT ENDP

; Procedure to output the hex value
OUTPUT PROC
    ; Print newline characters
    MOV AH, 2
    MOV DL, 0DH     ; Carriage return
    INT 21H
    MOV DL, 0AH     ; Line feed
    INT 21H

    MOV CX, 4       ; Set loop counter for 4 hex digits (16-bit number)
    MOV AH, 2       ; Prepare AH for output

  OUTPUT_LOOP:
    MOV DL, BH      ; Move the high byte of BX into DL
    SHR DL, 4       ; Shift the high nibble to the lower nibble for output
    ROL BX, 4       ; Rotate BX left by 4 bits
    CMP DL, 10      ; Compare the value in DL with 10 (for hex digits)
    JGE OUTPUT_LETTER ; If DL >= 10, output a letter (A-F)

    ADD DL, 48      ; Convert the digit (0-9) to ASCII ('0'-'9')
    INT 21H         ; Output the digit
    JMP NEXT_OUTPUT ; Jump to next hex digit

  OUTPUT_LETTER:
    ADD DL, 55      ; Convert the hex letter (A-F) to ASCII ('A'-'F')
    INT 21H         ; Output the letter

  NEXT_OUTPUT:
    LOOP OUTPUT_LOOP; Repeat until all hex digits are processed
   
    RET
OUTPUT ENDP


MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX

    CALL INPUT      ; Call the input procedure to get hex input
    CALL OUTPUT     ; Call the output procedure to display hex output

    ; Exit Program
    MOV AH, 4CH     
    INT 21H  

MAIN ENDP
END MAIN
