`timescale 1ns / 1ps
module Block2 #(parameter WIDTH = 2)(
    input [WIDTH-1:0] A,
    input [1:0] B,
    output C
    );
	
	wire t1, t2;
	assign t1 = ~(|A);
	assign t2 = ^B;
	assign C = t1^t2;

endmodule
