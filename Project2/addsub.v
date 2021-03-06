`timescale 1ns/100ps
`include "eightbit.v"
`include "invert.v"

module addsub(m, A, B, overflow, S);

	input m;
	input [7:0] A, B;
	output overflow;
	output [7:0] S;
	
	wire [7:0] flippedB;
	wire [1:0] cout;
	
	invert inv(m, B, flippedB);
	eightbit add(m, A, flippedB, S, cout);
	
	xor overflowcheck(overflow, cout[0], cout[1]);

endmodule