@ CSCN71010 F24 Assembly - Slide 73
@
@ Write an assembly program with a function
@ that adds all the numbers from 1 to n, where
@ n is the value stored in r0. The result
@ should be stored in r0 when the function ends

.global _start
_start:
	LDR r0, =NUM		@ Load address of NUM label
	LDR r0, [r0]		@ Load initial value
	BL factorial		@ Call the function
	BAL end				@ End the program
factorial:
	CMP r0, #1			@ Compare value to 1
	BLE one				@ Branch if value is less than 1
	MOV r1, r0			@ Copy value to register r1
	SUB r0, #1			@ Decrease value by one for recursive call
	PUSH {r1, lr}		@ Push registers to stack
	BL factorial		@ Recursive call
	POP {r1, lr}		@ Restore registers from stack
	MUL r0, r1			@ Multiply recursive result times original value
	BX lr				@ Return function
one:
	MOV r0, #1			@ Set return value to 1 if input is 1 or less
	BX lr				@ Return function
end:
.data
	NUM:	.word		5 @ Change this number to set the initial value