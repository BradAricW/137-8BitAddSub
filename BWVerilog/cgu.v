module cgu
(
	input p0, p1, g0, g1, cin,
	output c0, c1
);

wire o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15;

//side1
nor n1(o1, g0, g0);

nor n2(o2, p0, p0);
nor n3(o3, cin, cin);
nor n4(o4, o2, o3);
nor n5(o5, o4, o4);

nor n6(c0, o1, o5);

//side2
nor n7(o6, g1, g1);

nor n8(o7, p1, p1);
nor n9(o8, g0, g0);
nor n10(o9, o7, o8);
nor n11(o10, o9, o9);

nor n12(o11, p1, p1);
nor n13(o12, p0, p0);
nor n14(o13, cin, cin);
nor n15(o14, o11, o12, o13);
nor n16(o15, o14, o14);

nor n17(c1, o6, o10, o15);

endmodule