@ Write an assembly program that stores:
@ - Adds 2398 and 7341
@ - Multiplies the result by 15
@ - Stores the final answer in register r6

.global _start
_start:
	LDR r0, =NUM		@ Load address of NUM label
	LDR r1, [r0]		@ Load 2398 into r1
	LDR r2, [r0, #4]	@ Load 7341 into r2
	LDR r3, [r0, #8]	@ Load 15 into r3
	ADD r4, r1, r2		@ Calculate 2398 + 7341
	MUL r6, r3, r4		@ Calculate 15 * (2398 + 7341) (stored in r6)
.data
	NUM:	.word	2398, 7341, 15
