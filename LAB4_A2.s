@reserved registers : r1 , r3 , r4 , r5 , r6 , r9
.text            
.global _start 
 _start:
@ main:
    ldr r1, =message
    
    ldr r3,=count_of_chars_array @ pointer to the counts array
    mov r4,r3 @ save the pointer for further changes

    ldr r5,=chars_array
    mov r6 , r5     @ save the pointer for further changes
	mov r7,#0

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
	b arrays_checker
        
 add:
	add r9, #32 @ the char in ascii form 
	strb r9,[r1]
	add r1, r1 ,#1
	b arrays_checker
	
arrays_checker:
 	@ check if char is in the array
	mov r8,#0 @ waht is this ?? => this is the counter of loop
	mov r4,r3 @ the counter_index
	mov r6,r5 @ the char
	 loop_through_chars:
	    cmp r8, r7 @ check which indexes of the array
	    beq not_in_the_array
	    ldrb r10, [r6] @ r12 holds the char
	    cmp r10,r9
	    beq change_count
	    add r6,r6,#1 
	    add r8,r8,#1 
	    b loop_through_chars
	@ check if the char is in the array
	not_in_the_array:
	  strb r9,[r6] @ save the char in the array
	
	  
	  add r4 ,r4, r8 @ move the pointer of counter array
	  mov r8,#1
	  
	  strb r8,[r4]	  
	  
	  add r7,r7,#1

	  b loop
	  
	 change_count:
		add r4,r4,r8
		ldrb r8,[r4]
		add r8,r8,#1
	 	strb r8,[r4]
	 	b loop


 print:
 
  mov r9,#10
  strb r9,[r1]
  add r1,r1, #1
  
  mov r8,#0 @set index for star loop
  mov r4 , r3 	@ r3,=count_of_chars_array 
  mov r6 , r5    @ r5,=chars_array
  mov r11,#0
  create_star_loop:
   add r11,r11, #4 
   ldrb r9 , [r6]
   strb r9 , [r1]
   add r1,r1, #1

   mov r9,#58
   strb r9 , [r1]
   add r1,r1, #1

   mov r9,#32
   strb r9 , [r1]
   add r1,r1, #1
  	
  ldrb r2,[r4]
  mov r3,#0
  starloop:
   cmp r3,r2
   beq exit_starloop
   mov r9,#42
   strb r9 , [r1]
   add r1,r1, #1
   add r3,r3, #1
   add r11,r11,#1
   b starloop


exit_starloop:
   mov r9,#10
   strb r9 , [r1]
   add r1,r1,#1
   add r11,r11,#1
   add r4,r4,#1
   add r6,r6,#1
   add r8,r8,#1
   cmp r8,r7
   beq printer_
   b create_star_loop
   
  
printer_:
  ldr r1, =message
  ldr r2, =len  
  add r2,r2,r11
  mov r7, #4
  svc 0
 
 mov r7, #1
 svc 0


.data
    count_of_chars_array: .word 0,0,0,0,0,0
    
    chars_array: .word 0,0,0,0,0,0

message:
    .asciz "HELLOWORLD" 
    len = .-message 
    
    