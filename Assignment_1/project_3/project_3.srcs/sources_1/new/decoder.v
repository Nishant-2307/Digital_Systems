`timescale 1ns / 1ps

module decoder(
    input [4:0]a,  //5 bit input
    input [3:0]s, //4 bit select line to choose divisor
    input e,        //enable
    output [31:0]o, //32 bit output of decode
    output [7:0]sel, //to check divisor
    output out);    //output
  
 // initialising 5*32 decoder for range input
    and a1(o[0],~a[4],~a[3],~a[2],~a[1],~a[0],e);
    and a2(o[1],~a[4],~a[3],~a[2],~a[1],a[0],e);
    and a3(o[2],~a[4],~a[3],~a[2],a[1],~a[0],e);
    and a4(o[3],~a[4],~a[3],~a[2],a[1],a[0],e);
    and a5(o[4],~a[4],~a[3],a[2],~a[1],~a[0],e);
    and a6(o[5],~a[4],~a[3],a[2],~a[1],a[0],e);
    and a7(o[6],~a[4],~a[3],a[2],a[1],~a[0],e);
    and a8(o[7],~a[4],~a[3],a[2],a[1],a[0],e);
    and a9(o[8],~a[4],a[3],~a[2],~a[1],~a[0],e);
    and a10(o[9],~a[4],a[3],~a[2],~a[1],a[0],e);
    and a11(o[10],~a[4],a[3],~a[2],a[1],~a[0],e);
    and a12(o[11],~a[4],a[3],~a[2],a[1],a[0],e);
    and a13(o[12],~a[4],a[3],a[2],~a[1],~a[0],e);
    and a14(o[13],~a[4],a[3],a[2],~a[1],a[0],e);
    and a15(o[14],~a[4],a[3],a[2],a[1],~a[0],e);
    and a16(o[15],~a[4],a[3],a[2],a[1],a[0],e);
    and a17(o[16],a[4],~a[3],~a[2],~a[1],~a[0],e);
    and a18(o[17],a[4],~a[3],~a[2],~a[1],a[0],e);
    and a19(o[18],a[4],~a[3],~a[2],a[1],~a[0],e);
    and a20(o[19],a[4],~a[3],~a[2],a[1],a[0],e);
    and a21(o[20],a[4],~a[3],a[2],~a[1],~a[0],e);
    and a22(o[21],a[4],~a[3],a[2],~a[1],a[0],e);
    and a23(o[22],a[4],~a[3],a[2],a[1],~a[0],e);
    and a24(o[23],a[4],~a[3],a[2],a[1],a[0],e);
    and a25(o[24],a[4],a[3],~a[2],~a[1],~a[0],e);
    and a26(o[25],a[4],a[3],~a[2],~a[1],a[0],e);
    and a27(o[26],a[4],a[3],~a[2],a[1],~a[0],e);
    and a28(o[27],a[4],a[3],~a[2],a[1],a[0],e);
    and a29(o[28],a[4],a[3],a[2],~a[1],~a[0],e);
    and a30(o[29],a[4],a[3],a[2],~a[1],a[0],e);
    and a31(o[30],a[4],a[3],a[2],a[1],~a[0],e);
    and a32(o[31],a[4],a[3],a[2],a[1],a[0],e);

// assigning the divisor to different bits
    and s2(sel[0],~s[3],~s[2],s[1],~s[0]);
    and s3(sel[1],~s[3],~s[2],s[1],s[0]);
    and s4(sel[2],~s[3],s[2],~s[1],~s[0]);
    and s5(sel[3],~s[3],s[2],~s[1],s[0]);
    and s6(sel[4],~s[3],s[2],s[1],~s[0]);
    and s7(sel[5],~s[3],s[2],s[1],s[0]);
    and s8(sel[6],s[3],~s[2],~s[1],~s[0]);
    and s9(sel[7],s[3],~s[2],~s[1],s[0]);

// initialising OR blocks for grouping each counting number multiple from 5*32 decoder output
    or b2(aw,o[0],o[2],o[4],o[6],o[8],o[10],o[12],o[14],o[16],o[18],o[20],o[22],o[24],o[26],o[28],o[30]);
    or b3(b,o[0],o[3],o[6],o[9],o[12],o[15],o[18],o[21],o[24],o[27],o[30]);
    or b4(c,o[0],o[4],o[8],o[12],o[16],o[20],o[24],o[28]);
    or b5(d, o[0],o[5],o[10],o[15],o[20],o[25],o[30]);
    or b6(ew, o[0],o[6],o[12],o[18],o[24],o[24]);
    or b7(f, o[0],o[7], o[14], o[21], o[28]);
    or b8(g, o[0], o[8], o[16], o[24]);
    or b9(h, o[0], o[9], o[18], o[27]);
    
// printing the output multiples of desired counting number with the help of AND blocks
    and f1(o1,aw,sel[0]);
    and f2(o2,b,sel[1]);
    and f3(o3,c,sel[2]);
    and f4(o4,d,sel[3]);
    and f5(o5,ew,sel[4]);
    and f6(o6,f,sel[5]);
    and f7(o7,g,sel[6]);
    and f8(o8,h,sel[7]);

// final output    
    or fin(out,o1,o2,o3,o4,o5,o6,o7,o8);

endmodule
