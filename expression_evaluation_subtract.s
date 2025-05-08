@ CSCN71010 F24 Assembly - Slide 39
@
@ Write an assembly program that evaluates
@ the expression x - (y + z) * w, where
@ - x is 684
@ - y is 34
@ - z is 97
@ - w is 23
@ Store the result in register r10

.global _start
_start:
	LDR r0, =NUM		@ Load address of NUM label
	LDR r1, [r0]		@ Load x = 684 into r1
	LDR r2, [r0, #4]	@ Load y = 34 into r2
	LDR r3, [r0, #8]	@ Load z = 97 into r3
	LDR r4, [r0, #12]	@ Load w = 23 into r4
	ADD r5, r2, r3		@ Calculate y + z
	MUL r6, r5, r4		@ Calculate (y + z) * w
	SUB r10, r1, r6		@ Calculate x - (y + z) * w (stored in r10)
.data
	NUM:	.word	684, 34, 97, 23