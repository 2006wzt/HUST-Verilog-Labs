module Datapath(CLK,RST,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,NEXT_ZERO,SUM_OUT);
    //参数
    parameter DATA_WIDTH=32;//数据位宽
    parameter ADDR_WIDTH=4;//地址位宽
    //输入输出
    input CLK,RST,LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL;
    output NEXT_ZERO;//链尾标志
    output [DATA_WIDTH-1:0]SUM_OUT;//求和结果
    //线路
    wire [DATA_WIDTH-1:0] memory_data;//存储器输出数�?
    wire [DATA_WIDTH-1:0] sum_data,next_data,add1_data,add2_data;
    wire [DATA_WIDTH-1:0] mux1_data,mux2_data,mux3_data;
    //实例�?
    
    dual_port_ram #(DATA_WIDTH,ADDR_WIDTH) Memory( mux3_data, CLK, memory_data);
    add #(DATA_WIDTH) ADD1(sum_data,memory_data,add1_data);
    add #(DATA_WIDTH) ADD2(next_data,1,add2_data);
    mux2_1 #(DATA_WIDTH) MUX1(mux1_data, 0, add1_data, SUM_SEL);
    mux2_1 #(DATA_WIDTH) MUX2(mux2_data, 0, memory_data, NEXT_SEL);
    mux2_1 #(DATA_WIDTH) MUX3(mux3_data, next_data, add2_data, A_SEL);
    register #(DATA_WIDTH) SUM(CLK, RST, LD_SUM, mux1_data, sum_data);
    register #(DATA_WIDTH) NEXT(CLK, RST, LD_NEXT, mux2_data, next_data);
    comparator #(DATA_WIDTH) CMP(mux2_data, 0, NEXT_ZERO);
    assign SUM_OUT=sum_data;
endmodule