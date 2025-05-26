.global lab03b

.section .data
UIN: .quad 26   

.section .text
lab03b:
    MOV X0, #10          // Initialize i to 10 
loop:
    CBZ X0, loop_end     // If i is 0, exit the loop
    LDR X1, =UIN         // Load the address of UIN into X1
    LDR X2, [X1]         // Load the value of UIN into X2
    SUB X2, X2, #1       // Decrement the value of UIN
    STR X2, [X1]         // Store the decremented value back to UIN
    SUB X0, X0, #1       // Decrement the loop counter i
    B loop               // Repeat the loop

loop_end:
    RET                  // Return from the function
