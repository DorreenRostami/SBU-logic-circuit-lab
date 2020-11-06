`timescale 1ns / 1ps

module tb;

	reg start4, start32;
	reg clk;
	
	reg [3:0] A4, B4;
	wire [7:0] O4;
	
	reg [31:0] A32, B32;
	wire [63:0] O32;

	multiplier #(4) 	uut4(start4, clk, A4, B4, O4);
	multiplier #(32) 	uut32(start32, clk, A32, B32, O32);
	
	always #1 clk = ~clk;

	initial 
	begin
		start4 = 0;
		start32 = 0;
		clk = 0;
		A4 = 2;
		B4 = 3;
		A32 = 32'b10000000000000000000000000000000;
		B32 = 32'b10000000000000000000000000000000;
		#10;
		start4 = 1;
		#500;
		start32 = 1;
	end
      
endmodule

