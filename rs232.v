`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
//
// Create Date:    	20:38:44 03/06/2017 
// Design Name: 
// Module Name:    	rs232 
//
// 
//////////////////////////////////////////////////////////////////////////////////
module rs232	
  (input wire 			clk_in,
	input wire 			rst_in,
	input wire  		rxd_in,
	output reg [7:0] 	txd_out,
	
	// receiver
	input wire			ctrl_rdata,									
	output reg			ctrl_rready,
	
	//transmitter
	input wire			ctrl_wdata,									
	output wire			ctrl_wready);
	
	reg [5:0] 	bit_nr;
	reg			bit_start;
	reg			bit_stop;
	reg [7:0]	txd_temp;
	
	// receiver
	initial @ (negedge ctrl_rdata) begin : receive_begin
		bit_start = rxd_in;
		bit_nr = 5'b00001;
		ctrl_rready = 0;
	end
	
	always @ (negedge clk_in or posedge clk_in) begin : receive_main_block
		if(ctrl_rready == 0) begin
			if(bit_nr < 5'd9) begin
				txd_temp [bit_nr-1] = rxd_in;
				bit_nr = bit_nr +1;
			end
			else begin
				bit_stop = rxd_in;
				assign ctrl_rready = 1;
			end
		end
	end
	
	initial @ (posedge ctrl_rready) begin	: receive_end
		assign txd_out = txd_temp;
	end
	
	//transmitter
	
	
endmodule // rs232
