@ CSCN71010 F24 Assembly - Slide 26
@
@ Write an assembly program that stores:
@ - the number 19900101 in register r1
@ - the number 20000725 in register r2
@ - the number 20240903 in register r3
@ - the number 20991231 in register r4

.global _start
_start:
	@ MOV command cannot be used since the numbers are too big
	@ Data section needs to be used instead
	LDR r0, =NUM		@ Load address of NUM label
	LDR r1, [r0]		@ Load first number under NUM label
	LDR r2, [r0, #4]	@ Load second number under NUM label
	LDR r3, [r0, #8]	@ Load third number under NUM label
	LDR r4, [r0, #12]	@ Load fourth number under NUM label
.data
	NUM:	.word	19900101, 20000725, 20240903, 20991231