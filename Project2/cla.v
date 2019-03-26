`timescale 1ns/100ps
`include "su.v"
`include "cgu.v"
`include "pgu.v"

module cla(cin, a, b, s, cout);

	input cin;
	input [1:0] a, b;
	output [1:0] s;
	output cout;
	
	wire [1:0] p, g;
	pgu pgu1(a, b, p, g);
	
	wire [1:0] c;
	assign cout= c;
	cgu cgu1(g, p, cin, c);
	
	su su1(p, {c[0], cin}, s);
	
endmodule