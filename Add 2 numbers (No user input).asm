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
    MOV BH, 1  ; number = 1
    MOV BL, 2  ; number = 2
    
    ; Add numbers 1 and 2
    ADD BH, BL
    
    ; Convert result to ASCII
    ADD BH, 30H     ; user input neini... tai ADD BH, 30H etai hobe always addition ba subtraction jai kori]
                     
                    ; user input nile tokhon sir er motoi hobe ascii te newar jonno
                    
    ; Show addition [output]
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
