`timescale 1ns / 1ps

module hazards_tb();
reg A;
reg B;
reg C;
wire f;

hazards uut(A,B,C,f);
initial
begin

A=0;
B=0;
C=0;
#50;
A=1;
B=0;
C=0;
#80;

//A=0;
//B=1;
//C=1;
//#50;
//A=1;
//B=1;
//C=1;
//#80;

$finish();
end
endmodule
