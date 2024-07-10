`timescale 1ns / 1ps

module adder_1bit(a,b,cin,sum,carry);
input a,b,cin;
output carry,sum;

xor(f1,a,b);
xor(sum,f1,cin);

and(f2,a,b);
and(f3,f1,cin);

or(carry,f3,f2);
endmodule
