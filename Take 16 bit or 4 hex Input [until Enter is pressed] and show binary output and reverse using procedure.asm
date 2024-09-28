.MODEL SMALL
 
.STACK 100H
.DATA
 
I DB "ENTER HEX INPUT: $"
O DB 10,13, "IN BINARY: $"
R DB 10,13, "IN REVERSED ORDER: $"

 
.CODE   


; Procedure to take input and convert hex digits
INPUT PROC
    MOV BX, 0       ; Initialize BX register to 0
    MOV CL, 4       ; Set the shift count to 4 (for hex conversion)
    MOV AH, 1       ; Prepare for input function (INT 21h)

   INPUT_LOOP:
    INT 21H         ; Get user input (hex digit or character)
    CMP AL, 0DH     ; Check if input is Enter (carriage return)
    JE RET_INPUT   ; If Enter is pressed, go to output section

    CMP AL, 41H     ; Check if input is a letter (A-F)
    JGE LETTER      ; If A-F, jump to LETTER section
    AND AL, 0FH     ; Convert 0-9 input to hexadecimal value
    JMP SHIFT       ; Jump to shift section

  LETTER:
    SUB AL, 37H     ; Convert A-F input to hexadecimal value (A=10, B=11, etc.)

  SHIFT:
    SHL BX, CL      ; Shift BX left by 4 bits to make space for the new hex digit
    OR BL, AL       ; Combine BX with the new hex digit
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
     
    ;Display "ENTER HEX INPUT:"
    MOV AH, 9
    LEA DX, I
    INT 21H  
    
    
    CALL INPUT  
    
    
    
    
    
    ;Display "IN BINARY:"
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
