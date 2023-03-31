module dual_port_ram( read_addr, clk, data);
	parameter DATA_WIDTH=32;//数据位宽
    parameter ADDR_WIDTH=4;//地址位宽
    input [DATA_WIDTH-1:0] read_addr;//读地�?，其有效位宽只有ADDR_WIDTH�?
	input clk;
    output reg[DATA_WIDTH-1:0] data ;//输出�?
    reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];//存储寄存�?
	initial
		$readmemh("E:/Verilog_Lab4/ram_init.txt", ram); //从文件中读取数据到存储器ram
    always @ (negedge clk) begin
        data <= ram[read_addr];//读出数据到data
    end
endmodule