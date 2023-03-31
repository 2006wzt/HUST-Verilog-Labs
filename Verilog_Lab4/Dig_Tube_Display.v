module Dig_Tube_Display(SUM_OUT,CLK,SEG,AN);
    //参数
    parameter DATA_WIDTH=32;//数据位宽
    //输入输出
    input CLK;
    input [DATA_WIDTH-1:0]SUM_OUT;//计算结果
    output [7:0]SEG;//SEG表示输出的�?�，AN表示选择哪个数码管进行输�?
    output [7:0]AN;
    //线路
    wire CLK_N;//高频时钟信号
    wire [3:0]Hundreds,Tens,Ones,data;//BCD码和显示器输出数�?
    wire [2:0]out;//计数器输出，该数�?0-2间循�?
    //实例�?
    divider  #(50000) D(CLK,CLK_N);//获得�?个高频信号clk_N
    BinToBCD #(32) BCD(SUM_OUT,Hundreds,Tens,Ones);//二进制转BCD码，不妨用高频信�?
    counter(CLK_N,out);//高频计数�?
    decoder3_8(out, AN);//3-8译码器，选择哪个数码管输出数�?
    display(out,Hundreds,Tens,Ones,data);
    pattern(data, SEG);//7段译码器,根据显示器的选择输出数字
endmodule