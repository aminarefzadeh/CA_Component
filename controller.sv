module controller(input[5:0] code,input ze,c,rst,output reg pop,push,memorywrite,memoryread,writeReg,selRR2,selALU2,selpc,ldz,ldc,selz,selc,output reg [1:0] selWD,selRet,output reg [2:0]ALUfn);
  always @(ze,c,code,rst)begin
    pop <= 1'b0;
    push <= 1'b0;
    memorywrite <= 1'b0;
    memoryread <= 1'b0;
    writeReg<= 1'b0;
    selRR2<= 1'b0;
    selALU2<= 1'b0;
    selRet<= 2'b00;
    selpc<= 1'b0;
    ldz<= 1'b0;
    ldc<= 1'b0;
    selz <= 1'b0;
    selc <= 1'b0;
    selWD<= 2'b00;
    ALUfn <= 3'b000;
    if (~rst)begin
    if (code[5:4] == 2'b00) begin
      ALUfn <= code[3:1];
      ldz <= 1'b1;
      ldc <= 1'b1;
      selALU2 <= 1'b1;
      writeReg <= 1'b1;
    end
    if (code [5:4] == 2'b01) begin
      ALUfn <= code[3:1];
      ldz <= 1'b1;
      ldc <= 1'b1;
      writeReg <= 1'b1;
    end
    if (code[5:3] == 3'b110) begin
      selz <= 1'b1;
      selc <= 1'b1;
      ldz <= 1'b1;
      ldc <= 1'b1;
      selWD <= 2'b10;
      writeReg <= 1'b1;
    end
    if (code[5:3] == 3'b100) begin
      selRR2 <= 1'b1;
      ALUfn <= 3'b000;
      if (code [2:1] == 2'b00) begin
        memoryread <= 1'b1;
        selWD<= 2'b01;
        writeReg <= 1'b1;
      end
      if (code [2:1] == 2'b01)begin
        memorywrite<= 1'b1;
      end
    end
    if (code[5:3] == 3'b101) begin
      case(code[2:1])
        2'b00 : selpc <= ze?1:0;
        2'b01 : selpc <= ze?0:1;
        2'b10 : selpc <= c?1:0;
        2'b11 : selpc <= c?0:1;
      endcase
    end
    if (code[5:2] == 4'b1110)begin
      selRet <= 2'b10;
      selpc <= 1'b1;
      if (code[1] == 1'b1)
        push <= 1'b1;
    end
    if (code[5:0] == 6'b111100) begin
      pop <= 1'b1;
      selRet <=2'b01;
    end
    end
  end
endmodule