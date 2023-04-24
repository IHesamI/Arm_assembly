.text            
.global _start
_start:


create_star_loop:
 ldr r1, =message

   mov r9,#65
   strb r9 , [r1]
   add r1,r1, #1

   mov r9,#58
   strb r9 , [r1]
   add r1,r1, #1

   mov r9,#32
   strb r9 , [r1]
   add r1,r1, #1
	
  mov r2,#2
  mov r3,#0
  starloop:
   cmp r3,r2
   beq exit_starloop
   mov r9,#42
   strb r9 , [r1]
   add r1,r1, #1
   add r3,r3, #1
   b starloop


exit_starloop:
   mov r9,#10
   strb r9 , [r1]

  ldr r1, =message
  mov r2, r3
  add r2,r2 ,#4
  mov r7, #4
  swi 0

reset_message:
   ldr r1, =message
   mov r9,#1
   strb r9 , [r1]
   mov r3,#0
  clear_message:
   cmp r3,r2
   beq test
   mov r9,#1
   strb r9 , [r1]
   add r1,r1, #1
   add r3,r3, #1
   b clear_message
test:
  ldr r1, =message
  mov r7, #4
  swi 0
  
  mov r7, #1
  swi 0


.data
message:
    .asciz " " 
new_line : .asciz "\n"
    len = .-new_line 

    

