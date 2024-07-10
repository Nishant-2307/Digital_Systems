`timescale 1ns / 1ps

module bin_mul_tb();
reg [8:0]A;
reg [8:0]B;
wire [15:0]out;

binary_multiplier uut(A,B,out);

initial
begin
A=8'b01010111;
B=8'b10101100;
#5;
A=8'b01110110;
B=8'b10110001;
#5;
A=8'b00001101;
B=8'b11001101;
#5;
A=8'b11111100;
B=8'b11110101;
#5;
$finish();
end

endmodule
