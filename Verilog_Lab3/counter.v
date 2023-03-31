module counter(clk, out);
	input clk;                    // 计数时钟
	output reg [2:0] out;             // 计数�?

	always @(posedge clk)  begin  // 在时钟上升沿计数器加1
        if(out<7) begin//计数�?1000B后归0
            out<=out+1'b1;// 功能实现
        end
        else begin
            out<=0;
        end
	end                           
endmodule