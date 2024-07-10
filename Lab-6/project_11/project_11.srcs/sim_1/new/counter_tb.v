`timescale 1ns / 1ps

module counter_tb();
reg clk;
reg reset;
reg up;
reg mode_select;
wire [3:0] c;

counter uut(clk,reset,up,mode_select,c);

initial
begin
clk=0;
 forever #5 clk=~clk;
end

initial
begin
reset=0;
clk=1;

mode_select=1;
up=1;
#100;
reset=1;
#200;
//BCD Up Counter
mode_select=0;
up=1;
#100;
reset=0;
#200;
reset=1;
#102;

mode_select=1;
up=0;
#100;
reset=1;
#200;


mode_select=0;
up=0;
#7;
reset=1;
#72;


$finish();
end
endmodule
