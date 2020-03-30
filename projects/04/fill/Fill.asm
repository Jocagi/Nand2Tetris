// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INFINITO)

//Validar que ninguna tecla está presionada
@KBD
D=M

@BLANCO
D;JEQ

@NEGRO
0;JMP

(BLANCO)
@R0
M=0
@PANTALLA
0;JMP

(NEGRO)
@R0
M=-1
@PANTALLA
0;JMP

(PANTALLA)
//Se guarda contador en R1
@8191
D=A
@R1
M=D

(MOSTRAR)
//Calcular posicion
@16384
D=A
@R1
D=D+M

//Se guarda posicion a escribir en R2
@R2
M=D

//Asignar valor a posicion
@R0
D=M

@R2
A=M
M=D

//Decrementa el contador
@R1
D=M-1
M=D

@MOSTRAR
D;JGE

@INFINITO
0;JMP
