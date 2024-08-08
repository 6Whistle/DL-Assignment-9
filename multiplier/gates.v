module _inv(y, a);		//NOT Gate
	input a;
	output y;
	
	assign y = ~a;
endmodule

module _nand2(y, a, b);		//2 input NAND Gate
	input a, b;
	output y;
	
	assign y = ~(a & b);
endmodule

module _and2(y, a, b);		//2 input AND Gate
	input a, b;
	output y;
	
	assign y = a & b;
endmodule

module _or2(y, a, b);		//2 input OR Gate
	input a, b;
	output y;
	
	assign y = a | b;
endmodule

module _xor2(y, a, b);		//2 input XOR Gate
	input a, b;
	output y;
	wire inv_a, inv_b;
	wire w0, w1;
	
	_inv invA(inv_a, a);		//invert a and b
	_inv invB(inv_b, b);
	
	_and2 and0(w0, inv_a, b);		//a'b
	_and2 and1(w1, a, inv_b);		//ab'
	
	_or2 or0(y, w0, w1);		//a'b + ab'
endmodule

module _and3(y, a, b, c);	//3 input AND Gate
	input a, b, c;
	output y;
	
	assign y = a & b & c;
endmodule

module _and4(y, a, b, c, d);	//4 input AND Gate
	input a, b, c, d;
	output y;
	
	assign y = a & b & c & d;
endmodule

module _and5(y, a, b, c, d, e);	//5 input AND Gate
	input a, b, c, d, e;
	output y;
	
	assign y = a & b & c & d & e;
endmodule

module _or3(y, a, b, c);	//3 input OR Gate
	input a, b, c;
	output y;
	
	assign y = a | b | c;
endmodule

module _or4(y, a, b, c, d);	//4 input OR Gate
	input a, b, c, d;
	output y;
	
	assign y = a | b | c | d;
endmodule

module _or5(y, a, b, c, d, e);	//5 input OR Gate
	input a, b, c, d, e;
	output y;
	
	assign y = a | b | c | d | e;
endmodule
