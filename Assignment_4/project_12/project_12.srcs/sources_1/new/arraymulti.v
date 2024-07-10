`timescale 1ns / 1ps

module fulladd(A,B,O,cout);
parameter n=4;
input [n-1:0]A,B;
output reg [n-1:0]O;
output reg cout;
reg [n:0]C;
integer k;

always @(*)
begin
C[0]=0;
for(k=0;k<n;k=k+1)
begin
O[k]=A[k]^B[k]^C[k];
C[k+1]=(A[k]&B[k])|(A[k]&C[k])|(B[k]&C[k]);
end
cout=C[n];
end
endmodule

module shiftright(i,o,c);
parameter n=4;
input [n-1:0]i;
input c;
output reg [n-1:0]o;
integer k;
always@(*)
begin
for(k=0;k<n-1;k=k+1)
begin
o[k]<=i[k+1];
end
o[n-1]=c;
end
endmodule

module sm(a,c,l);
parameter n=4;
input [n-1:0]a;
input c;
output [n-1:0]l;
genvar i;
for(i=0;i<n;i=i+1)
begin:mult1
    and a1(l[i],a[i],c);
end
endmodule

module arraymulti(a,b,p);
parameter n=4;
input [n-1:0]a;
input [n-1:0]b;
output [2*n-1:0]p;

wire [n-1:0]m1,m2,m3,m4,m5,m6,m7,m8,m9;

wire [n-1:0]l1,l2,l3,l4,l5,l6,l7,l8;

wire [n-1:0]o1,o2,o3,o4,o5,o6,o7,o8;

wire c1,c2,c3,c4,c5,c6,c7,c8;

genvar k;
for(k=0;k<n;k=k+1)
begin
    and a1(m1[k],0,0);
end

sm s1(a,b[0],l1);
fulladd t1(l1,m1,o1,c1);
assign p[0]=o1[0];
shiftright j1(o1,m2,c1);

sm s2(a,b[1],l2);
fulladd t2(l2,m2,o2,c2);
assign p[1]=o2[0];
shiftright j2(o2,m3,c2);

sm s3(a,b[2],l3);
fulladd t3(l3,m3,o3,c3);
assign p[2]=o3[0];
shiftright j3(o3,m4,c3);

sm s4(a,b[3],l4);
fulladd t4(l4,m4,o4,c4);
assign p[3]=o4[0];
shiftright j4(o4,m5,c4);

//sm s5(a,b[4],l5);
//fulladd t5(l5,m5,o5,c5);
//assign p[4]=o5[0];
//shiftright j5(o5,m6,c5);

//sm s6(a,b[5],l6);
//fulladd t6(l6,m6,o6,c6);
//assign p[5]=o6[0];
//shiftright j6(o6,m7,c6);

//sm s7(a,b[6],l7);
//fulladd t7(l7,m7,o7,c7);
//assign p[6]=o7[0];
//shiftright j7(o7,m8,c7);

//sm s8(a,b[7],l8);
//fulladd t8(l8,m8,o8,c8);
//assign p[7]=o8[0];
//shiftright j8(o8,m9,c8);

genvar h;
for (h=0;h<n;h=h+1)
begin
assign p[n+h]=m5[h];
end

endmodule


//parameterized code


//parameter n=2;
//input [n-1:0]a,b;
//output [2*n-1:0]p;
//output [n-1:0]l;
//output [n-1:0]m;
//wire [n-1:0]q;
//wire [n-1:0]o;
//wire c;
//genvar k;
//for(k=0;k<n;k=k+1)
//begin
//    and a1(m[k],0,0);
//end
//genvar i,j;

//    generate 
//        for (i=0;i<n;i=i+1)
//            begin : addbit
//                for (j=0;j<n;j=j+1)
//                    begin : addbit1
//                        and a1(l[j],a[j],b[i]);
//                    end
//                fulladd stage1(l,m,o,c);
//                and a2(q[i],o[0],o[0]);
//                shiftright stage2(o,m,c);
//            end
//        assign p[n-1:0]=q;
//        assign p[2*n-2:n-2]=m[n-2:0];
//        assign p[2*n-1]=c;
//    endgenerate

//endmodule