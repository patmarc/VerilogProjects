`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    20:38:44 03/06/2017 
// Design Name: 
// Module Name:    rs232 
//
//////////////////////////////////////////////////////////////////////////////////
module rs232
 #(parameter 	N_BIT_STOP = 1,									// number of stop bits 1 or 2
	parameter	PARITY_BIT = 0)									// with parity bit PARITY_BIT = 1 	
  (input wire 			clk_in,
	input wire 			rst_in,
	input wire  		rxd_in,		
	output reg [7:0] 	txd_out);
	
	reg [5:0] 	bit_nr;
	reg			bit_start;
	reg			bit_stop;
	reg [7:0] 	data_in;
	
	initial @ (clk_in) begin
		bit_nr = 5'b00000;
	end
	
	always @ (negedge clk_in or posedge clk_in) begin
		if(bit_nr == 0) begin
			assign bit_start = rxd_in;
			bit_nr = 5'b00001;
		end
		else begin
			if(bit_nr < 5'd9) begin
				assign txd_out [7-(bit_nr-1)] = rxd_in;
				bit_nr = bit_nr +1;
			end
			else begin
					bit_nr = 0;
					bit_stop = rxd_in;
			end
		end
	end
	


endmodule // rs232
