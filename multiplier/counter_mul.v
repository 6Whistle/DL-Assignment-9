module counter_mul(next_count, state, count); //32~0 counter 
	input [1:0]state;
	input [5:0]count;
	output reg [5:0]next_count;
	
	wire [5:0]dec_count;
	
	assign dec_count = count - 1;			//decrease count
	
	always@(state, count) begin
		if(state[1] == 1'b0) next_count = 6'b0000_00;		//clear
		else if(state == 2'b10)	next_count = 6'b1000_00;	//start
		else if(state == 2'b11) next_count = dec_count;		//doing
		else next_count = count;
	end
endmodule
