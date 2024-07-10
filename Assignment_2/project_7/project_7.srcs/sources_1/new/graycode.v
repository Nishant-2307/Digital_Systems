`timescale 1ns / 1ps

module graycode(
  input [7:0] a,
  input c,
  output [8:0]out,
  input sel
);

or(out[8],c,c);
xor(out[7],c,a[7]);
xor(out[6],a[7],a[6]);
xor(out[5],a[6],a[5]);
xor(out[4],a[5],a[4]);
xor(out[3],a[4],a[3]);
xor(out[2],a[3],a[2]);
xor(out[1],a[2],a[1]);
xor(out[0],a[1],a[0]);

endmodule
