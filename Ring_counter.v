module ring_counter(clk,reset,count);
  parameter N = 4;
  input clk,rst;
  output reg [N-1:0] count;

  always@(posedge clk)
    if(reset) begin
      count = {count[0],[N-1:1]count};
  end
  else begin
    count = 1;
  end
endmodule
