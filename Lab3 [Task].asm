.MODEL SMALL
.STACK 100H 

.DATA 
A DB "Options: $" 
B DB "1. Name $"
C DB "2. Department $"  
D DB "3. Semester $"    
E DB "4. ID $" 
F DB "5. CGPA $" 
G DB "Enter your choice: $" 
M DB "Invalid choice $" 

U DB "Your Name: Noshin Farzana $"
V DB "Your Department: CS $"  
W DB "Your Semester: 11th $"    
X DB "Your ID: 21-44647-1 $" 
Y DB "Your CGPA: 3.98 $" 
 
linebreak DB 10,13, "$"
    
.CODE
 MAIN PROC  
 
    MOV AX, @DATA  
    MOV DS, AX  
      
    ; Display "Options: "
    MOV AH, 9
    LEA DX, A
    INT 21H
       
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
       
    ; Display "1. Name "
    MOV AH, 9
    LEA DX, B
    INT 21H 
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
      
      
    ; Display "2. Department "
    MOV AH, 9
    LEA DX, C
    INT 21H
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
      
    ; Display "3. Semester "
    MOV AH, 9
    LEA DX, D
    INT 21H
      
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
    
       
    ; Display "4. ID "
    MOV AH, 9
    LEA DX, E
    INT 21H
      
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
    
    ; Display "5. CGPA  "
    MOV AH, 9
    LEA DX, F
    INT 21H   
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
     
     
    ; Display "Enter your choice:  "
    MOV AH, 9
    LEA DX, G
    INT 21H  
       
    ; Read/Take 1 digit input [input]
    MOV AH, 1
    INT 21H
    MOV BL,AL ;Store input in BL  
     
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H
    
    CMP BL,31H ;user pressed 1, jump to MYNAME label (AFTER ADDING 30)
    JE MYNAME    
    
    CMP BL,32H ;user pressed 2, jump to MYDEPARTMENT label (AFTER ADDING 30)
    JE MYDEPARTMENT 
    
    CMP BL,33H ;user pressed 3, jump to MYSEMESTER label (AFTER ADDING 30)
    JE MYSEMESTER   
    
    CMP BL,34H ;user pressed 4, jump to MYID label (AFTER ADDING 30)
    JE MYID   
    
    CMP BL,35H ;user pressed 5, jump to CGPA label (AFTER ADDING 30)
    JE MYCGPA   
    
    JMP INVALID ; if user press other value, except 1/2/3/4/5 go to INVALID label
    
    ; Line Break
    MOV AH, 9
    LEA DX, linebreak
    INT 21H 
       
    
    MYNAME:
     ;Display "Your Name: Noshin Farzana "
    MOV AH,9
    LEA DX,U
    INT 21H
    
    JMP EXIT
      
      
    
    MYDEPARTMENT: 
     ;Display "Your Department: CS "
    MOV AH,9
    LEA DX,V 
    INT 21H
    
    JMP EXIT
       
       
    
    MYSEMESTER: 
     ;Display "Your Semester: 11th "
    MOV AH,9
    LEA DX,W
    INT 21H
    
    JMP EXIT
       
       
    
    MYID:  
     ;Display "Your ID: 21-44647-1 "
    MOV AH,9
    LEA DX,X
    INT 21H
    
    JMP EXIT
      
      
  
    MYCGPA:
      ;Display "Your CGPA: 3.98 "
    MOV AH,9
    LEA DX,Y
    INT 21H
    
    JMP EXIT
        
        
        
             
    INVALID: 
     ; Display "Invalid Choice "
    MOV AH, 9
    LEA DX, M
    INT 21H  
    
   
      
       
    EXIT:
    ; Exit program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN