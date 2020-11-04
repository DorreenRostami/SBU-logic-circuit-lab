`timescale 1ns / 1ps
module ALU(
    input nCn,
    input M,
    input [3:0] S,
    input [3:0] A,
    input [3:0] B,
    output [3:0] F,
    output AEQB,
    output G,
    output P,
    output nCn4
    );
	
	wire [3:0] nP, nG, tmp;
	wire nM, C0;
	wire [13:0] a;
	
	not_gate n0(M, nM);

	Block1 b1(A[0], B[0], S, nP[0], nG[0]);
	Block1 b2(A[1], B[1], S, nP[1], nG[1]);
	Block1 b3(A[2], B[2], S, nP[2], nG[2]);
	Block1 b4(A[3], B[3], S, nP[3], nG[3]);
	
	and_gate U0({nM, nCn}, tmp[0]);
	not_gate n1(tmp[0], a[0]);
	xor_gate x0(nP[0], nG[0], C0);
	xor_gate x1(a[0], C0, F[0]);
	
	and_gate 		U1({nM, nP[0]}, a[1]);
	and_gate #(3) 	U2({nM, nG[0], nCn}, a[2]);
	Block2 			b5(a[2:1], {nP[1], nG[1]}, F[1]);
	
	and_gate 		U3({nM, nP[1]}, a[3]);
	and_gate #(3) 	U4({nM, nP[0], nG[1]}, a[4]);
	and_gate #(4) 	U5({nM, nCn, nG[0], nG[1]}, a[5]);
	Block2 	#(3)	b6(a[5:3], {nP[2], nG[2]}, F[2]);
	
	and_gate 		U6({nM, nP[2]}, a[6]);
	and_gate #(3) 	U7({nM, nP[1], nG[2]}, a[7]);
	and_gate #(4) 	U8({nM, nP[0], nG[1], nG[2]}, a[8]);
	and_gate #(5) 	U9({nM, nCn, nG[0], nG[1], nG[2]}, a[9]);
	Block2 	#(4)	b7(a[9:6], {nP[3], nG[3]}, F[3]);
	
	and_gate #(4) 	U10({nP[0], nG[1], nG[2], nG[3]}, a[10]);
	and_gate #(3) 	U11({nP[1], nG[2], nG[3]}, a[11]);
	and_gate 		U12({nP[2], nG[3]}, a[12]);
	and_gate 	 	U13({1, nP[3]}, a[13]);
	or_gate 	#(4)	V0(a[13:10], tmp[3]);
	not_gate 		n2(tmp[3], P);
	
	and_gate #(4) 	UE(F, AEQB);
	
	and_gate #(4) 	UG({nG[0], nG[1], nG[2], nG[3]}, tmp[1]);
	not_gate 		n3(tmp[1], G);
	
	and_gate #(5) 	UH({nCn, nG[0], nG[1], nG[2], nG[3]}, tmp[2]);
	
	or_gate V1(tmp[3:2], nCn4);
	
endmodule
