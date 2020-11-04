`timescale 1ns / 1ps
module or_gate #(parameter WIDTH = 2)(
    input [WIDTH-1:0] A,
    output B
    );

	assign B = |A;
endmodule
