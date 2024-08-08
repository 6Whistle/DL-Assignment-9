module cla64(s, co, a, b, ci);		//cla 64-bits
	input [63:0] a, b;
	input ci;
	output [63:0] s;
	output co;
	
	wire c1;
	
	cla32 U1_cla32(s[31:0], c1, a[31:0], b[31:0], ci);
	cla32 U2_cla32(s[63:32], co, a[63:32], b[63:32], c1);
endmodule
	