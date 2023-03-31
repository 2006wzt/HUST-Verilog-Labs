module Auto_Cal_With_Tube(CLK,RST,START,DONE,SEG,AN);
    //输入输出
    input CLK,RST,START;//时钟信号，复位信号，启动信号
    output DONE;//运算完成标志
    output [7:0]SEG;//数码管输出控制
    output [7:0]AN;//片选信号
    //线路
    wire NEXT_ZERO,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,CLK_1Hz;
    wire [31:0]SUM_OUT;
    //实例化
    divider  #(50000000) D1(CLK,CLK_1Hz);//产生1Hz时钟信号
    FSM Controller(CLK_1Hz,RST,START,NEXT_ZERO,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE);
    Datapath #(32,4) Cal(CLK_1Hz,RST,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,NEXT_ZERO,SUM_OUT);
    Dig_Tube_Display#(32) Dig_Tube(SUM_OUT,CLK,SEG,AN);//此处还用原来的时钟信号?
endmodule