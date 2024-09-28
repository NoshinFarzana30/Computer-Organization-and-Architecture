.MODEL SMALL
.STACK 100H
.DATA

INPUT DB "ENTER BINARY INPUT: $"
OUTPUT DB 0AH,0DH, "YOU HAVE ENTERED: $"
REVERSE DB 0AH,0DH, "IN REVERSED ORDER: $"

.CODE
; Procedure to take input
INPUT1 PROC
    ; Display "ENTER BINARY INPUT: "
    MOV AH,9
    LEA DX, INPUT
    INT 21H

    XOR BX,BX         ; Clear BX
    MOV CX, 16        ; Expect binary input of 16 digits (max)

    WHILE_:
        MOV AH,1       ; Read character input
        INT 21H
        CMP AL,0DH     ; Check if Enter (Carriage return) is pressed
        JE ENDD        ; End if Enter is pressed
        AND AL, 0FH    ; Convert ASCII input to binary
        SHL BX,1       ; Shift BX left by 1 to make room for the new bit
        OR BL,AL       ; OR the current bit into BX
        LOOP WHILE_    ; Repeat until all 16 bits are processed

    ENDD:
    RET
ENDP

; Procedure to show output
OUTPUT1 PROC
    ; Display "YOU HAVE ENTERED: "
    MOV AH,9
    LEA DX, OUTPUT
    INT 21H

    MOV CX, 16        ; We will display 16 bits
    IF:
        ROL BX, 1     ; Rotate BX left by 1 to get the MSB
        JNC THEN      ; If CF = 0, it's a '0'
        MOV AH, 2
        MOV DL, 31H   ; '1'
        INT 21H       ; Display '1'
        JMP DISPLAY

    THEN:
        MOV AH,2
        MOV DL,30H    ; '0'
        INT 21H       ; Display '0'

    DISPLAY:
        LOOP IF       ; Loop until all 16 bits are displayed
    RET
ENDP

; Procedure to show reversed output using PUSH and POP
REVERSE1 PROC
    ; Display "IN REVERSED ORDER: "
    MOV AH,9
    LEA DX, REVERSE
    INT 21H

    MOV CX, 16        ; Prepare for 16 bits

    ; Push each bit onto the stack
    PUSH_LOOP:
        ROL BX, 1     ; Rotate BX left to bring the MSB to CF
        JNC PUSH_ZERO ; If CF = 0, push '0'
        PUSH 1        ; If CF = 1,Push '1' onto the stack
        JMP NEXT_BIT

    PUSH_ZERO:
        PUSH 0        ; Push '0' onto the stack

    NEXT_BIT:
        LOOP PUSH_LOOP ; Repeat for all 16 bits

    ; Pop and display the bits in reverse order
    MOV CX, 16        ; Prepare to pop 16 bits
    POP_LOOP:
        POP AX        ; Pop the value from the stack (either 0 or 1)
        CMP AX, 1
        JE DISPLAY_ONE
        ; Display '0'
        MOV AH, 2
        MOV DL, 30H   ; '0'
        INT 21H
        JMP NEXT_POP

    DISPLAY_ONE:
        ; Display '1'
        MOV AH, 2
        MOV DL, 31H   ; '1'
        INT 21H

    NEXT_POP:
        LOOP POP_LOOP ; Loop until all bits are popped and displayed

    RET
ENDP

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL INPUT1       ; Get the binary input
    CALL OUTPUT1      ; Display the entered binary input
    CALL REVERSE1     ; Display the reversed binary input

    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
