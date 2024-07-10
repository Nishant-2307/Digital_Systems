`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 08:57:16
// Design Name: 
// Module Name: adder_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_4bit(
    input[3:0]a,
    input[3:0]b,
    input cin,
    output [3:0]sum,
    output carry
    );
    
wire c1,c2,c3;
adder1bit a1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(c1));
adder1bit a2(.a(a[1]),.b(b[1]),.cin(c1) ,.sum(sum[1]),.carry(c2));
adder1bit a3(.a(a[2]),.b(b[2]),.cin(c2) ,.sum(sum[2]),.carry(c3));
adder1bit a4(.a(a[3]),.b(b[3]),.cin(c3) ,.sum(sum[3]),.carry(carry));

    
    
endmodule
