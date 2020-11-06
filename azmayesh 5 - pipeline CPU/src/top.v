`timescale 1ns / 1ps

module top(
	 input clk , reset,
	 output [15:0] Instr,
	 output [3:0] Flags,
	 output [7:0] ALUResult,
	 output [7:0] ALUResult2,
	 output [7:0] SrcA, 
	 output [7:0] SrcB,
	 output PCSrcE
	 ); 

	wire [7:0] ReadData;
	wire [7:0] PC; 
	wire [7:0] WriteData;
	wire [7:0] DataAdr;

	//ReadData = Data from memory
	//WriteData = Data from second port of register file
	//Control = ALUControl
	//Flags = ALUFlags

	CPU cpu(clk, reset, PC, Instr, DataAdr, ALUResult, ALUResult2, WriteData, ReadData, Flags, SrcA, SrcB, PCSrcE); 
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);

endmodule
