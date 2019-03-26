`timescale 1ns/100ps
`include "circ.v"

module test();

	reg clock, reset, start, mode;
	reg [7:0] A, B, C, D;
	
	wire done;
	wire [7:0] res;
	
	circ sc(clock, reset, start, mode, A, B, C, D, res, done);
	
	initial begin
	
		$display("Time A        B        C        D        m result");
		$monitor("%4d: 			done = %b", $time, done);
		clock = 0;
		reset = 1;
		start = 0;
		#10 reset = 0;
		
	end
	
	always
	begin
		#5 clock = ~clock;
	end
	
	initial begin
		$display("Test Case 1");
		A = 8'h01; B = 8'h02; C = 8'hFF; D = 8'hFE; mode = 1'b0;
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		#10 start = 1;
		#20 start = 0;
		#100
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		$display("End Test Case 1");
		
		$display("Test Case 2");
		A = 8'hFE; B = 8'h01; C = 8'h01; D = 8'h04; mode = 1'b1;
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		#10 start = 1;
		#20 start = 0;
		#100
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		$display("End Test Case 2");

		$display("Test Case 3");
		A = 8'h01; B = 8'hFF; C = 8'hFF; D = 8'hFF; mode = 1'b0;
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		#10 start = 1;
		#20 start = 0;
		#100
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		$display("End Test Case 3");

		$display("Test Case 4");
		A = 8'hFF; B = 8'h01; C = 8'hFF; D = 8'h01; mode = 1'b1;
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		#10 start = 1;
		#20 start = 0;
		#100
		$display("%4d %8b %8b %8b %8b %b %8b", $time, A, B, C, D, mode, res);
		$display("End Test Case 4");

		#10 $finish;
		
	end
endmodule