module register(clk, rst_n, load, d, q);//clkΪʱ�ӣ�rst_nΪ��λ�ˣ�enΪʹ�ܶˣ�dΪ���룬qΪ�Ĵ������
	parameter WIDTH = 8;
	input clk, rst_n, load;
	input [WIDTH-1:0] d;
	output reg [WIDTH-1:0] q;
	initial begin  
        q=0;
	end
	always @(posedge clk) begin
        if (rst_n) q <=0;//rst_n�ߵ�ƽ��Ч
        else if (load) q <= d;//ʹ�ܶ�����ʱ�Ž�d�����q
	end
endmodule