`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    	20:38:44 03/06/2017 
// Design Name: 
// Module Name:    	rs232 
//
// To do : 				add parity bit, N_BIT_STOP , rst
//////////////////////////////////////////////////////////////////////////////////
module rs232
 #(parameter 	N_BIT_STOP = 1)									// number of stop bits 1 or 2 	
 
  (input wire 			clk_in,
	input wire 			rst_in,
	input wire  		rxd_in,
	input wire			start_flag,
	output reg [7:0] 	txd_out,
	output reg			end_flag);
	
	reg [5:0] 	bit_nr;
	reg			bit_start;
	reg			bit_stop;
	
	initial @ (negedge start_flag) begin
		bit_start = rxd_in;
		bit_nr = 5'b00001;
		end_flag = 0;
	end
	
	always @ (negedge clk_in or posedge clk_in) begin
		if(end_flag == 0) begin
			if(bit_nr < 5'd9) begin
				txd_out [bit_nr-1] = rxd_in;
				bit_nr = bit_nr +1;
			end
			else begin
				bit_stop = rxd_in;
				assign end_flag = 1;
			end
		end
	end
	
endmodule // rs232
