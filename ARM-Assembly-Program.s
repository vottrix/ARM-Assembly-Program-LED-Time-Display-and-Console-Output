.arch armv7ve
.global _start
_start:
	@ Write to LEDs
	LDR r0, =leds			@ Load LEDs hard-coded value
	LDR r1, =leds_add		@ and LED memory address
	LDR r2, [r0]
	LDR r3, [r1]
	STR r2, [r3] 			@ Store hard-coded value
	
	@ Get current time
	MOV r0, #0x11			@ Set SYS_TIME parameter
	SVC 0x123456 			@ Execute system call
	
	@ Convert hex to decimal
	MOV r1, #10				@ Constant 10 for division
	UDIV r2, r0, r1			@ To get each digit, divide by 10
	MUL r3, r2, r1			@ Multiply result by ten (gets rid of units digit)
	SUB r3, r0, r3			@ subtract to find difference (the digit we want)
	MOV r0, r2				@ Repeat for each digit
	UDIV r2, r0, r1
	MUL r4, r2, r1			@ Digit 1 stored in r3
	SUB r4, r0, r4			@ Digit 2 stored in r4
	MOV r0, r2				@ Digit 3 stored in r5
	UDIV r2, r0, r1			@ Digit 4 stored in r6
	MUL r5, r2, r1			@ Digit 5 stored in r7
	SUB r5, r0, r5			@ Digit 6 stored in r8
	MOV r0, r2
	UDIV r2, r0, r1
	MUL r6, r2, r1
	SUB r6, r0, r6
	MOV r0, r2
	UDIV r2, r0, r1
	MUL r7, r2, r1
	SUB r7, r0, r7
	MOV r0, r2
	UDIV r2, r0, r1
	MUL r8, r2, r1
	SUB r8, r0, r8
	
	@ Write number to 7-segment
	LDR r0, =seven_num		@ Load address of array containing bytecodes for each digit
	LDRB r2, [r0, r3]		@ Use each digit as an offset to load the corresponding byte
	LDRB r1, [r0, r4]
	LSL r1, #8				@ Use logical shift to put each byte in the correct position
	ADD r2, r1				@ Combine bytes using addition (or also works)
	LDRB r1, [r0, r5]		@ Continue for all digits
	LSL r1, #16
	ADD r2, r1
	LDRB r1, [r0, r6]
	LSL r1, #24
	ADD r2, r1
	LDR r0, =seven_add		@ Load memory address of seven-segment display
	LDR r1, [r0]
	STR r2, [r1]			@ First four digit stored in first address
	LDR r0, =seven_num
	LDRB r2, [r0, r7]
	LDRB r1, [r0, r8]
	LSL r1, #8
	ADD r2, r1
	LDR r0, =seven_add
	LDR r1, [r0]
	STR r2, [r1, #16]		@ Last two digits stored in second address
	
	@ Write exit message to console
	MOV r0, #0x5			@ Set SYS_WRITE parameter
	LDR r1, =exit_space		@ Load address of message buffer
	LDR r2, =exit_string	@ Load exit message address
	STR r2, [r1, #4]		@ Store text location in message buffer
	MOV r2, #16
	STR r2, [r1, #8]		@ Store length of text in message buffer
	SVC 0x123456			@ Execute system call
	
	@ Exit program
	LDR r0, =exit_code		@ Load exit code	
	LDR r1, [r0]
	MOV r0, #0x18			@ Set exti parameter
	SVC 0x123456			@ Execute system call
.data
	@ Hard-coded value for alternating LED pattern
	leds:			.word		0x2aa
	@ Memory address of LED I/O
	leds_add:		.word		0xff200000
	@ Memory address of seven-segment displey I/O
	seven_add:		.word		0xff200020
	@ Array of bytecodes for each decimal digit (0,1, 2, ..., 9)
	seven_num:		.byte		0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f, 0x0, 0x0
	@ Reason code for program exit
	exit_code:		.word		0x20026
	@ Message buffer for console message
	exit_space:		.space		12, 0
	@ Console message
	exit_string:	.string		"Program finished"
	