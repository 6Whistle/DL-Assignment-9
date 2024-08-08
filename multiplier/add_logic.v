module add_logic(next_result, multiplier, multiplicand, result, x_before);		//add result + booth num
 input [63:0] multiplier, multiplicand;
 input [127:0] result;
 input x_before;
 
 output reg [127:0] next_result;
 
 //pattern
 parameter ADD_0 = 3'b000;
 parameter ADD_M_1 = 3'b001;
 parameter ADD_M_2 = 3'b010;
 parameter ADD_2M = 3'b011;
 parameter SUB_2M = 3'b100;
 parameter SUB_M_1 = 3'b101;
 parameter SUB_M_2 = 3'b110;
 parameter SUB_0 = 3'b111;

 
 wire [63:0]mul_0, mul_add_m, mul_add_2m, mul_sub_2m, mul_sub_m;
 wire [63:0] m2;
 
 assign m2 = multiplier << 1;			//multiplier * 2

 assign mul_0 = result[127:64];		//add 0 and sub 0
 
 //Add pattern
 cla64 U0_cla64(mul_add_m, w0, result[127:64], multiplier, 1'b0);		//ADD_M
 cla64 U1_cla64(mul_add_2m, w0, result[127:64], m2, 1'b0);				//ADD_2M
 cla64 U2_cla64(mul_sub_m, w0, result[127:64], ~(multiplier), 1'b1);	//SUB_M
 cla64 U3_cla64(mul_sub_2m, w0, result[127:64], ~m2, 1'b1);				//SUB_2M
 
 always@(multiplicand, x_before, result) begin
	next_result[63:0] = result[63:0];
	case({multiplicand[1:0], x_before})
		ADD_0 : next_result[127:64] = mul_0;			//add 0
		ADD_M_1 : next_result[127:64] = mul_add_m;	//add multiplier
		ADD_M_2 : next_result[127:64] = mul_add_m;	//add multiplier
		ADD_2M : next_result[127:64] = mul_add_2m;	//add multiplier * 2
		SUB_2M : next_result[127:64] = mul_sub_2m;	//sub multiplier * 2
		SUB_M_1 : next_result[127:64] = mul_sub_m;	//sub multiplier
		SUB_M_2 : next_result[127:64] = mul_sub_m;	//sub multiplier
		SUB_0 : next_result[127:64] = mul_0;			//sub 0
		default : next_result[127:64] = 64'bx;
	endcase
	end
endmodule
 