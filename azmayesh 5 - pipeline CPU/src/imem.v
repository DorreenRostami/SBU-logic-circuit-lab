`timescale 1ns / 1ps

module imem(
	 input [7:0] a,
	 output [15:0] rd
	 );

	reg [15:0] RAM[255:0];

	initial 
		$readmemb("E:\\Sem 4\\az\\az4\\memfile.dat",RAM);

	assign rd = RAM[a[7:2]];

endmodule
