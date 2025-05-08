@ CSCN71010 F24 Assembly - Slide 27
@
@ Write an assembly program that stores:
@ - Stores the number 35 in byte address 0x00001001
@ - Stores the number 2530 in byte address 0x00001002
@ - Reads the full word at address 0x00001000 into r0

.global _start
_start:
	MOV r0, #35				@ Load number 35
	MOV r1, #0x00001000		@ Base address for all memory operations
	STRB r0, [r1, #1]		@ Must use STRB since we are only writing one byte
	MOV r0, #2530			@ Load number 2530
	STRH r0, [r1, #2]		@ Must use STRH since we are only writing half word
	LDR r0, [r1]			@ Load full word from memory