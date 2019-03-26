`timescale 1ns/100ps
module flipflop(clock, reset, e, d, q);

	input clock, reset, e;
	input [7:0] d;
	output reg q;
	
	always@(posedge clock, posedge reset)
	
	begin
	
	if(e == 1'b1)
		begin
			if(reset == 1'b1)
				q=0;
			else
				q=d;
		end
	end
endmodule