module display(out,Hundreds,Tens,Ones,data);//根据out选择合�?�的数显�?
    input [2:0]out;
    input [3:0]Hundreds,Tens,Ones;
    output reg[3:0]data;
    always@(out) begin
        case(out[2:0])// 读取addr单元的�?�输�?    
            3'b000:data=Ones;
            3'b001:data=Tens;
            3'b010:data=Hundreds;
            default:data=4'b0000;
        endcase
    end
endmodule