`timescale 1ns / 1ps

module shift_register (
  input wire clk,    // Clock input
  input wire reset,  // Reset input
  input wire data_in, // Input data
  output reg [3:0] q  // 4-bit output
);

  always @(posedge clk, negedge reset) begin
    if (!reset)
      q <= 4'b0000;   // Reset to all zeros
    else
      q[0]<=q[1];
      q[1]<=q[2];
      q[2]<=q[3];
      q[3]<=data_in;  // Shift data in using blocking statement
  end

endmodule
