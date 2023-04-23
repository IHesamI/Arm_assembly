.text            
.global _start
_start:

    ldr r1, =message
    @b print
 loop:
    ldrb r9, [r1]		 
	cmp r9, #0		@check for the null character
	beq print

	cmp r9, #32		@check for spaces & 	skip	
	beq skip	
	cmp r9, #91
	blt add

 skip:
	add r1, r1, #1
	b loop
        
 add:
	add r9, #32
	strb r9, [r1]
	b skip
	



 print:

  ldr r1, =message
  ldr r2, =len
  mov r7, #4
  swi 0
 
 mov r7, #1
 swi 0


.data
message:
    .asciz "HeLLOWORLD" 
    len = .-message 
    
