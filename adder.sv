`timescale 1ns/1ns
module adder_1(input[11:0] a ,output[11:0] out);
	logic[11:0] b = 12'b000000000001;
	assign out = a + b;
endmodule

module adder(input[11:0] a , b , output[11:0] out);
	assign out = a + b ;
endmodule