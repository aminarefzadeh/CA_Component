module pc(input[11:0] in,input clk,rst,output logic[11:0] pc);
  always@(posedge clk,posedge rst)begin
    if (rst)
      pc <= 12'b0;
    else
      pc <= in;
  end
endmodule
    
module pc_testbench();
  logic clk=1;
  logic rst;
  logic [18:0] in=105;
  wire [18:0] out;
  pc element(in,clk,rst,out);
  initial repeat(50)begin #5 clk=~clk; end
  initial repeat(12)begin #20 in = in+1 ; end
  initial begin
    rst <= 1'b1;
    #6
    rst <=0;
  end
endmodule