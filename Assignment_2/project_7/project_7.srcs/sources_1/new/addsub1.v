`timescale 1ns / 1ps

module addsub1(
  input [7:0] a,
  input [7:0] b,
  input c,
  output co,
  output [7:0] sum,
  input sel,
  output [8:0] outp
);

  wire c1, c2, c3, c4, c5, c6, c7,c8;

      fulladder a1(.a(a[0]), .b(b[0]), .c(sel), .sum(sum[0]), .co(c1),.sel(sel));
      fulladder a2(.a(a[1]), .b(b[1]), .c(c1), .sum(sum[1]), .co(c2),.sel(sel));
      fulladder a3(.a(a[2]), .b(b[2]), .c(c2), .sum(sum[2]), .co(c3),.sel(sel));
      fulladder a4(.a(a[3]), .b(b[3]), .c(c3), .sum(sum[3]), .co(c4),.sel(sel));
      fulladder a5(.a(a[4]), .b(b[4]), .c(c4), .sum(sum[4]), .co(c5),.sel(sel));
      fulladder a6(.a(a[5]), .b(b[5]), .c(c5), .sum(sum[5]), .co(c6),.sel(sel));
      fulladder a7(.a(a[6]), .b(b[6]), .c(c6), .sum(sum[6]), .co(c7),.sel(sel));
      fulladder a8(.a(a[7]), .b(b[7]), .c(c7), .sum(sum[7]), .co(c8),.sel(sel));
      assign co = (sel == 1'b1) ? ~c8 : c8;
      graycode a9(.a(sum),.c(co),.out(outp),.sel(sel));
endmodule
