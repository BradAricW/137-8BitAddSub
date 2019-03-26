`timescale 1ns/100ps

`include "control.v"
`include "data.v"

module circ(clock, reset, start, mode, A, B, C, D, res, done);

	input clock, reset, start, mode;
	input [7:0] A, B, C, D;
	output [7:0] res;
	output done;
	
	wire [4:0] e;
	
	control cu(clock, reset, start, mode, done, e);
	data d(clock, reset, A, B, C, D, e, res);
endmodule