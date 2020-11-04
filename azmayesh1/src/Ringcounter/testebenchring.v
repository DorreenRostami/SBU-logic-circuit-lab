module testebenchring();
	// Inputs
	reg clk;
	reg reset;
	// Outputs
  	wire [7:0] q;
  	ringcounter rc(clk,reset,q);
  	always #5 clk = ~clk;

    initial begin
		clk = 0;  
		reset = 0;
	
		#5 reset = 1;
		#20 reset = 0; 
    end
	 
endmodule 