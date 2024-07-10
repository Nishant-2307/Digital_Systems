`timescale 1ns / 1ps
module shift_tb();

reg clk;
reg [3:0]q;
reg sil;
reg sir;
reg [1:0]m;
reg en;
wire [3:0]qshift;

shfit uut(clk,q,m,sir,sil,en,qshift);

initial
begin
clk=0;
    forever #5 clk=~clk;
end

initial
begin
clk=1;
m=2'b00;
en=1;
sil=0;
sir=0;
q=4'b1001;
#10;
en=0;
#5;
#15;
m=2'b10;
sil=1;
#10;
sil=0;
#5;
sil=1;
#15;
m=2'b01;
sir=0;
#15;
sir=1;
#5;
sir=0;
#10;
m=2'b11;
#50;
m=2'b00;
#22;
$finish();
end

endmodule
