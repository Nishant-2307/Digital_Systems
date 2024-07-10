
`timescale 1ns / 1ps

module toggle ( input clk, input rst, input t, output reg q);
  
  always @ (posedge clk or negedge rst) 
  begin  
  
        if (!rst)  
          q <= 0;  
        else   
            if (t)  
                q <= ~q;  
            else  
                q <= q;  
      end  
endmodule
