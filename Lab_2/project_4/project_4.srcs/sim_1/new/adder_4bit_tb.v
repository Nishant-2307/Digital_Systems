`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 09:03:23
// Design Name: 
// Module Name: adder_4bit_tb
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


module adder_4bit_tb();
reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]sum;
wire carry;

adder_4bit uut(a,b,cin,sum,carry);

initial
begin
a=4'b0000; b=4'b0000; cin=0;
#10;
a=4'b1001; b=4'b0101; cin=0;
#10;
a=4'b0011; b=4'b0110; cin=0;
#10;
a=4'b0100; b=4'b0010; cin=0;
#10;
$finish();
end
endmodule
