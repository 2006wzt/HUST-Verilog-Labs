module comparator(A, B, is_equal);//比较A,B,相等时is_equal=1,否则is_equal=0
	parameter WIDTH = 8;
	input [WIDTH-1:0] A, B;
	output is_equal;
	assign is_equal = (A==B)? 1'b1 : 1'b0;
endmodule