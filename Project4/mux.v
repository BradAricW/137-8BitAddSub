`timescale 1ns/100ps

module mux(in1, in2, e, R);

	input [7:0] in1, in2;
	input e;
	output reg [7:0] R;
	
	always@(*)
	begin
	
		if (e == 1'b0)
			R = in1;
		else
			R = in2;
	end
endmodule