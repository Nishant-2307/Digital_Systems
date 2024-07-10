`timescale 1ns / 1ps

module tff(
input clk,      //clock signal
input rst,      //reset signal
input t,        //toggle signal, will be 1 to toggle
output reg q,   //output bit
input en        //enable signal
);
  
always @ (posedge clk or negedge rst) 
begin  
    if (!en)        //if not enabled then do nothing
        q<=q;       //return the same thing
    else
        if (!rst)   //active low reset signal  
          q <= 0;   //so reset when rst=0  
        else   
            if (t)  //toggle=1 means change output  
                q <= ~q;  
            else  
                q <= q;  
      end  
endmodule
