// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(RESTART)
    @SCREEN
    D=A
    @address
    M=D             // address = 16384 (base address of screen)

(KBDCHECK)
    @KBD
    D=M             // D = current keyboard value
    @SETBLACK
    D;JGT           // If KBD > 0, jump to BLACK

    @color
    M=0             // Else, color = white (0 in binary)
    @FILL
    0;JMP           // Jump to the filling logic

(SETBLACK)
    @color
    M=-1            // color = black (-1 is 1111111111111111 in binary)

(FILL)
    @color
    D=M             // Load the chosen color (0 or -1)
    @address
    A=M             // Set A to the current screen word address
    M=D             // Paint 16 pixels the chosen color

    @address
    M=M+1           // Move to the next 16-pixel word
    D=M

    @KBD
    D=D-A           // Check if we reached the Keyboard address (end of screen)
    @FILL
    D;JLT           // If address < 24576, keep filling

    @RESTART
    0;JMP           // Otherwise, go back to the top to check KBD again
