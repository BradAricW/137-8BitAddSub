`include "pgu.v"
`include "cgu.v"
`include "su.v"

module cla
(
	input [1:0]a, b, 
	input cin,
	output [1:0]s, 
	output cout
);

	wire p0, p1, g0, g1, c0, c1;

	pgu pu0(a[0], b[0], g0, p0);
	pgu pu1(a[1], b[1], g1, p1);

	cgu cu(p0, p1, g0, g1, cin, c0, c1);

	su su0(cin, p0, s[0]);
	su su1(c0, p1, s[1]);
	
endmodule