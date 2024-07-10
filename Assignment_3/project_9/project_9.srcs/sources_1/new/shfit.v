`timescale 1ns / 1ps

module shfit(
input clk,              //clock signal 
input [3:0]q,           //4 bit input
input [1:0]m,           //2 bit multiplexer input for 4 diff cases
input sir,              //shift insert right
input sil,              //shift insert left
input en,               //enable signal
output reg [3:0]qshift  //4 bit output
);  

wire [3:0]q1;           //a temp variable which stores the incoming load     
assign q1=q;            //necessary when parallel load required in future

always@(posedge clk)
begin
if (en)                //active low signal
    qshift=4'b0000;     //till the counter counts
else
    if(m==2'b00)        //for m=00, parallel load
        begin
        qshift[3]<=q1[3];
        qshift[0]<=q1[0];
        qshift[1]<=q1[1];
        qshift[2]<=q1[2];
        end
        
    else if (m==2'b10)  //for m=10, left shift 
    begin
        qshift[0]<=sil;
        qshift[1]<=qshift[0];
        qshift[2]<=qshift[1];
        qshift[3]<=qshift[2];
    end
    
    else if(m==2'b01)   //for m=01, right shift
        begin
        qshift[3]<=sir;
        qshift[2]<=qshift[3];
        qshift[1]<=qshift[2];
        qshift[0]<=qshift[1];
    end
    
    else if(m==2'b11)   //for m=11, no shift
        qshift<=qshift; 
end

endmodule
