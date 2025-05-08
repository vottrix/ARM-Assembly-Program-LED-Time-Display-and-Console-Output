@ CSCN71010 F24 Assembly - Slide 68
@
@ Write an assembly program with a function
@ that adds all the numbers from 1 to n, where
@ n is the value stored in r0. The result
@ should be stored in r0 when the function ends

.global _start
_start:
	LDR r0, =NUM		@ Load address of NUM label
	LDR r0, [r0]		@ Load initial value
	BL function			@ Call the function
	BAL end				@ End the program
function:
	MOV r1, r0			@ Copy initial value to index r1
	MOV r0, #0			@ Initialize r0 to zero
loop:
	CMP r1, #0			@ Compare index to 0
	BXEQ lr				@ If index is zero, return
	ADD r0, r1			@ Add index to sum in r0
	SUB r1, #1			@ Decrease index by 1
	BAL loop			@ Branch to top of loop
end:
.data
	NUM:	.word		5 @ Change this number to set the initial value