@ Write an assembly program that evaluates
@ the expression x + y * z, where
@ - x is 0x1E7612A23
@ - y is 0x26E0EF
@ - z is 0x40BF3B5
@ Store the result in register r5 (least significant
@ digits) and r6 (most significant digits)

.global _start
_start:
	LDR r0, =NUM			@ Load address of NUM label
	LDR r1, [r0]			@ Load lower half of x into r1
	LDR r2, [r0, #4]		@ Load upper half of x into r2
	LDR r3, [r0, #8]		@ Load y into r3
	LDR r4, [r0, #12]		@ Load z into r4
	UMULL r5, r6, r3, r4 	@ Multiply y * z (must use UMULL for 64 bit operation)
	ADDS r5, r5, r1			@ Add least significant digits of x and y * z (with status)
	ADC r6, r6, r2			@ Add most significant digits of x and y * z (with carry)
.data
	NUM:	.word	0xE7612A23, 0x00000001, 0x26E0EF, 0x40BF3B5
	@Note that x was split into two words, least significant bits first