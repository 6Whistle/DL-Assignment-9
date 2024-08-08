module shift_logic(next_result, next_multiplicand, next_x_before, se, result, multiplicand);			//arithmetic shift 2-bit logic
	input se;
	input signed [63:0] multiplicand;
	input signed [127:0] result;
	output reg next_x_before;
	output reg signed [63:0] next_multiplicand;
	output reg signed [127:0] next_result;
	
	always@(result, multiplicand, se) begin
		next_x_before = multiplicand[1];			//remember x_before
		if(se == 1'b1)		begin next_result = result; next_multiplicand = multiplicand;	end		//if se == 0, don't shift
		else					begin next_result = result >>> 2; next_multiplicand = multiplicand >>> 2;	end		//if se == 1, arithmetic shift	
		end
	endmodule
	