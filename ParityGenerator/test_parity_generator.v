`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// 
// Create Date:   23:50:57 03/04/2017
// Design Name:   parity_generator
// Description:   Testbench for parity_generator. 
// 
////////////////////////////////////////////////////////////////////////////////

module test_parity_generator;

	// Inputs
	reg [7:0] 	sw_i;
	// Outputs
	wire [7:0] 	led_o;
	wire [3:0] 	led_an_o;

	// Instantiate the Unit Under Test (UUT)
	parity_generator uut 
	       (.sw_i(sw_i), 
		.led_o(led_o), 
		.led_an_o(led_an_o));
	
	integer random_value ;
	initial begin
		sw_i = 8'b11000000;
		#200;
		repeat (8) begin 
			random_value = $random%32;
			sw_i = random_value;
			#200;
		end
	end
      
endmodule

