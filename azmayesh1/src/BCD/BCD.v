`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:39:36 05/19/2020 
// Design Name: 
// Module Name:    BCD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BCD(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );

	wire [3:0] sp;
	wire c, cignore, t1, t2;
	
	adder a1(a, b, cin, sp, c);
	adder a2(sp, {1'b0, cout, cout, 1'b0}, 0, s, cignore);
	and_gate u1(sp[3], sp[2], t1);
	and_gate u2(sp[3], sp[1], t2);
	or_gate3 v(c, t1, t2, cout);

endmodule
