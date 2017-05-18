`timescale 1ns / 1ps

module RTClock
  (input 			clk_i,
	output [3:0] 	led_an,
	output [6:0] 	led_seg);
	
	reg [25:0] 	freq_clk = 10000000; // 10 MHz Clock 
	reg [25:0] 	counter = 0;
	
	reg [3:0] minutes_1 	= 0;
	reg [3:0] minutes_10 = 0;
	reg [3:0] seconds_1 	= 0;
	reg [3:0] seconds_10 = 0;
	reg [3:0] hours_1 	= 0;
	reg [1:0] hours_10 	= 0;
	
	
	always @ (posedge clk_i) begin
		if(counter == freq_clk) begin
			counter = 0;
			seconds_1 = seconds_1 + 1;
		end
		else 
			counter = counter + 1;
			
		if(seconds_1 == 10) begin 
			seconds_1 = 0;
			seconds_10 = seconds_10 + 1;
		end
		if(seconds_10  == 6) begin
			seconds_10 = 0;
			minutes_1 = minutes_1 + 1;
		end
		if(minutes_1  == 10) begin
			minutes_1 = 0;
			minutes_10 = minutes_10 + 1;
		end
		if(minutes_10 == 6) begin
			minutes_10 = 0;
			hours_1 = hours_1 + 1;
		end
			
	end
	display disp(
		.clk_i(clk_i), 
		.sign0(seconds_1), 
		.sign1(seconds_10), 
		.sign2(minutes_1),
		.sign3(minutes_10),
		.segments(led_seg),
		.displays(led_an));


endmodule
