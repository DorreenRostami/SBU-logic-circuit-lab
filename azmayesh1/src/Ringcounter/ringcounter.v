module ringcounter(input  clk,
input  reset,
output reg [7:0]q);

always @(posedge clk) 
begin   	
	if (reset)
		q <= 8'b00000001;
	else
	begin
		q[7]<=q[0];
		q[6]<=q[7];
		q[5]<=q[6];
		q[4]<=q[5];
		q[3]<=q[4];
		q[2]<=q[3];
		q[1]<=q[2];
		q[0]<=q[1];
	end
end

endmodule 



