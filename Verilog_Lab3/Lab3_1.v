module Lab3_1(clk,LED);
    input clk;
    output [15:0] LED;
    wire clk_N;
    divider  #(50000000) D1(clk,clk_N);
    assign LED[0]=clk_N;
endmodule