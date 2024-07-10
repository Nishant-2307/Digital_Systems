`timescale 1ns / 1ps

module synch_up_tb();

reg t;
reg rst;
reg clk;
wire [3:0]q;
reg en;
reg sel1;
reg sel2;
synch_up uut(clk,rst, t,sel1,sel2,q,en);

initial
begin
clk=0;
    forever #5 clk=~clk;
end

initial
begin
en=1;
t=1;
sel1=0;
sel2=0;
rst=0;
clk=1;
#5;
rst=1;
t=1;
#300;
en=0;
end
endmodule
