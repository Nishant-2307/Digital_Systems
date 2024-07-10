`timescale 1ns / 1ps


module graycode_tb();

reg [7:0]a;
reg c;
wire out[8:0];

graycode uut(a,c,out);
initial
begin

end
endmodule
