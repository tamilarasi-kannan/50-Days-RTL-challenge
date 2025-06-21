module bishift_reg #(parameter MSB=3) (  input d,                      
                                        input clk,                    
                                        input en,                    
                                        input mode,                   
                                        input rst,                  
                                        output reg [MSB-1:0] out);   


   always @ (posedge clk)
     if (rst == 0)
         out <= 0;
      else begin
         if (en)
           if ( mode ==0) begin
             out <= {out[MSB-2:0],d};
           end
        else begin 
          out = {d,out[MSB-1:0]};
      end
         else
            out <= out;
      end
endmodule
