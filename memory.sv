
module memory(input[7:0] addr,WR,input clk,memorywrite,memoryread,output logic[7:0] RD);
  logic [255:0] [7:0] Memory;
  
  
  always@(addr,memoryread)begin
    
    Memory [100] <= 8'b10101001;
    Memory [101] <= 8'b0;
    Memory [102] <= 8'b10001101;
    Memory [103] <= 8'b0;
    
    /*
    Memory [100] <= 8'b00101001;
    Memory [101] <= 8'b00101001;
    Memory [102] <= 8'b00001001;
    Memory [103] <= 8'b00111001;
    Memory [104] <= 8'b00101001;
    Memory [105] <= 8'b00101011;
    Memory [106] <= 8'b00011001;
    Memory [107] <= 8'b01001001;
    Memory [108] <= 8'b00000001;  
    Memory [109] <= 8'b00101111;
    Memory [110] <= 8'b00111111;
  	 Memory [111] <= 8'b00101011;
    Memory [112] <= 8'b00010001;
    Memory [113] <= 8'b00011001;
    Memory [114] <= 8'b01100001;
    Memory [115] <= 8'b00001001;
    Memory [116] <= 8'b00100001;
    Memory [117] <= 8'b01110001;
    Memory [118] <= 8'b11000001;
    Memory [119] <= 8'b00001000;
    */
    
    
    RD <= Memory[addr];
  end
  always@(posedge clk) begin
    if (memorywrite)
      Memory[addr] <= WR;
  end
endmodule