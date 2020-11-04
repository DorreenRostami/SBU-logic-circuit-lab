module testjohn();
	// Inputs
	reg clk;
	reg reset;
	// Outputs
  	wire [3:0] q;
  	johnson john(clk,reset,q);
  	always #5 clk = ~clk;

    initial 
	begin
		clk = 0;  
		reset = 0;
	
		#5 reset = 1;
		#20 reset = 0; 
    end
endmodule 	 