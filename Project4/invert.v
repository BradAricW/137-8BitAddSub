`timescale 1ns/100ps
module invert(m, B, flippedB);

	input m;
	input [7:0] B;
	output reg [7:0] flippedB;
	
	always@(*)
	
	if(m == 1'b1)
		begin
			flippedB[0] = ~B[0];
			flippedB[1] = ~B[1];
			flippedB[2] = ~B[2];
			flippedB[3] = ~B[3];
			flippedB[4] = ~B[4];
			flippedB[5] = ~B[5];
			flippedB[6] = ~B[6];
			flippedB[7] = ~B[7];
		end
	
	else
		begin
			flippedB = B;
		end
		
endmodule