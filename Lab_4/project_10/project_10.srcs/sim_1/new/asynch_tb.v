`timescale 1ns / 1ps


module asynch_up_tb();

reg t;
reg rst;
reg clk;
wire [3:0]q;
asynch uut(clk,rst,t,q);

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
#107;
rst=0;
t=1;
#150;
$finish();
end
endmodule
