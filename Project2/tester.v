`timescale 1ns/100ps
`include "addsub.v"

module tester();

	reg m;
	reg [7:0] A, B;
	wire [7:0] S;
	
	addsub go(m, A, B, overflow, S);
	
	initial begin
		
		$display("Time 	A    	  B	   m  overflow		S");
		$monitor("%4d						%b		%8b", $time, overflow, S);
		
		A = 8'hFF; B = 8'h01; m = 1'b0;
		$display("%4d %8b %8b %b	%b		%8b", $time, A, B, m, overflow, S);
		#25
		
		A = 8'h7F; B = 8'h01; m = 1'b0;
		$display("%4d %8b %8b %b	%b		%8b", $time, A, B, m, overflow, S);
		#25
		
		A = 8'hFF; B = 8'hFF; m = 1'b0;
		$display("%4d %8b %8b %b	%b		%8b", $time, A, B, m, overflow, S);
		#25
		
		A = 8'h55; B = 8'hAA; m = 1'b0;
		$display("%4d %8b %8b %b	%b		%8b", $time, A, B, m, overflow, S);
		#25
		
		A = 8'h80; B = 8'h01; m = 1'b1;
		$display("%4d %8b %8b %b	%b		%8b", $time, A, B, m, overflow, S);
		#25
		
		A = 8'h6C; B = 8'hCA; m = 1'b1;
		$display("%4d %8b %8b %b	%b		%8b", $time, A, B, m, overflow, S);
		#25
		
		#25 $finish;
		
	end
endmodule