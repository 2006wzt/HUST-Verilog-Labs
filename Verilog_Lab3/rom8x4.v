module rom8x4(addr, data);
	input [2:0] addr;           // 地址
	output reg [3:0] data;          // 地址addr处存储的数据 

	reg [3: 0] mem [7: 0];      //  8�?4位的存储�?

	initial   begin             // 初始化存储器
        mem[0]<=4'b0000;
        mem[1]<=4'b0010;
        mem[2]<=4'b0100;
        mem[3]<=4'b0110;
        mem[4]<=4'b1000;
        mem[5]<=4'b1010;
        mem[6]<=4'b1100;
        mem[7]<=4'b1110;
	end     
    always @(addr) begin
        case(addr[2:0])// 读取addr单元的�?�输�?    
            3'b000:data[3:0]<=mem[0];
            3'b001:data[3:0]<=mem[1];
            3'b010:data[3:0]<=mem[2];
            3'b011:data[3:0]<=mem[3];
            3'b100:data[3:0]<=mem[4];
            3'b101:data[3:0]<=mem[5];
            3'b110:data[3:0]<=mem[6];
            3'b111:data[3:0]<=mem[7];
        endcase
    end
endmodule