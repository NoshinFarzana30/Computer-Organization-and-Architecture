.MODEL SMALL
.STACK 100H

.DATA
    ; No data section changes are needed

.CODE
MAIN PROC
    MOV AX, @DATA     ; Initialize data segment
    MOV DS, AX

    MOV BX, 0AAAEH    ; Test value (replace with any value)
    MOV AX, 0         ; Clear AX (this will store the count of 1 bits)
    
    MOV CX, BX        ; Copy BX into CX (we will rotate CX to preserve BX)
    MOV DX, 16        ; Since BX is a 16-bit register, we need to check all 16 bits

COUNT_BITS:
    ROL CX, 1         ; Rotate CX left by 1 bit
    JC  BIT_IS_1      ; If Carry Flag is set, the rotated-out bit was 1
    JMP NEXT_ITER     ; Otherwise, continue to the next iteration

BIT_IS_1:
    INC AX            ; Increment AX to count this 1 bit

NEXT_ITER:
    DEC DX            ; Decrease the loop counter (DX)
    JNZ COUNT_BITS    ; If DX is not zero, repeat the loop

    ; BX remains unchanged because we used CX for rotation

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
