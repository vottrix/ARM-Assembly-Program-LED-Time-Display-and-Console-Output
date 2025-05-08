@ CSCN71010 F24 Assembly - Slide 55
@
@ Write an assembly program that writes
@ the number 1 to r7 if r1 contains a 
@ number greater than 12, and otherwise
@ writes the number 2 to r7

.global _start
_start:
	MOV r1, #17		@ Change this number to test program
	MOV r7, #0		@ Clear r7
	CMP r1, #12		@ Compare r1 to 12
	BGT greater		@ Branch if r1 is greater than 12
	MOV r7, #1		@ If not greater, write 1 to r7
greater:
	ADD r7, #1		@ Add 1 to r7
	@ If branching did happen, the command in line 14 is
	@ skipped, so r7 only contains 1. Otherwise, it will
	@ contain 2