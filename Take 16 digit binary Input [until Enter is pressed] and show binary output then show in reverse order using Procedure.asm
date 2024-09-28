.MODEL SMALL
 
.STACK 100H
.DATA
 
I DB "ENTER BINARY INPUT: $"
O DB 10,13, "YOU HAVE ENTERED: $"
R DB 10,13, "IN REVERSED ORDER: $"

 
.CODE   


; Procedure to take binary input and store it in BX
INPUT PROC
    XOR BX, BX      ; Clear BX register for binary input
    MOV AH, 1       ; Prepare for input function (INT 21h)

    INPUT_LOOP:
    INT 21H         ; Get user input (binary digit: '0' or '1')
    CMP AL, 0DH     ; Check if input is Enter (carriage return)
    JE RET_INPUT   ; If Enter is pressed, go to output section

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

    RET_INPUT:
    RET
INPUT ENDP


; Procedure to output the binary value stored in BX
OUTPUT PROC
 

   

    MOV CX, 16       ; Set the loop counter for 16 bits (for a 16-bit binary number)

    OUTPUT_LOOP:
    ROL BX, 1        ; Rotate BX left by 1 bit to bring MSB to CF (carry flag)
    JNC OUTPUT_0     ; If the carry flag is not set, output '0'

    ; Output '1'
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    JMP NEXT_OUTPUT  ; Jump to the next bit

    OUTPUT_0:
    ; Output '0'
    MOV AH, 2
    MOV DL, '0'
    INT 21H

    NEXT_OUTPUT:
    LOOP OUTPUT_LOOP ; Repeat until all bits are processed

    RET
OUTPUT ENDP

; Procedure to show reversed output
REVERSE PROC
  
    MOV CX, 16

    REV:
    SHL BX, 1
    RCR DX, 1  
    LOOP REV
    MOV BX, DX
        
  
    
    MOV CX, 16       ; Set the loop counter for 16 bits (for a 16-bit binary number)

    REV_OUTPUT_LOOP:
    ROL BX, 1        ; Rotate BX left by 1 bit to bring MSB to CF (carry flag)
    JNC REV_OUTPUT_0     ; If the carry flag is not set, output '0'

    ; Output '1'
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    JMP REV_NEXT_OUTPUT  ; Jump to the next bit

    REV_OUTPUT_0:
    ; Output '0'
    MOV AH, 2
    MOV DL, '0'
    INT 21H

    REV_NEXT_OUTPUT:
    LOOP REV_OUTPUT_LOOP
RET
 REVERSE ENDP  




  MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
     
    ;Display "ENTER BINARY INPUT:"
    MOV AH, 9
    LEA DX, I
    INT 21H  
    
    
    CALL INPUT  
    
    
    
    
    
    ;Display "YOU HAVE ENTERED:"
    MOV AH, 9
    LEA DX, O
    INT 21H  
    
    CALL OUTPUT  
    
  
    
    ;Display "IN REVERSED ORDER:"
    MOV AH, 9
    LEA DX, R
    INT 21H  
    
    CALL REVERSE
    
    ;Exit program
    MOV AH, 4CH
    INT 21H
    
    
    MAIN ENDP
  END MAIN
