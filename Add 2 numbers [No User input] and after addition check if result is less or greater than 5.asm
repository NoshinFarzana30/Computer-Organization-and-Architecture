.MODEL SMALL
.STACK 100H 

.DATA       
 greaterThan DB 10,13, "Addition is greater than 5 $"
 lessThan DB 10,13, "Addition is less than 5 $"
 equalTo DB 10,13, "Addition is equal to 5 $"

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
    
    ; Check if addition is greater than, less than, or equal to 5
   
    CMP BH, '5'
    JG GREATER_THAN
    JL LESS_THAN
    JE EQUAL_TO

GREATER_THAN:
    ; Display "Addition is greater than 5"
    MOV AH, 9
    LEA DX, greaterThan
    INT 21H 
    
    JMP EXIT

LESS_THAN:
    ; Display "Addition is less than 5"
    MOV AH, 9
    LEA DX, lessThan
    INT 21H  
    
    JMP EXIT

EQUAL_TO:
    ; Display "Addition is equal to 5"
    MOV AH, 9
    LEA DX, equalTo 
    
    INT 21H

EXIT: 
   

    ; Exit program
    MOV AH, 4CH
    INT 21H 
    
    
MAIN ENDP
END MAIN