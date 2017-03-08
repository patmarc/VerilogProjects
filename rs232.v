`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
//
// Design Name: 		rs232
// Description:    	Port rs232 ( receiver and transmitter)
// 
//////////////////////////////////////////////////////////////////////////////////
module rs232
       (input wire 		clk_in,
	input wire  		rxd_in,
	output reg		txd_out);
	
	reg [5:0] 		bit_nr;
	reg			bit_start;
	reg			bit_stop;
	reg [7:0]		txd_temp;
	reg [7:0]		txd_sum;
	
	reg			ctrl_rready;
	reg			ctrl_tready;
	reg			ctrl_wdata;
	
	// receiver
	initial begin
		ctrl_rready = 1;
	end
	always @ (negedge rxd_in) begin : r_begin
		if(ctrl_rready == 1)	begin
			bit_nr = 0;
			ctrl_rready = 0;
			ctrl_wdata = 1;
		end
	end
	
	always @ (negedge clk_in or posedge clk_in) begin : r_main_block
		if(ctrl_rready == 0 ) begin
			if(bit_nr == 0) begin
				bit_start = rxd_in;
				bit_nr = bit_nr + 1;
			end
			else begin
				if(bit_nr < 5'd9) begin
					txd_temp [bit_nr-1] = rxd_in;
					bit_nr = bit_nr +1;
				end
				else begin
					bit_stop = rxd_in;
					ctrl_rready = 1;
					ctrl_wdata = 0;
				end
			end
		end
	end
	
	always @ (negedge ctrl_wdata) begin	: r_end
		assign txd_sum = txd_temp + 8'h20;								//sum
	end
	
	//transmitter
	always @ (negedge ctrl_wdata) begin : t_begin
		ctrl_tready = 0;
		bit_nr = 0;
	end
	
	always @ (negedge clk_in or posedge clk_in) begin : t_main_block
		if(ctrl_tready == 0) begin
			if( bit_nr == 0) begin
				txd_out = 0;
				bit_nr = bit_nr +1;
			end
			else begin
				if(bit_nr < 5'd9) begin
					txd_out = txd_sum [bit_nr-1]; 
					bit_nr = bit_nr + 1;
				end
				else begin
					txd_out = 1;
					bit_nr = bit_nr + 1;
					ctrl_tready = 1;
				end
			end
		end
	end
	
endmodule // rs232
