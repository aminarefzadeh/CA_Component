`timescale 1ns/1ns;
module shiftReg(input[7:0] Data,input[2:0]sc,input[1:0]fn,output logic[7:0] out,output logic c,z);
  logic carry;
  always@(Data,sc,fn)begin
    if (fn == 2'b00) begin
      //left shifting
      for (int i=0 ; i < 8-sc ; i++) begin
        out[i+sc] <= Data[i];
      end
      for (int i=0; i < sc ; i++) begin
        out[i] <= 1'b0;
      end
      c <= Data[8-sc];
    end
    
    if (fn == 2'b01) begin
      //right shifting
      for (int i=sc ; i < 8 ;i++) begin
        out[i-sc] <= Data[i];
      end
      for (int i=7 ; i>7-sc ; i--) begin
        out[i] <= 1'b0;
      end
      c <= Data[sc-1];
    end
    
    if (fn == 2'b10) begin
      //left rotation
      for (int i=0 ; i<8-sc ; i++) begin
        out[i+sc] <= Data[i];
      end
      for (int i=0; i<sc ; i++) begin
        out[i] <= Data[8-sc+i];
      end
    end

    if (fn == 2'b11) begin
      //right rotation
      for (int i=sc ; i < 8 ;i++) begin
        out[i-sc] <= Data[i];
      end
      for (int i=7 ; i>7-sc ; i--) begin
        out[i] <= Data[i+sc-8];
      end
    end
  end
  assign z = out?0:1;
endmodule

module shift_testbench();
  reg[7:0] Data=8'b0;
  reg[2:0] sc=3'b001;
  reg[1:0] fn=2'b0;
  wire[7:0] out;
  wire z,c;
  shiftReg SHR(Data,sc,fn,out,c,z);
  initial begin
    #5
    Data <= 8'b10010010;
    #5
    sc <= 3'b010;
    #5
    fn <= 2'b01;
    #5
    Data <= 8'b00110110;
    #5
    fn <= 2'b11;
    #5
    sc <= 3'b101;
    #5
    sc <= 3'b0;
    #5
    sc <=3'b0;
  end
endmodule