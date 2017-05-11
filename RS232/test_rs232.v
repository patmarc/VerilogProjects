`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// 
// Design Name:   rs232
// Description:   Testbench for rs232. 
// 
////////////////////////////////////////////////////////////////////////////////


module test_rs232;
	// Inputs 
	reg 	clk_in;
	reg 	rxd_in;

	// Outputs 
	wire 	txd_out;
									
	// Instantiate the Unit Under Test (UUT)
	rs232 uut 
	       (.clk_in(clk_in),  
		.rxd_in(rxd_in), 
		.txd_out(txd_out));
	
	initial begin
		clk_in = 0;
		#20;
	end
	
	always begin
		if (clk_in ==0) begin
			clk_in = 1;
			#20;
		end
		else begin
			clk_in = 0;
			#20;
		end
	end
	
	always @ (posedge clk_in or negedge clk_in) begin
		rxd_in = 1;
		#40;
		rxd_in = 0;			//start bit
		#20;
		rxd_in = 1;
		#20;
		rxd_in = 1;
		#20
		rxd_in = 0;
		#20;
		rxd_in = 0;
		#20;
		rxd_in = 1;
		#20
		rxd_in = 0;
		#20;
		rxd_in = 1;
		#20;
		rxd_in = 0;
		#20;
		rxd_in = 1;			//end bit 
		#300;	
	end
      
endmodule // test_rs232

