module ff(input in,ld,clk,rst,output logic out);
  always@(posedge clk,posedge rst) begin
    if(rst)
      out <= 1'b0;
    else if(ld)
      out <= in;
  end
endmodule

module ff_testbench();
  logic clk=1;
  logic rst;
  logic ld=0,in=1;
  wire out;
  ff element(in,ld,clk,rst,out);
  initial repeat(50)begin #5 clk=~clk; end
  initial repeat(12)begin #20 in=~in; end
  initial begin
    rst <= 1'b1;
    #5
    rst <=0;
    ld <=1;
  end
endmodule
    
