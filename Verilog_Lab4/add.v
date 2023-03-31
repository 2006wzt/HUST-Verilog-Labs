module add(a, b,sum);//计算a+b=sum
	parameter WIDTH = 8; //本module内有效，可用于参数传递,即全加器的位宽
	input [WIDTH-1:0] a, b;
	output [WIDTH-1:0] sum;
    assign sum = a + b;
endmodule