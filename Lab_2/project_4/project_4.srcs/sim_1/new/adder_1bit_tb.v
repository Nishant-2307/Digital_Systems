`timescale 1ns / 1ps

module adder_1bit_tb();
reg a,b,cin;
wire sum,carry;

adder_1bit uut(a,b,cin,sum,carry);

initial
begin
a=1'b0; b=1'b0; cin=1'b0;
#10;
a=1'b0; b=1'b0; cin=1'b1;
#10;
a=1'b0; b=1'b1; cin=1'b0;
#10;
a=1'b0; b=1'b1; cin=1'b1;
#10;
a=1'b1; b=1'b0; cin=1'b0;
#10;
a=1'b1; b=1'b0; cin=1'b1;
#10;
a=1'b1; b=1'b1; cin=1'b0;
#10;
a=1'b1; b=1'b1; cin=1'b1;
#10;
$finish();
end
endmodule
