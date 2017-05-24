`timescale 1ns / 1ps
module display
       (input 		 clk_i,
	input [3:0] 	 sign0, sign1, sign2, sign3, // sign at display 0,1,2 or 3
	output reg[6:0]	 segments, // segments: a,b,c,d,e,f,g
	output reg [3:0] displays,
	output reg 	 dp,
	input 		 seconds);
	
	reg [1:0] 	select =0;
	reg [3:0] 	sign;
	reg [25:0] 	cnt = 0;
	

	always @(posedge clk_i) begin 
		if(cnt == 200) begin
			cnt = 0;
			case(select)
				0: begin
						displays[3] = 1;
						displays[2] = 1;
						displays[1] = 1;
						displays[0] = 0;
						sign = sign0;
						select = select + 1;
						dp = 1;
					end
				1: begin
						displays[3] = 1;
						displays[2] = 1;
						displays[1] = 0;
						displays[0] = 1;
						sign = sign1;
						select = select + 1;
						dp = 1;
					end
				2: begin
						displays[3] = 1;
						displays[2] = 0;
						displays[1] = 1;
						displays[0] = 1;
						sign = sign2;
						select = select + 1;
						if(seconds %2 == 0) begin
							dp = 1;
						end
						else begin
							dp = 0 ;
						end
				end
				3: begin
						displays[3] = 0;
						displays[2] = 1;
						displays[1] = 1;
						displays[0] = 1;
						sign = sign3;
						select = 0;
						dp = 1;
					end
				default begin
						displays[3] = 1;
						displays[2] = 1;
						displays[1] = 1;
						displays[0] = 1;
						sign = sign0;
						select = 0;
//						dp = 1;
					end
			endcase
			
		end
		else
			cnt = cnt+1;
	end
	
	
	always @(sign) begin
		case(sign)
			4'b0000: segments <= 7'b0000001;  // 0
			4'b0001: segments <= 7'b1001111;  // 1
         4'b0010: segments <= 7'b0010010;  // 2
         4'b0011: segments <= 7'b0000110;  // 3
         4'b0100: segments <= 7'b1001100;  // 4
         4'b0101: segments <= 7'b0100100;  // 5
         4'b0110: segments <= 7'b0100000;  // 6
         4'b0111: segments <= 7'b0001111;  // 7
         4'b1000: segments <= 7'b0000000;  // 8
         4'b1001: segments <= 7'b0000100;  // 9
         4'b1010: segments <= 7'b0001000;  // a
         4'b1011: segments <= 7'b1100000;  // b
         4'b1100: segments <= 7'b0110001;  // c
         4'b1101: segments <= 7'b1000010;  // d
         4'b1110: segments <= 7'b0110000;  // e
         4'b1111: segments <= 7'b0111000;  // f
         default: segments <= 7'b1111111;  // -
		endcase	
	end
	

endmodule

