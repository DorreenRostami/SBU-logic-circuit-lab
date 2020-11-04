`timescale 1ns / 1ps
module Block1(
    input a,
    input b,
    input [3:0] S,
    output P,
    output G
    );
	wire nB;
	wire [3:0]t;
	
	assign nB = ~b;
	assign t[0] = b & S[0];
	assign t[1] = nB & S[1];
	assign t[2] = S[2] & nB & a;
	assign t[3] = S[3] & b & a;	

	assign P = ~(a | t[0] | t[1]);
	assign G = ~(t[2] | t[3]);
endmodule
