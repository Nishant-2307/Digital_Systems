`timescale 1ns / 1ps

module clock_divider(
input main_clk,
output slow_clk
);
reg [31:0] counter;
always@ (posedge main_clk)
begin
    counter <=counter+1;
end
assign slow_clk=counter[27];
endmodule

module counter (
  input main_clk,
  input reset,
  input up,
  input mode_select,
  output reg [3:0] c
);

wire slow_clk;
clock_divider inst(main_clk,slow_clk);

always @(posedge slow_clk or negedge reset) 
begin
  if (!reset) 
  begin
    c <= 4'b0000;
  end 
  else if (up) 
  begin
    if (mode_select) begin  // BCD mode
      if (c < 4'b1001) begin
        c <= c + 1;
      end 
      else 
      begin
        c <= 4'b0000;
      end
    end 
    else 
    begin  // Binary mode
      if (c < 4'b1111) 
      begin
        c <= c + 1;
      end 
      else 
      begin
        c <= 4'b0000;
      end
    end
  end 
  else if (!up) 
  begin
    if (mode_select) 
    begin  // BCD mode
      if (c > 4'b0000) 
      begin
        c <= c - 1;
      end 
      else 
      begin
        c <= 4'b1001;
      end
    end 
    else 
    begin  // Binary mode
      if (c > 4'b0000) begin
        c <= c- 1;
      end else begin
        c <= 4'b1111;
      end
    end
  end
end

endmodule
