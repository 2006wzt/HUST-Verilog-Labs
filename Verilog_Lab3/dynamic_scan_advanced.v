module dynamic_scan_advanced(clk, SW,SEG, AN);
	input clk;              // 系统时钟
    input [2:0] SW;//控制左右的开�?
	output [7:0] SEG;  		// 分别对应CA、CB、CC、CD、CE、CF、CG和DP
	output reg[7:0] AN;        // 8位数码管片�?�信�?
	wire clk_N;//1HZ信号
	wire clk_N1;
    wire [2:0]out1; //计数器输�?
    wire [2:0]out2;
    wire [2:0]out3;
    reg [4:0]data;//只读存储器输�?
    wire [4:0]data1;
    wire [4:0]data2;
    wire [4:0]data3;
    wire [7:0]AN1;
    wire [7:0]AN2;
    wire [7:0]AN3;
    divider  #(50000000) D1(clk,clk_N);
    divider  #(50000) D2(clk,clk_N1);
    counter(clk_N,out1);//������
    reverse_counter(clk_N, out2);
    counter(clk_N1,out3);
    decoder3_8(out1, AN1);
    decoder3_8(out2, AN2);
    decoder3_8(out3, AN3);
    rom8x4(out1, data1);//只读存储�?
    rom8x4(out2, data2);//只读存储�?
    rom8x4(out3, data3);//只读存储�
    always @(SW) begin
        if(SW==3'b001) begin
            AN[7:0]=AN1[7:0];
            data[4:0]=data1[4:0];
        end
        else if(SW==3'b100) begin
            AN[7:0]=AN2[7:0];
            data[4:0]=data2[4:0];
        end
        else if(SW==3'b010) begin
            AN[7:0]=AN3[7:0];
            data[4:0]=data3[4:0];
        end
        else begin
            AN=8'b11111111;
            data[4:0]=data1[4:0];
        end
    end
    pattern(data, SEG);//7段译码器x        
endmodule