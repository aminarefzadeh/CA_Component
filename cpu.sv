`timescale 1ns/1ns;
module CPU(input clk,rst);
  wire pop,push,memorywrite,memoryread,writeReg,selRR2,selALU2,selpc,ldz,ldc,selz,selc;
  wire[1:0] selWD,selRet;
  wire[2:0] ALUfn;
  wire ze,c;
  wire[5:0] code;
  datapath dp(pop,push,memorywrite,memoryread,writeReg,selRR2,selALU2,selpc,ldz,ldc,selz,selc,selWD,selRet,ALUfn,clk,rst, ze,c,code);
  controller cl( code, ze,c,rst, pop,push,memorywrite,memoryread,writeReg,selRR2,selALU2,selpc,ldz,ldc,selz,selc,selWD,selRet,ALUfn);
endmodule

module CPU_TB();
  logic clk=1'b0,rst=1'b1;
  CPU U1(clk,rst); 
  initial repeat(1000) #5 clk=~clk;
  initial begin
    #10
    rst = 1'b0;
  end
endmodule