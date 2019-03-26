`include "addsub.v"
`include "mux.v"
`include "flipflop.v"
`timescale 1ns/100ps

module data (clock, reset, A, B, C, D, e, R);
	input clock, reset;
	input [7:0] A, B, C, D;
	input [4:0] e; //[ec, ebd, ea, e, emode]
	output [7:0] R;
	
	wire [7:0] recurs, toReg, fromReg, toAdd, toMux;
	
	mux m1(A, recurs, e[2], toReg);
	flipflop ff(clock, reset, e[1], toReg, fromReg);
	mux m2(B, D, e[3], toMux);
	mux m3(toMux, C, e[4], toAdd);
	addsub adder(e[0], fromReg, toAdd, recurs);
	
	assign R = toAdd;
endmodule