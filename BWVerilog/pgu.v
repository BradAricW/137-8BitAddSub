module pgu
(
	input a, b,
	output g, p
);

	xor x(p, a, b);
	and n(g, a, b);

endmodule