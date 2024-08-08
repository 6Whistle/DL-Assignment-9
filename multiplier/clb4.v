module clb4(c1, c2, c3, co, a, b, ci);
	input [3:0] a, b;
	input ci;
	output c1, c2, c3, co;
	wire [3:0] g, p;
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;
	
	// Generate
	_and2 G0(g[0], a[0], b[0]);
	_and2 G1(g[1], a[1], b[1]);
	_and2 G2(g[2], a[2], b[2]);
	_and2 G3(g[3], a[3], b[3]);
	
	
	// Propagate
	_or2 P0(p[0], a[0], b[0]);
	_or2 P1(p[1], a[1], b[1]);
	_or2 P2(p[2], a[2], b[2]);
	_or2 P3(p[3], a[3], b[3]);
	
	
	//c1 = g[0] | (p[0] & ci)
	_and2 and2C1(w0_c1, p[0], ci);
	_or2 or2C1(c1, g[0], w0_c1);
	

	//c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci)
	_and2 and2C2(w0_c2, p[1], g[0]);
	_and3 and3C2(w1_c2, p[1], p[0], ci);
	_or3 or3C2(c2, g[1], w0_c2, w1_c2);
	
	
	//c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci)
	_and2 and2C3(w0_c3, p[2], g[1]);
	_and3 and3C3(w1_c3, p[2], p[1], g[0]);
	_and4 and4C3(w2_c3, p[2], p[1], p[0], ci);
	_or4 or4C3(c3, g[2], w0_c3, w1_c3, w2_c3);


	//co = g[3] | 
	//(p[3] & g[2]) |
	//(p[3] & p[2] & g[1]) | 
	//(p[3] & p[2] & p[1] & g[0]) |
	//(p[3] & p[2] & p[1] & p[0] & ci) |
	_and2 and2Co(w0_co, p[3], g[2]);
	_and3 and3Co(w1_co, p[3], p[2], g[1]);
	_and4 and4Co(w2_co, p[3], p[2], p[1], g[0]);
	_and5 and5Co(w3_co, p[3], p[2], p[1], p[0], ci);
	_or5 or5Co(co, g[3], w0_co, w1_co, w2_co, w3_co);
	
endmodule
