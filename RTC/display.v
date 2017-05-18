`timescale 1ns / 1ps

module display
  (input 				clk_i,
	input 		[3:0] sign0, sign1, sign2, sign3, // sign at display 0,1,2 or 3
	output reg	[6:0]	segments, // segments: a,b,c,d,e,f,g
	output reg 	[3:0] displays);
	
	reg [2:0] select;
	reg[15:0] change = 0;
	reg [3:0] sign;
	
	always @(posedge clk_i) begin
		change = change +1;
		
		if(change == 2000) begin
			case(select)
				0: begin
						displays[3] = 0;
						displays[2] = 0;
						displays[1] = 0;
						displays[0] = 1;
						sign = sign0;
					end
				1: begin
						displays[3] = 0;
						displays[2] = 0;
						displays[1] = 1;
						displays[0] = 0;
						sign = sign1;
					end
				2: begin
						displays[3] = 0;
						displays[2] = 1;
						displays[1] = 0;
						displays[0] = 0;
						sign = sign2;
					end
				3: begin
						displays[3] = 1;
						displays[2] = 0;
						displays[1] = 0;
						displays[0] = 0;
						sign = sign3;
					end
				default begin
						displays[3] = 0;
						displays[2] = 0;
						displays[1] = 0;
						displays[0] = 0;
						sign = sign0;
					end
			endcase
			select = select + 1;
			if(select == 4) 
				select = 0;
			change = 0;
		end
	end
	
	
	always @(sign) begin
		case(sign)
			4'b0000: segments <= 7'b1111110;  // 0 dp last
			4'b0001: segments <= 7'b0110000;  // 1
         4'b0010: segments <= 7'b1101101;  // 2
         4'b0011: segments <= 7'b1111001;  // 3
         4'b0100: segments <= 7'b0110011;  // 4
         4'b0101: segments <= 7'b1011011;  // 5
         4'b0110: segments <= 7'b1011111;  // 6
         4'b0111: segments <= 7'b1110000;  // 7
         4'b1000: segments <= 7'b1111111;  // 8
         4'b1001: segments <= 7'b1111011;  // 9
         /*4'b1010: segments <= 7'b0001000;  // a
         4'b1011: segments <= 7'b1100000;  // b
         4'b1100: segments <= 7'b0110001;  // c
         4'b1101: segments <= 7'b1000010;  // d
         4'b1110: segments <= 7'b0110000;  // e
         4'b1111: segments <= 7'b0111000;  // f*/
         default: segments <= 7'b0000001;  // -
		endcase	
	end
	

endmodule
