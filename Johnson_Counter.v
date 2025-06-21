module johnson_counter (clk,rst,count);
  parameter n=4;
  input clk,rst;
  output [n-1:0]count;

  always@(posedge clk)
    if(rst==1) begin
      count = {~count[0],count[n-1:1]};
    end
  else begin
    count = 1;
  end
endmodule
