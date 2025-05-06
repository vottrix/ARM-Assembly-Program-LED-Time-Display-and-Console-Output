@ Write an assembly program that reads
@ the number stored in r0 and then:
@ - Multiplies by 3, then adds 1 if r0 is odd, or
@ - Divides by 2 if r0 is even
@ The program should then repeat the process
@ until the number in r0 is 1

.global _start
_start:
	LDR r0, =NUM		@ Load address of NUM label
	LDR r0, [r0]		@ Load initial number to r0
	MOV r1, #3			@ Constant for multiplication
loop:
	CMP r0, #1			@ Check if r0 is 1
	BEQ end				@ Exit if r0 is 1
	ANDS r2, r0, #1		@ Logical AND to find if r0 is even
	@ Logical AND with 1 will return 0 if numbr is even, and
	@ 1 otherwise. Can also check for parity using division
	BEQ even			@ Branch if r0 is even
	MUL r0, r1			@ Multiply by 3
	ADD r0, #1			@ Add 1
	BAL loop			@ Return to top of loop
even:
	LSR r0, #1			@ Divide even number by 2
	BAL loop			@ Return to top of loop
end:
.data
	NUM:	.word		33 @ Change this number to set the initial value