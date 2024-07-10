`timescale 1ns / 1ps

module binary_multiplier(A,B,out);
parameter n=4;
parameter m=4;
input [n-1:0]A;
input [m-1:0]B;
reg [n+m-1:0]c;
output reg [n+m-1:0]out;
integer i;
integer j;

always @*
begin
    out=0;
    for(i=0;i<m;i=i+1)
    begin
        c=0;
        if(B[i]==1)
            begin
                for(j=0;j<n;j=j+1)
                    c[i+j]=A[j];
            out=out+c;
            end
        else
            out=out;
    end
end
endmodule
