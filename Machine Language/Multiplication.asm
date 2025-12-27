// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

    @R2
    M=0

(LOOP)
    // Check if R1 > 0, else jump to END
    @R1
    D=M
    @END
    D;JLE    // If R1 <= 0, we end

    // Add R0 to R2
    @R0
    D=M      // Get R0
    @R2
    M=D+M    // R2 = R2 + R0 (Directly add to memory)

    @R1
    M=M-1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP  
