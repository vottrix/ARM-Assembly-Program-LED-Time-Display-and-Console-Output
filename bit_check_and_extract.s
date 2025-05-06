@ Write an assembly program that writes
@ the number 1 to register r4 if the 5th
@ least significant bit of register r1 is 1

.global _start
_start:
	MOV r1, #17			@ Change this number to test program
	MOV r0, #1			@ Write digit 1 to r0
	LSL r0, r0, #4		@ Shift r0 left to create 0b10000
	AND r4, r0, r1		@ Logical and r0 and r1
	LSR r4, #4			@ Logical shift right by 4
	@ If r1 did contain a 1 in the 5th digit, the AND operation
	@ outputs 0b10000. The logical shift right turns that into 1