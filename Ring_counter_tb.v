module ring_counter_tb();
  parameter N = 4;
  reg clk;
  reg reset;
  wire [N-1:0]count;

  ring_counter dut(clk,reset,count);

  always #10 clk=~clk;
  initial begin
    clk=0;
    reset=0;

    $display("Time = %0t  Reset = %b  Count = %b",$time,reset,count);
    #50 reset = 1;
  end
endmodule
    
  
