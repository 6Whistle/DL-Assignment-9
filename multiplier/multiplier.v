module multiplier(op_done, result, clk, reset_n, multiplier, multiplicand, op_start, op_clear);		//multiplier module
	input clk, reset_n, op_start, op_clear;
	input [63:0]multiplier, multiplicand;
	output op_done;
	output [127:0]result;
	
	wire x_before, next_x_before;
	wire [1:0]state, next_state;
	wire [5:0]count, next_count;
	wire [63:0]cur_multiplier, cur_multiplicand, next_multiplier, next_multiplicand, shift_multiplicand;
	wire [127:0]cur_result, before_shift_result;
	
	//next_state and counter
	next_state_mul U0_next_state_mul(next_state, next_multiplier, next_multiplicand, next_op_done, op_start, op_clear, count, state, cur_multiplier, shift_multiplicand, multiplier, multiplicand);
	counter_mul U1_counter_mul(next_count, next_state, count);
	
	//register
	register10_r_en U2_register_10_r_en({state, count, x_before, op_done}, clk, reset_n & ~op_clear, 1'b1, {next_state, next_count, next_x_before, next_op_done});
	register64_r_en U3_register_64_r_en(cur_multiplier, clk, reset_n, 1'b1, next_multiplier);		//multiplier
	register64_r_en U4_register_64_r_en(cur_multiplicand, clk, reset_n, 1'b1, next_multiplicand);//multiplicand
	register128_r_en U5_register_128_r_en(cur_result, clk, reset_n & ~op_clear, 1'b1, result);	//result
	
	//multiply logic
	add_logic U6_add_logic(before_shift_result, cur_multiplier, cur_multiplicand, cur_result, x_before);
	shift_logic U7_shift_logic(result, shift_multiplicand, next_x_before, op_done, before_shift_result, cur_multiplicand);
	
	endmodule
