module mux2_1(out, a, b, sel) ;//2路�?�择�?
	parameter WIDTH = 8;
	output [WIDTH-1:0] out;
	input [WIDTH-1:0] a, b;
	input sel;
	assign out = sel == 0? a: b ;//sel=0时，输出a，否则输出b
endmodule