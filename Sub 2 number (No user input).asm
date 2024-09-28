.MODEL SMALL
.STACK 100H 

.DATA     
    ; No data needed as numbers are directly loaded into registers

.CODE
 
MAIN PROC  
    ; Initialize data segment
    MOV AX, @DATA  
    MOV DS, AX  
    
    ; Load numbers into registers
    MOV BH, 3 
    MOV BL, 1
    
    ; Sub numbers 3-1
    SUB BH, BL
    
    ; Convert result to ASCII [ user input neini... tai ADD BH, 30H etai hobe always addition ba subtraction jai kori
    ADD BH, 30H
    
    ; Show output
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
