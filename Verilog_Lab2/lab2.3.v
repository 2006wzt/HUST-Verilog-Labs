module Decoder(SW_1,SEG_1);
input [15:0] SW_1;       // 16位拨动开�?
output reg[7:0] SEG_1;      // 7段数码管驱动，低电平有效
always@(SW_1) begin
	    case (SW_1[3:0])
	        4'b0000:SEG_1=8'b11000000;
            4'b0001:SEG_1=8'b11111001;
            4'b0010:SEG_1=8'b10100100;
            4'b0011:SEG_1=8'b10110000;
            4'b0100:SEG_1=8'b10011001;
            4'b0101:SEG_1=8'b10010010;
            4'b0110:SEG_1=8'b10000010;
            4'b0111:SEG_1=8'b11111000;
            4'b1000:SEG_1=8'b10000000;
            4'b1001:SEG_1=8'b10011000;
            4'b1010:SEG_1=8'b10001000;
            4'b1011:SEG_1=8'b10000011;
            4'b1100:SEG_1=8'b11000110;
            4'b1101:SEG_1=8'b10100001;
            4'b1110:SEG_1=8'b10000110;
            4'b1111:SEG_1=8'b10001110;
        	endcase
	end  
endmodule

module Selector(SW_1,AN_1);
input [15:0] SW_1;       // 16位拨动开�?
output reg[7:0] AN_1;       // 7段数码管片�?�信号，低电平有�?
always@(SW_1) begin
	    case (SW_1[15:13])
		3'b000:AN_1=8'b00000001;
		3'b001:AN_1=8'b00000010;
		3'b010:AN_1=8'b00000100;
		3'b011:AN_1=8'b00001000;
		3'b100:AN_1=8'b00010000;
		3'b101:AN_1=8'b00100000;
		3'b110:AN_1=8'b01000000;
		3'b111:AN_1=8'b10000000;
        endcase
	end  
endmodule

module _7Seg_Driver_Choice(SW, SEG, AN, LED);
	input [15:0] SW;       // 16位拨动开�?
	output [7:0] SEG;      // 7段数码管驱动，低电平有效
	output [7:0] AN;       // 7段数码管片�?�信号，低电平有�?
	output [15:0] LED;     // 16位LED显示
	assign LED[15:0]=SW[15:0];
	Decoder(SW,SEG);
	Selector(SW,AN);
endmodule
