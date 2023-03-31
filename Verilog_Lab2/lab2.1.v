module _7Seg_Driver_Direct(SW, CA, CB, CC, CD, CE, CF, CG, DP, AN, LED);
	input [15:0] SW;                          // 16位拨动开�?
	output CA, CB, CC, CD, CE, CF, CG, DP;  // 7段数码管驱动，低电平有效
	output [7:0] AN;                          // 7段数码管片�?�信号，低电平有�?
	output [15:0] LED;                        // 16位LED显示，高电平有效
	
	assign {CA,CB,CC,CD,CE,CF,CG,DP}=SW[7:0];
	assign LED[15:0]=SW[15:0];
	assign AN[7:0]=SW[15:8];
endmodule
