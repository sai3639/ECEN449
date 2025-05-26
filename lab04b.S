.globl factorial

// Function: factorial
// Computes the factorial of a number n.
// Uses recursion and the my_mul function for multiplication.
factorial:
	SUB SP, SP, 0x10 // for da stack
	STUR LR, [SP,0x8] 
	STUR X0, [SP,0x0] // save n

	CBNZ X0, comp // if n != 0, go to comp
	ORR X0, XZR, 0x1 // if = 0, return 1
	ADD SP, SP, 0x10 // pop 2 items from stack
	BR X30 // branch back

comp:
	SUB X0, X0, 0x1 // n -= 1
	BL factorial // f(n-1,k+1)
	
	LDUR X1, [SP, 0x0]
	BL my_mul // call my_mul m = my_mul(m,n)
	LDUR X30, [SP, 0x8]
	ADD SP, SP, 0x10 // pop it back after bl jumps
	BR X30
