@ CSCN71010 F24 Assembly - Slide 56
@
@ Suppose that register r6 contains a
@ person's year of birth, and register
@ r7 contains their height in centimetres.
@ We will use a different number based on
@ the person's age in 2024:
@ - If the age is less than 19, use 3
@ - If the age is between 19 and 30, use 4
@ - If the age is greater than 30, use 5
@ Multiply this chosen number times the 
@ height of the person, and store the 
@ result in register r8

.global _start
_start:
	LDR r0, =DATA	@ Load address of DATA label
	LDR r6, [r0]	@ Load year of birth into r6
	LDR r7, [r0, #4]	@ Load height into r7
	LDR r1, [r0, #8]
	SUB r1, r6
	CMP r1, #19
	BLT less
	CMP r1, #30
	BLE between
	BAL greater
less:
	MOV r1, #3
	BAL multiply
between:
	MOV r1, #4
	BAL multiply
greater:
	MOV r1, #5
multiply:
	MUL r8, r7, r1
.data
	DATA:	.word	1998, 173, 2024 @ Change these numbers to test program