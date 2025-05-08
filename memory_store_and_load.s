@ CSCN71010 F24 Assembly - Slide 22
@
@ Use the MOV, LDR, and STR instructions to perform
@ the following operations:
@ 1. Write the number 13 to register r0
@ 2. Store the contents of r0 to memory address 0x000000fc
@ 3. Load the contents of memory address 0x000000fc to r4

.global _start
_start:
	MOV r0, #13
	MOV r1, #0x000000fc		@ Address needs to be stored in a register
	STR r0, [r1]
	LDR r4, [r1]