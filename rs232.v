`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
//
// Design Name: 		rs232
// Description:    	Port rs232 ( receiver and transmitter)
// 
//////////////////////////////////////////////////////////////////////////////////
module rs232
       (input wire 	clk_in,
	input wire  	rxd_in,
	input wire 	rst_in,
	output reg 	txd_out);
	
	reg [5:0] 	bit_nr;
	reg		bit_start;
	reg		bit_stop;
	reg [7:0]	txd_temp;
	reg [7:0]	txd_sum;
	
	reg		ctrl_rready;
	reg		ctrl_tready;
	reg		ctrl_rstart;

	initial begin
		ctrl_rready = 0;
		ctrl_tready = 1;
		ctrl_rstart = 0;
	end
	
	always @ (posedge clk_in ) begin 
	//receiver
		if(ctrl_rready == 0) begin
			if(rxd_in == 0 & ctrl_rstart != 1) begin
				bit_nr = 0;
				ctrl_rstart = 1;
				txd_out = 1;
			end
			if (ctrl_rstart == 1) begin
				if(bit_nr ==0) begin
					bit_start = rxd_in;
					bit_nr = bit_nr + 1;
				end
				else begin
					if(bit_nr < 5'd9) begin
						txd_temp [bit_nr-1] = rxd_in; // serial to parallel
						bit_nr = bit_nr +1;
					end
					else begin
						bit_stop = rxd_in;
						ctrl_rstart = 0;
						ctrl_rready = 1;
						txd_sum = txd_temp;
						bit_nr = 0;
						ctrl_tready = 0;
					end
				end
			end
		end
		
		//transmitter
		if(ctrl_tready == 0)begin
			if(bit_nr == 0) begin
				bit_nr = 1;
				txd_out = 0;
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
					ctrl_rready = 0;
				end
			end
		end
	end
	
endmodule // rs232
