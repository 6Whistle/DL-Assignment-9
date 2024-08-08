module cla4(s, co, a, b, ci);
	input [3:0] a, b;
	input ci;
	output [3:0] s;
	output co;
	
	wire [3:0] c;
	
	fa_v2 U0_fa	(s[0], a[0], b[0], ci);			//LSB ADD
	fa_v2 U1_fa	(s[1], a[1], b[1], c[1]);		//Second bit ADD
	fa_v2 U2_fa	(s[2], a[2], b[2], c[2]);		//Third bit ADD
	fa_v2 U3_fa	(s[3], a[3], b[3], c[3]);		//MSB ADD
	clb4 U4_clb4 (c[1], c[2], c[3], co, a, b, ci);	//Carry Look-ahead Block
endmodule 