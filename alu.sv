`timescale 1ns/1ns
module alu(input[2:0] fun , input[7:0] a,b ,input cin , output logic[7:0] out , output logic zero,cout);
	always @(fun,a,b,cin)begin
    case(fun)
      3'b000 : {cout,out} = a + b ;
      3'b001 : {cout,out} = a + b + cin;
      3'b010 : {cout,out} = a - b;
		  3'b011 : {cout,out} = a - b + cin;
		  3'b100 : out = a & b;
		  3'b101 : out = a | b;
		  3'b110 : out = a ^ b;
		  3'b111 : out = ~(a & b);
    endcase
	end
  assign zero = (out == 8'b0) ? 1 : 0;
endmodule