module stack(input[11:0] in,input push,pop,clk,rst,output logic[11:0] out);
  logic[7:0][11:0] memory;
  always@(posedge clk,posedge rst)begin
    if (rst)
      memory[0] <= 12'b0;
    else begin
      if(pop)begin
        out <= memory[0];
        for (int i=1; i<8; i++)begin
          memory[i-1] <= memory[i];
        end
        memory[7] <= 12'b0;
      end
      else if (push)begin
        for (int i=0; i<6; i++)begin
          memory[7-i] <= memory[6-i];
        end
        memory[0] <= in;
      end
    end
  end
endmodule
