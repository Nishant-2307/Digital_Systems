`timescale 1ns / 1ps


module sync_sr(input clk, input rst, input sel1, input sel2, output [3:0]q, input en,input t,input [1:0]m, input sil,input sir, output [3:0]qshift);
synch_up a1(.clk(clk),.rst(rst),.t(t),.sel1(sel1),.sel2(sel2),.q(q),.en(en));

shfit a2(.clk(clk),.q(q),.m(m),.sir(sir),.sil(sil),.en(en),.qshift(qshift));

endmodule
