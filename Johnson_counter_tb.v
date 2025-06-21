module johnson_counter_tb();
  parameter n=4;
  reg clk,rst;
  wire [n-1:0] count;

  johnson_counter dut(clk,rst,count);

  always #10 clk=~clk;
  initial begin
    rst = 0;
    clk = 0;
    $monitor("Time = %0t  Reset = %d  Count = %b", $time,rst,count);
    #50 rst = 1;
  end
endmodule
