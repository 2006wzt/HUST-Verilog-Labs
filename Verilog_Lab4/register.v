module register(clk, rst_n, load, d, q);//clk为时钟，rst_n为复位端，en为使能端，d为输入，q为寄存器输出
	parameter WIDTH = 8;
	input clk, rst_n, load;
	input [WIDTH-1:0] d;
	output reg [WIDTH-1:0] q;
	initial begin  
        q=0;
	end
	always @(posedge clk) begin
        if (rst_n) q <=0;//rst_n高电平有效
        else if (load) q <= d;//使能端作用时才将d输出到q
	end
endmodule