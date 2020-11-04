`timescale 1ns / 1ps
module tb;
	
	reg count;
	
	reg nCn;
	reg M;
	reg [3:0] S;
	reg [3:0] A;
	reg [3:0] B;
	
	wire [3:0] F;
	wire AEQB;
	wire G;
	wire P;
	wire nCn4;
	
	ALU uut (
		.nCn(nCn), 
		.M(M), 
		.S(S), 
		.A(A), 
		.B(B), 
		.F(F), 
		.AEQB(AEQB), 
		.G(G), 
		.P(P), 
		.nCn4(nCn4)
	);
	
	always
	begin
		#10;
		if(S < 15)
			S = S + 1;
		else
		begin
			if(count == 0)
			begin
				count = count + 1;
				M = 1;
				S = 0;
			end
			else if(count == 1)
			begin
				count = count + 1;
				nCn = 1;
				M = 0;
				S = 0;
			end
			else if(count == 2)
			begin
				count = count + 1;
				M = 1;
				S = 0;
			end
		end
	end
	
	
	initial 
	begin
		count = 0;
		nCn = 0;
		M = 0;
		S = 0;
		A = 4'b0010;
		B = 4'b0100;
	end
      
endmodule
