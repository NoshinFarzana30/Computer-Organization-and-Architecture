.MODEL SMALL
.STACK 100H  

.DATA
 
A DB "Enter two digit: $"  
B DB "Name: Noshin Farzana $"
C DB "ID: $"  
D DB "Dept: CS $"    
E DB "-$" 
linebreak DB 10,13, "$"
 


 
.CODE
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
       
      
    ; Display "Enter two digit: "
    MOV AH, 9
    LEA DX, A
    INT 21H    
    
   
   
    ; Read 1st digit [input]
    MOV AH,1
    INT 21H
    MOV BH, AL     ; Register BH for 1st digit
    
  
      
    ; Read 2nd digit [input]     
    MOV AH,1
    INT 21H
    MOV BL, AL    ; Register BL for 2nd digit
     
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
    
    
    ; Display "Name: Noshin Farzana "
    MOV AH, 9
    LEA DX, B
    INT 21H    
    
    
     ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
              
    ; Display "ID: "
    MOV AH, 9
    LEA DX, C
    INT 21H    
    
    ; Display 1st digit[output]
    MOV AH,2  
    MOV DL, BH    ; Register BH for 1st digit
    INT 21H  
    
     ; Display 1st digit[output]
    MOV AH,2  
    MOV DL, BH    ; Register BH for 1st digit
    INT 21H
           
    ; Display "-"
    MOV AH, 9
    LEA DX, E
    INT 21H     
    
    ; Display 2nd digit [output]
    MOV AH,2  
    MOV DL, BL    ; Register BL for 2nd digit
    INT 21H              
    
    ; Display 2nd digit [output]
    MOV AH,2  
    MOV DL, BL    ; Register BL for 2nd digit
    INT 21H
    
    ; Display 2nd digit [output]
    MOV AH,2  
    MOV DL, BL    ; Register BL for 2nd digit
    INT 21H
    
    ; Display 2nd digit [output]
    MOV AH,2  
    MOV DL, BL    ; Register BL for 2nd digit
    INT 21H  
    
    
    ; Display "-"
    MOV AH, 9
    LEA DX, E
    INT 21H  
      
      
     ; Display 1st digit[output]
    MOV AH,2  
    MOV DL, BH    ; Register BH for 1st digit
    INT 21H  
    
  
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
            
    
    ; Display "Dept:CS "
    MOV AH, 9
    LEA DX, D
    INT 21H    
    
    
    
    
    
        
    
    ; Exit program
    MOV AH, 4CH
    INT 21H 
    
    
MAIN ENDP
END MAIN

