module reverse_counter(clk, out);
    input clk;                    // 计数时钟
	output reg [2:0] out;             // 计数�?

	always @(posedge clk)  begin  // 在时钟上升沿计数器加1
        if(out>0) begin//计数�?0000B后归7
            out<=out-1'b1;// 功能实现
        end
        else begin
            out<=7;
        end
	end                           
endmodule