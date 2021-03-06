`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date:    15:49:47 03/05/2017  
// Module Name:    freq_counter  
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module freq_div
 #(parameter N = 5)			// div by N
 
  (input wire 	clk_i,
	input wire 	rst_i,
	output reg 	clk_o);
	
	
	integer counter = 0;
	initial @ (posedge clk_i) begin
		assign clk_o = 0;
	end
	
	always @ (posedge clk_i) begin
		if(N % 2 == 0) begin						//for even numbers
			if(counter == ((N/2)-1)) begin
				counter = 0;
				if(clk_o == 0) begin
					assign clk_o = 1;
				end
				else begin
					assign clk_o = 0;
				end
			end
			else begin
				counter = counter +1;
			
			end
		end
		else begin									//for odd numbers
			if(counter == ((N/2))) begin
				
				if(clk_o == 0) begin
					assign clk_o = 1;
					counter = 0;
					end
				else begin
					assign clk_o = 0;
					counter = 1;
				end
			end
			else begin
				counter = counter +1;
			
			end
		end
		
	end



endmodule // freq_div
