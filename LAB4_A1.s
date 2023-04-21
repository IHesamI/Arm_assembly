          PRESERVE8
          THUMB       

 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     ; stack pointer value when stack is empty
N EQU 10
primes SPACE 5
          DCD  START  ; reset vector
  
          ALIGN
 
          AREA    MYCODE, CODE, READONLY
 
			ENTRY
			EXPORT START

START
	LDR R10 ,=primes
	LDR R0,=N ; n the upper bound
	MOV R1,#4 ; R1 is the index and holder of numbers
loop
	CMP R1,R0
	BEQ done
	MOV R2,#2
	SDIV R3,R1,R2   ; R3 IS THE HALF OF NUMBER ; IT IS ENOUGH TO CHECK THE HALF FOR PRIME 
	
check_prime
	CMP R2,R3
	BGT add_to_prime_array
	SDIV R4,R1,R2
	MUL R5, R4,R2 ;  
	SUB R6,R1,R5 ; R0 IS REMINDER OF THE DIVISION 
	MOV R7,#0
	CMP R6,R7
	BEQ NOT_PRIME
	ADD R2,R2,#1
	B check_prime
	
NOT_PRIME
	ADD R1,R1,#1 ; R8 == 1 MEANS THE NUMBER IS PRIME 
	B loop

add_to_prime_array
	
	STR R1, [R10] ; Code for adding to array should be here 
	ADD R1,R1,#1
	ADD R10,R10,#4
	B loop


done    B       done


        ;primes  SPACE 100  ; reserve space for primes array
        END