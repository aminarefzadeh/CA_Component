
`timescale 1ns/1ns
module mux2_12(input[11:0] a , b ,input sel , output[11:0] out);
	assign out = (sel) ? b : a ;
endmodule

module mux2_8(input[7:0] a , b , input sel , output[7:0] out);
	assign out = (sel) ? b : a ;
endmodule

module mux2_3(input[2:0] a , b , input sel , output[2:0] out);
	assign out = (sel) ? b : a ;
endmodule

module mux2_1(input a , b , input sel , output out);
	assign out = (sel) ? b : a ;
endmodule

module mux3(input[7:0] a , b , c,input[1:0] sel,output[7:0] out);
  assign out = (sel == 2'b00)?a:(sel == 2'b01)? b:c;
endmodule

module mux3_12(input[11:0] a , b , c,input[1:0] sel,output[11:0] out);
  assign out = (sel == 2'b00)?a:(sel == 2'b01)? b:c;
endmodule
  
  
   