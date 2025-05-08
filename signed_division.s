@ CSCN71010 F24 Assembly - Slide 44
@
@ Write an assembly program that divides
@ 12 by -3 and stores the result in r2

.arch armv7ve	@ This directive must be included to use SDIV
.global _start
_start:
	MOV r0, #12			@ Load 12 into r0
	MOV r1, #-3			@ Load -3 into r1
	SDIV r2, r0, r1		@ Signed division 12 / (-3)