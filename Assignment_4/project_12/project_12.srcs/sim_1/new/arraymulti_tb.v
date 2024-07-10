`timescale 1ns / 1ps
module arraymulti_tb();
reg [8-1:0]a;
reg [8-1:0]b;
wire [2*8-1:0]p;

integer i,j;
arraymulti uut(a,b,p);
initial 
begin

for (i=0;i<256;i=i+1)
begin
for(j=0;j<256;j=j+1)
begin
a=i;
b=j;
#10;
end
end

$finish();
end
endmodule


