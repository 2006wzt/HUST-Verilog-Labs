module BinToBCD(Bin,Hundreds,Tens,Ones);//二进制转3个BCD�?
    //参数
    parameter DATA_WIDTH=32;//数据位宽
    integer i;
    //输入输出
    input [DATA_WIDTH-1:0]Bin;//输入的二进制�?
    output reg[3:0] Hundreds,Tens,Ones;//输出�?3个BCD�?
    always@(Bin) begin
        Hundreds=4'd0;
        Tens=4'd0;
        Ones=4'd0;
        for(i=DATA_WIDTH-1;i>=0;i=i-1)
        begin
            if(Hundreds>=5)
            Hundreds=Hundreds+3;
            if(Tens>=5)
            Tens=Tens+3;
            if(Ones>=5)
            Ones=Ones+3;

            Hundreds=Hundreds<<1;
            Hundreds[0]=Tens[3];
            Tens=Tens<<1;
            Tens[0]=Ones[3];
            Ones=Ones<<1;
            Ones[0]=Bin[i];
        end
    end
endmodule