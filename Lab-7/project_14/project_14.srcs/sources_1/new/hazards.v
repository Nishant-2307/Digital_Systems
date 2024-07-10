`timescale 1ns / 1ps

module hazards(
input A,
input B,
input C,
output f);

//or #5 g1(o1,A,B);
//not G1(n1,A);
//or #8 g2(o2,n1,C);
//and g3(o3,o1,o2);
//not G2(n2,B);
//and #11 g4(o4,A,n2);
//or g5(f,o3,o4);

or g1(o1,A,B);
not G1(n1,A);
or g2(o2,n1,C);
and g3(o3,o1,o2);
not G2(n2,B);
and g4(o4,A,n2);
or g5(f,o3,o4);

endmodule
