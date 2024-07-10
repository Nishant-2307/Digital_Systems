`timescale 1ns / 1ps
module multiple(output reg out, input [4:0]c, input [3:0]s);
//We are taking 4 bit select line to choose and c is the 5 bit input is the dividend
always @(*)
    begin
        if(s==4'b0010) //quotient= 2
              if (c[0]==0)
                out=1;
              else
                out=0;
        else if(s==4'b0011) //quotient=3
            if(c==5'b00000|c==5'b00011|c==5'b01100|c==5'b01001|c==5'b01111|c==5'b00110|c==5'b10010|c==5'b10101|c==5'b11110|c==5'b11000|c==5'b11011)
                out=1;
            else
                out=0;
        else if (s==4'b0100) //quotient=4
            if(c[0]==0&c[1]==0)
                out=1;
            else
                out=0;
        else if (s==4'b0101) //quotient=5
            if(c==5'h0 | c==5'h5 | c==5'hA | c==5'hF | c==5'h14 | c==5'h19 | c==5'h1E)
                out=1;
            else
                out=0;
        else if (s==4'b0110) //quotient=6
            if(c==5'h0 | c==5'h6 | c==5'hC | c==5'h12 | c==5'h18 | c==5'h1E)
                out=1;
            else
                out=0;
        else if (s==4'b0111) //quotient=7
            if(c==5'h0 | c==5'h7 | c==5'hE | c==5'h15 | c==5'h1C)
                out=1;
            else
                out=0;
        else if (s==4'b1000) //quotient=8
            if(c[0]==0 & c[1]==0 & c[2]==0)
                out=1;
            else
                out=0;
        else if (s==4'b1001) //quotient=9
            if(c==5'b00000 | c==5'b01001 | c==5'b10010 | c==5'b11011)
                out=1;
            else
                out=0;
        else
            out=0;
    end
endmodule
