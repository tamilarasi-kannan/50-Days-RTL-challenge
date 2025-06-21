module ring_counter(clk,reset,count);
  parameter N = 4;
  input clk,reset;
  output reg [N-1:0] count;

  always@(posedge clk)
    if(reset) begin
      count = {count[0],count[N-1:1]};
  end
  else begin
    count = 1;
  end
endmodule
