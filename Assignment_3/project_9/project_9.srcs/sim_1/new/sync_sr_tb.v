`timescale 1ns / 1ps

module sync_sr_tb();
reg clk;
wire [3:0]q;
reg rst;
reg t;
reg sil;
reg sir;
reg en;
reg [1:0]m;
reg sel1;
reg sel2;
wire [3:0]qshift;

sync_sr uut(clk,rst,sel1,sel2,q,en,t,m,sil,sir,qshift);


initial
begin
clk=0;
    forever #5 clk=~clk;
end

initial
begin
t=1;
m=2'b00;
rst=0;
clk=1;
//BCD Down Count
en=1;
sel1=1;
sel2=1;
sil=0;
sir=0;
#7;
rst=1;
#82;
//Counter stopped, shift register started
en=0;
m=2'b00;
#12;
m=2'b10;
sil=1;
#14;
sil=0;
#16;
sil=1;
#17;
m=2'b01;
sir=0;
#17;
sir=1;
#18;
sir=0;
#14;
m=2'b11;
#50;
m=2'b00;
#22;
//BCD Up Counter
en=1;
sel1=0;
sel2=1;
sil=0;
sir=0;
#7;
rst=0;
#27;
rst=1;
#102;
//Counter stopped, shift register started
en=0;
m=2'b00;
#12;
m=2'b10;
sil=1;
#14;
sil=0;
#16;
sil=1;
#17;
m=2'b01;
sir=0;
#17;
sir=1;
#18;
sir=0;
#14;
m=2'b11;
#50;
m=2'b00;
#22;
//Binary Down Counter
en=1;
sel1=1;
sel2=0;
sil=0;
sir=0;
#7;
rst=1;
#82;
//Counter stopped, shift register started
en=0;
m=2'b00;
#12;
rst=0;
#17;
m=2'b10;
sil=1;
#14;
sil=0;
#16;
sil=1;
#17;
rst=1;
m=2'b01;
sir=0;
#17;
sir=1;
#18;
sir=0;
#14;
m=2'b11;
#50;
m=2'b00;
#22;
//Binary Up Counter
en=1;
sel1=0;
sel2=0;
sil=0;
sir=0;
#7;
rst=1;
#72;
//Counter stopped, shift register started
en=0;
m=2'b00;
#12;
m=2'b10;
sil=1;
#14;
sil=0;
#16;
sil=1;
#17;
m=2'b01;
sir=0;
#17;
sir=1;
#18;
sir=0;
#14;
m=2'b11;
#40;
m=2'b00;
#52;
$finish();
end

endmodule
