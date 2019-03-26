`timescale 1ns/100ps
module pgu(a, b, p, g);

	input [1:0] a, b;
	output [1:0] p, g;
	
	xor x1(p[0], a[0], b[0]);
	xor x2(p[1], a[1], b[1]);
	and a1(p[1], a[1], b[1]);
	and a2(p[0], a[0], b[0]);
	
endmodule