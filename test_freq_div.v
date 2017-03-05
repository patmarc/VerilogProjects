`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
// Create Date:   17:08:39 03/05/2017
// Design Name:   freq_div
// Project Name:  Frequency_counter
//	Description:	Testbench for frequency divider
//
////////////////////////////////////////////////////////////////////////////////

module test_freq_div;

	// Inputs
	reg clk_i;
	reg rst_i;

	// Outputs
	wire clk_o;

	// Instantiate the Unit Under Test (UUT)
	freq_div uut 
	    (.clk_i(clk_i), 
		.rst_i(rst_i), 
		.clk_o(clk_o));

	initial begin
		clk_i = 1;
		#20;
	end
   always begin
		if(clk_i ==1)begin
			clk_i =0;
			#20;
		end
		if(clk_i ==0)begin
			clk_i =1;
			#20;
		end
	end
		
endmodule

