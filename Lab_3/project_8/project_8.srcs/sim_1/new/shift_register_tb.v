`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2024 08:32:56
// Design Name: 
// Module Name: shift_register_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_register_tb();
reg clk;
reg reset;
reg data_in;
wire [3:0]q;

shift_register uut(clk,reset,data_in,q);

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
reset=0;

data_in=1'b0;
#10;
reset=1;
data_in=1'b1;
#10;
data_in=1'b0;
#10;
data_in=1'b0;
#10;
data_in=1'b1;
#10;
data_in=1'b0;
#10;
data_in=1'b1;
#10;
$finish();
end
endmodule
