`timescale 1ns/100ps
`include "cla.v"

module eightbit(cin, A, B, S, cout);

	input cin;
	input [7:0] A, B;
	output [7:0] S;
	output [1:0] cout;
	
	wire c1, c2;
	
	cla cla1(cin, A[1:0], B[1:0], S[1:0], c1);
	cla cla2(c1, A[3:2], B[3:2], S[3:2], c2);
	cla cla3(c2, A[5:4], B[5:4], S[5:4], cout[0]);
	cla cla4(cout[0], A[7:6], B[7:6], S[7:6], cout[1]);
	
endmodule