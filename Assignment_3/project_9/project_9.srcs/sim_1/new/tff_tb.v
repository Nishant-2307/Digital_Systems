`timescale 1ns / 1ps

module tff_tb();
reg t,clk,rst;
wire q;

tff uut(clk,rst,t,q);

initial
begin 
clk=0;
    forever #5 clk=~clk;
end

initial
begin
t=1;
rst=0;
clk=1;
#5;
rst=1;
#10;
t=0;
#2;
t=1;
#20;
rst=0;
#5;
rst=1;
t=0;
#16;
t=1;
#5;
$finish();
end
endmodule
