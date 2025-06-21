module bishift_reg_tb;
   parameter MSB = 4;        

   reg data;                  
   reg clk;                   
   reg en;                    
   reg mode;                   
   reg rst;                  
   wire [MSB-1:0] out;        

   
  bishift_reg  #(MSB) dut  (  .d (data),
                             .clk (clk),
                             .en (en),
                            .mode (mode),
                             .rst (rst),
                             .out (out));

   // Generate clock time period = 20ns, freq => 50MHz
   always #10 clk = ~clk;

   // Initialize variables to default values at time 0
   initial begin
      clk <= 0;
      en <= 0;
      mode <= 0;
      rst <= 0;
      data <= 1;
   end

   initial begin
      rst <= 0;
      #20 rst <= 1;
          en <= 1;
          
	  // 2. For 7 clocks, drive alternate values to data pin
      repeat (7) @ (posedge clk)
         data <= ~data;
   
     // 4. Shift direction and drive alternate value to data pin for another 7 clocks
      #10 mode <= 1;
      repeat (7) @ (posedge clk)
         data <= ~data;

      // 5. Drive nothing for next 7 clocks, allow shift register to simply shift based on mode
      repeat (7) @ (posedge clk);
      
      // 6. Finish the simulation
       #300 $finish;
   end

   // Monitor values of these variables and print them into the logfile for debug
   initial
     $monitor ("rst=%0b data=%b, en=%0b, mode=%0b, out=%b", rst, data, en, mode, out);
     
endmodule
