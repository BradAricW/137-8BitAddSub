`timescale 1ns/100ps
module control(clock, reset, start, mode, done, e);

	input clock, reset, start, mode;
	output reg done;
	output reg [4:0] e;
	
	parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	reg [1:0] nxt, curr;
	
	always@(*)
	begin
		casex(curr)
		A: if(start==1)
				begin
					nxt=B;
					e = 5'bxx01x;
					done=0;
				end 
			else
				begin
					nxt=A;
					e = 5'bxxx0x;
					done=0;
				end
		
		B: 	begin
				nxt=C;
				e = 5'b00010;
				done=0;
			end
		
		C: 	begin
				nxt=D;
				e = 5'b1x110;
				done=0;
			end
		
		D: if(mode==1)
				begin
					nxt=A;
					e = 5'b01111;
					done=1;
				end 
			else
				begin
					nxt=A;
					e = 5'b01110;
					done=1;
				end
		
		default: begin
					nxt = 2'bxx;
					e = 5'bxxxxx;
					done = 1'bx;
				end
				
		endcase
	end

	always@(posedge clock, posedge reset)
	begin
		if(reset==1)
			curr <= A;
		else
			curr <= nxt;
	end
endmodule