`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date:    15:49:47 03/05/2017  
// Module Name:    freq_counter  
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module freq_counter
 #(parameter N = 10)
 
  (input wire 	clk_i,
	input wire 	rst_i,
	output reg 	clk_o);
	
	integer counter;
	
	always @ (posedge clk_i) begin
			
	end



endmodule // freq_counter
