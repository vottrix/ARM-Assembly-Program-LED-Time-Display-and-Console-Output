@ CSCN71010 F24 Assembly - Slide 67
@
@ Write an assembly program with a function
@ that evaluates the mathematical expression
@ x^2 - 4xy + 2y^2 + 3, where x is stored in
@ r0, and y is stored in r1. The result should
@ be stored in r0 when the function returns

.global _start
_start:
	LDR r0, =NUM		@ Load address of NUM label
	LDR r1, [r0, #4]	@ Load y value to r1
	LDR r0, [r0]		@ Load x value to r0
	BL function			@ Call the function
	BAL end				@ End the program
function:
	@ Calculate each term in r3, add to total in r2
	MUL r2, r0, r0		@ Calculate x^2
	MOV r3, #-4			@ Store -4
	MUL r3, r0			@ Calculate -4x
	MUL r3, r1			@ Calculate -4xy
	ADD r2, r3			@ Add up x^2 - 4xy
	MOV r3, #2			@ Stores 2
	MUL r3, r1			@ Calculate 2y
	MUL r3, r1			@ Calculate 2y^2
	ADD r2, r3			@ Add up x^2 - 4xy + 2y^2 
	ADD r2, #3			@ Add up x^2 - 4xy + 2y^2 + 3
	BX lr				@ Return to where function was called
end:
.data
	NUM:	.word		3, 7 @ Change these numbers to set the initial values of x and y