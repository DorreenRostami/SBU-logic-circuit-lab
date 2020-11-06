`timescale 1ns / 1ps

module multiplier #(parameter WIDTH = 32)(
    input start,
    input clk,
    input [WIDTH - 1:0] A,
    input [WIDTH - 1:0] B,
    output reg [2*WIDTH - 1:0] O
    );
	
	reg [WIDTH - 1:0] mplier;
	reg [2*WIDTH - 1:0] mcand, result;
	reg [5:0] counter;
	reg cont;
	
	always @(posedge clk) 
	begin
		if(start) 
		begin
			if(cont == 1)
			begin
				if(counter < WIDTH)
				begin
					if (mplier[0] == 1) 
						result <= result + mcand;
					mcand <= mcand << 1;
					mplier <= mplier >> 1;
					counter <= counter + 1;
				end
				else
				begin
					O <= result;
				end
			end
			else
			begin
				cont <= 1;
				counter <= 0;
				mcand <= A;
				mplier <= B;
				result <= 0;
			end
		end
		else
		begin
			cont <= 0;
			result <= 0;
			O <= 0;
		end
	end

endmodule
