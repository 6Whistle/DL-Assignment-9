module register64_r_en(q, clk, reset_n, en, d);	//64-bits reset_n / en register
	input clk, reset_n, en;
	input [63:0] d;
	output reg [63:0] q;
	
	always@(posedge clk or negedge reset_n)		//Operate when clk and reset_n is changed
	begin
		if(reset_n == 0)		q <= 64'b0;			//reset
		else if(en)				q <= d;				//store
		else						q <= q;				//write
	end
endmodule
