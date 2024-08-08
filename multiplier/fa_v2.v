module fa_v2(s, a, b, ci);
	input a, b, ci;
	output s;
	
	_xor2 xor1(w0, a, b);
	_xor2 xor2(s, ci, w0);
	
endmodule
