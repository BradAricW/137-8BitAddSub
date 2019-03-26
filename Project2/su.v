`timescale 1ns/100ps
module su(p, c, s);
	
	input [1:0] p, c;
	output [1:0] s;
	assign s = p^c;
	
endmodule