`timescale 1ns / 1ps

module asynch(
input clk,
input wire rst,
input t,
output [3:0]q);

toggle a1(.clk(clk),.rst(rst),.t(t),.q(q[0]));
toggle a2(.clk(~q[0]),.rst(rst),.t(t),.q(q[1]));
toggle a3(.clk(~q[1]),.rst(rst),.t(t),.q(q[2]));
toggle a4(.clk(~q[2]),.rst(rst),.t(t),.q(q[3]));

endmodule
