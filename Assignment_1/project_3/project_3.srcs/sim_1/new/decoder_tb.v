`timescale 1ns / 1ps
module decoder_tb();
reg [4:0]a; //5 bit input
reg e;      //enable
reg [3:0]s; //select line
wire [31:0]o;   //32 output ports
wire out;   //final output
wire [7:0]sel;  //to check divisor


decoder uut(a,s,e,o,sel,out);

initial
begin
//You need to input s as the binary representation of the quotient
//example: 2=4'b0010, 3=4'b0011, 4=4'b0100.... ,8=4'b1000, 9=4'b1001
s=4'b0101; 

e=1'b1; //Enabling the decoder

//here are all 32 inputs from 0 to 31. If you want to check till
//a particular range then, you can comment out the inputs below that.
a=5'b00000;
#10;
a=5'b00001;
#10;
a=5'b00010;
#10;
a=5'b00011;
#10;
a=5'b00100;
#10;
a=5'b00101;
#10;
a=5'b00110;
#10;
a=5'b00111;
#10;
a=5'b01000;
#10;
a=5'b01001;
#10;
a=5'b01010;
#10;
a=5'b01011;
#10;
a=5'b01100;
#10;
a=5'b01101;
#10;
a=5'b01110;
#10;
a=5'b01111;
#10;
a=5'b10000;
#10;
a=5'b10001;
#10;
a=5'b10010;
#10;
a=5'b10011;
#10;
a=5'b10100;
#10;
a=5'b10101;
#10;
a=5'b10110;
#10;
a=5'b10111;
#10;
a=5'b11000;
#10;
a=5'b11001;
#10;
a=5'b11010;
#10;
a=5'b11011;
#10;
a=5'b11100;
#10;
a=5'b11101;
#10;
a=5'b11110;
#10;
a=5'b11111;
#10;
$finish();
end
endmodule