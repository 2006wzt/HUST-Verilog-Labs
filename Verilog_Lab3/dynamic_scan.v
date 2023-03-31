module dynamic_scan(clk,  SEG, AN);
	input clk;              // 系统时钟
	output [7:0] SEG;  		// 分别对应CA、CB、CC、CD、CE、CF、CG和DP
	output [7:0] AN;        // 8位数码管片选信号
	wire clk_N;//1HZ信号
    wire [2:0]out; //计数器输出
    wire [4:0]data;//只读存储器输出
    divider  #(50000000) D1(clk,clk_N);
    counter(clk_N,out);//计数器
    rom8x4(out, data);//只读存储器
    decoder3_8(out, AN);//3-8译码器
    pattern(data, SEG);//7段译码器        
endmodule