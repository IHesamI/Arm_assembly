          PRESERVE8
          THUMB       
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 

	  DCD  0x20001000 
      DCD  Reset_Handler  ; reset vector
      ALIGN
 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

   	  MOV R0, #12
	  mov R1, #0xA
 
STOP  
	  ADD R0, R0, #4
   	  B  STOP
 
          END	;End of the program