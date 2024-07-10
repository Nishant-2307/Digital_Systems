`timescale 1ns / 1ps

module synch_up(
input clk,      //clock signal
input wire rst, //reset signal
input t,        //toggle value, will be kept 1 as synchronous counter
input sel1,     //select signal for choosing b/w Up(0) and Down(1) counter
input sel2,     //select signal for choosing b/w BCD(1) and Binary(0)
output [3:0]q,  //4-bit output 
input en        //enable signal
);

tff a1(.clk(clk),.rst(rst),.t(t),.q(q[0]),.en(en));
and(f1,q[0],q[0]);
and(e,q[0],~sel1);
and(f,~q[0],sel1);
or(g2,e,f);

and(g3,g2,~sel2);
and(o2,~f4,f1,sel2,~sel1);
or(g1,g3,o2);

or(g10,f2,f3,f4);
and(g11,g10,~q[0],sel1,sel2);
or(g22,g1,g11);

tff a2(.clk(clk),.rst(rst),.t(g22),.q(q[1]),.en(en));
and(f2,q[1],q[1]);
and(h,q[1],~sel1);
and(i,~q[1],sel1);
or(j1,h,i);

and(s1,g2,j1);

and(s10,f4,~f1,sel1,sel2);
and(s9,~f1,~f2,f3,sel1,sel2);
or(s11,s9,s10);
and(s12,sel1,sel2);
and(s13,~s12,s1);
and(s14,s12,s11);
or(s15,s13,s14);

tff a3(.clk(clk),.rst(rst),.t(s15),.q(q[2]),.en(en));

and(f3,q[2],q[2]);
and(k,q[2],~sel1);
and(l,~q[2],sel1);
or(m,k,l);

and(s4,s1,m);
and (o1,f4,f1,sel2);
or(h1,o1,s4);

and(h11,~f2,~f3,~f1,sel1,sel2);
and(h12,sel1,sel2);
and(h13,~h12,h1);
and(h14,h12,h11);
or(h15,h13,h14);

tff a4(.clk(clk),.rst(rst),.t(h15),.q(q[3]),.en(en));

and(f4,q[3],q[3]);

endmodule
