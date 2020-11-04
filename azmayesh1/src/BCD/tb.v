`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:10:53 05/19/2020
// Design Name:   BCD3
// Module Name:   E:/Sem 4/az/BCD3/tb.v
// Project Name:  BCD3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BCD3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [11:0] a;
	reg [11:0] b;
	reg cin;

	// Outputs
	wire [11:0] s;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	BCD3 uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.cout(cout)
	);

	initial
	begin
		cin = 0;
		a = 12'b000000000010; //2
		b = 12'b000000000011; //3
		#10;
		a = 12'b001000100010; //222
		b = 12'b001100110011; //333
		#10;
		a = 12'b100010001000; //888
		b = 12'b001100110011; //333
		#10;
	end
      
endmodule

