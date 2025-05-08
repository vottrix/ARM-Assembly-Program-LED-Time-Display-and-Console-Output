@ CSCN71010 F24 Assembly - Slide 59
@
@ Write an assembly program that adds
@ the numbers 1 to 100

.global _start
_start:
	MOV r0, #1		@ Initialize index to 1
	MOV r1, #0		@ Initialize total to 0
loop:
	CMP r0, #100	@ Compare index to 100
	BGT end			@ Exit if index is greater than 100
	ADD r1, r0		@ Add index to sum
	ADD r0, #1		@ Increase index by 1
	BAL loop		@ Return to top of loop
end: