module instructionMem(input[11:0] addr,input rst,output logic[18:0] ins);
  logic[4095:0] [18:0] Mem;
  
  assign Mem[0] = {3'b100, 2'b00, 3'b001, 3'b000, 8'd100};
  assign Mem[1] = {3'b100, 2'b00, 3'b010, 3'b000, 8'd102};
	assign Mem[2] = {2'b00, 3'b000, 3'b011, 3'b001, 3'b010, 5'b00000}; //ADD
	assign Mem[3] = {3'b100, 2'b01, 3'b011, 3'b000, 8'd104}; // STORE
	assign Mem[4] = {3'b100, 2'b00, 3'b001, 3'b000, 8'd101};
	assign Mem[5] = {3'b100, 2'b00, 3'b010, 3'b000, 8'd103};
	assign Mem[6] = {2'b00, 3'b001, 3'b011, 3'b001, 3'b010, 5'b00000}; //ADDC
	assign Mem[7] = {3'b100, 2'b01, 3'b011, 3'b000, 8'd105}; // STORE
	
	/*
	assign Mem[0] = 19'b0000011100000000000;  
  assign Mem[1] = 19'b0000000100000000000;  
  assign Mem[2] = 19'b0101001100100010100;  
  assign Mem[3] = 19'b1010000000000000110;  
  assign Mem[4] = 19'b1000001000101100100;  
  assign Mem[5] = 19'b0001001111101000000; 
  assign Mem[6] = 19'b1011100000000000001;  
  assign Mem[7] = 19'b0000011101000000000;  
  assign Mem[8] = 19'b0100000100100000001;  
  assign Mem[9] = 19'b1110000000000000010;  
  assign Mem[10] = 19'b0000000000000000000;
  */
	
  always@(addr,rst)begin
    if (rst)
      ins <= Mem[0];
    else 
      ins <= Mem[addr];
  end
endmodule
