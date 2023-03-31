module divider(clk, clk_N);
	input clk;                      // 系统时钟
	output reg clk_N;                   // 分频后的时钟
	parameter N = 50000000;      // 1Hz的时�?,N=fclk/fclk_N
	reg [31:0] counter;             /* 计数器变量，通过计数实现分频。当计数器从0计数�?(N/2-1)时，
									输出时钟翻转，计数器清零 */
    always @(posedge clk)  begin    // 时钟上升�?
   		counter <= counter+1'b1;                      // 功能实现
        if(counter==N)
            begin
                clk_N<=~clk_N;
                counter<=0;
            end
	end                           
endmodule