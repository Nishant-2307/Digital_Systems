`timescale 1ns / 1ps

module addsub1_tb();
reg [7:0]a,b;
reg cin;
reg sel;
wire [7:0]sum;
wire carry;
wire [8:0]outp;

addsub1 uut(a, b, cin, carry, sum, sel, outp);

initial
begin
sel=0; // if 1, then subtraction and if 0, then adder
a=1; b=0; cin=0;
#10;
a=150; b=125; cin=0;
#10;
a=60; b=70; cin=0;
#10;
sel=1; // if 1, then subtraction and if 0, then adder
a=253; b=255; cin=0;
#10;
a=17; b=12; cin=0;
#10;
a=60; b=70; cin=0;
#10;
$finish();
end
endmodule