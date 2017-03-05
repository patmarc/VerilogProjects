`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// // 
// Create Date:    23:41:39 03/04/2017 
// Design Name: 
// Module Name:    parity_generator 
// Description: 	  The system generating parity bit for n-bit word.
// 
//////////////////////////////////////////////////////////////////////////////////
module parity_generator
 #(parameter N_SW = 8,							// number of switches
   parameter N_LED = 8,							// number of segments at display
   parameter N_LED_AN = 4,							// number of displays
	  
   parameter E = 8'b00110001,
   parameter O = 8'b00000011)
	  
  (input wire [N_SW-1:0] 		sw_i,
   output reg [N_LED-1:0] 		led_o,
   output wire [N_LED_AN-1:0] 	led_an_o);
	  
	  
endmodule // parity_generator