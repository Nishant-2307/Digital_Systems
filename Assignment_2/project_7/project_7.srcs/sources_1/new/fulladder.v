`timescale 1ns / 1ps

module fulladder(a,b,c,sum,co,sel);
    input a,b,c,sel;
    output co,sum;
    //to select negation of b when doing subtraction
        and(q,~sel,b);
        and(r,sel,~b);
        or(s,q,r);
    //finding out carry/borrow out
        and(e,a,s);
        and(f,s,c);
        and(g,c,a);
        or(co,e,f,g);
    //finding out sum/difference
        xor(h,a,s);
        xor(sum,h,c);
        
endmodule
