    .text            
.global _start
_start:

    ldr r1, =message
    @b print

    ldr r3,=count_of_chars_array @ pointer to the counts array
    mov r0,r3
    mov r5,#0 @ index of counts the array
    
    
    ldr r4,=chars_array @ pointer to the chars array
    mov r11,r4
    mov r6,#0 @ index of the chars array

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
	add r9, #32 @ the char in ascii form 
	strb r9,[r1]
	
	@ check if char is in the array
	mov r8,#0
	mov r3,r0
	mov r11,r4
	 loop_through_chars:

	    cmp r8, r6
	    beq not_in_the_array
	    ldrb r12, [r11] @ r12 holds the char
	    cmp r12,r9
	    beq change_count
	    add r11,r11,#1 
	    add r8,r8,#1 
	    b loop_through_chars
	@ check if the char is in the array
	not_in_the_array:

	  strb r9,[r11] @ save the char in the array
	
	  add r3 ,r3, r8 @ move the pointer of counter array
	  
	  mov r8,#1
	  
	  strb r8,[r3]
	  
	  add r6,r6,#1

	  b skip
	  
	 change_count:
	 add r3,r3,r8
	 ldrb r7,[r3]
	 add r7,r7,#1
	 strb r7,[r3]
	 b skip
	 
	
	 
	

 print:
  mov r9,#10
  strb r9,[r1]
  
  ldr r1, =message
  ldr r2, =len
  add r2,r2,#1
  mov r7, #4
  swi 0
 
 mov r7, #1
 swi 0


.data
message:
    .asciz "HeLLOWORLD" 
    len = .-message 
    count_of_chars_array: .word 0,0,0,0,0,0
    chars_array: .word 0,0,0,0,0,0
    
    
    