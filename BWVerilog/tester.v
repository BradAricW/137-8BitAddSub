`include "cla.v"
module tester();
	reg [1:0]a, b; 
	reg cin;

	wire [1:0]s; 
	wire cout;

	cla cla1(a, b, cin, s, cout);

	initial begin
		$display("Time a  b cin cout s");
		$monitor("%4d %b %b", $time, cout, s);

		a = 2'b10; b = 2'b10; cin = 1'b0; $display("%4d %b %b %b %b", $time, a, b, cin, s);
		#1
		a = 2'b01; b = 2'b10; cin = 1'b1; $display("%4d %b %b %b %b", $time, a, b, cin, s);
		#1
		a = 2'b11; b = 2'b01; cin = 1'b0; $display("%4d %b %b %b %b", $time, a, b, cin, s);
		#1
		a = 2'b11; b = 2'b01; cin = 1'b0; $display("%4d %b %b %b %b", $time, a, b, cin, s);
		#1

		$finish;
	end
endmodule