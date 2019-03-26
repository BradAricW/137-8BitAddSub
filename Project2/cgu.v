`timescale 1ns/100ps

module cgu(g, p, cin, cout);

	input [1:0] g, p;
	input cin;
	output [1:0] cout;
	
	assign cout[0] = g[0] | (p[0] & cin);
	
	wire x, y, z;
	nor n1(x, g[1], p[1]);
	nor n2(y, cin, g[0], g[1]);
	nor n3(z, g[0], g[1], p[0]);
	nor n4(cout[1], x, y, z);
	
endmodule