`timescale 1ns / 1ps

module fulladder_tb();
reg a,b,cin,sel;
wire co,sum;

fulladder uut(a,b,cin,co,sum,sel);
initial
begin
sel=1'b1;
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
