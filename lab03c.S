.global lab03c

.section .data
my_array: .space 80   // Reserve space for 10 quad words (8 bytes each)

.section .text
lab03c:
    MOV X0, #10          // Counter for the loop, set to 10
    LDR X1, =1          //Load the 1 into X1
    LDR X2, =my_array    // Load the base address of my_array into X2

loop:
    CBZ X0, loop_end     // If counter is 0, exit the loop

    STR X1, [X2], #8     // Store the value from X1 (j) into my_array[i] and increment X2 by 8 bytes
    ADD X1, X1, #1       // Increment the value of j
    SUB X0, X0, #1       //Decrement the loop counter

    B loop              // Repeat the loop

loop_end:
    RET                  // Return from the function
