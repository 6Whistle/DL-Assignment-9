`timescale 1ns/100ps

module tb_multiplier();
	reg [63:0]multiplier, multiplicand;
	reg clk, reset_n, op_start, op_clear;
	wire op_done;
	wire [127:0]result;
	
	multiplier U0_multiplier(op_done, result, clk, reset_n, multiplier, multiplicand, op_start, op_clear);
	
	always begin clk = 0; #5; clk = 1; #5; end
	
	initial begin
		reset_n = 1'b0; multiplier = 64'h0000_0000_0000_0000; multiplicand = 64'h0000_0000_0000_0000; op_start = 1'b0; op_clear = 1'b1; #10;		//clear
		
		reset_n = 1'b1; multiplier = 64'h0000_0000_0000_0101; multiplicand = 64'h0000_0000_0000_784b; op_start = 1'b0; op_clear = 1'b0; #40;		//clear
		
		reset_n = 1'b1; multiplier = 64'h0000_0000_0000_0101; multiplicand = 64'h0000_0000_0000_784b; op_start = 1'b1; op_clear = 1'b0; #40;		//start->doing
		
		op_clear = 1'b1; #20; op_clear = 1'b0; #400;		//clear->start->doing->finish
		
		op_clear = 1'b1; #10;	//clear
		
		$stop;
	end
endmodule
