module Lab3_2(clk,LED);
    input clk;
    output [15:0] LED;
    wire clk_N;
    wire [2:0] out;
    divider  #(50000000) D1(clk,clk_N);
    counter(clk_N,out);
    assign LED[2:0]=out[2:0];
endmodule