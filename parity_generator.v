`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Create Date:    23:41:39 03/04/2017 
// Design Name: 
// Module Name:    parity_generator 
// Description: 	 The system generating parity bit for n-bit word.
// 
//////////////////////////////////////////////////////////////////////////////////

module parity_generator
 #(parameter N_SW = 8,							// number of switches / bits in word
	parameter N_LED = 8,							// number of segments at display
	parameter N_LED_AN = 4,						// number of displays
	  
	parameter E = 8'b00110001,
	parameter O = 8'b00000011)
	  
  (input wire [N_SW-1:0] 			sw_i,
	output reg [N_LED-1:0] 			led_o,
	output wire [N_LED_AN-1:0] 	led_an_o);
	  
	  
	reg xor_value;
	assign led_an_o = 4'b1101;
	
	always@ (sw_i) begin : parity_check
		assign xor_value = ^sw_i;
		if(xor_value) begin		
			assign led_o = E;
		end
		else begin
			assign led_o = O;
		end
			
	end

endmodule // parity_generator