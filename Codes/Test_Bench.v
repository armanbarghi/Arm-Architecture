module ARM_TB();
  reg clk, rst;
  
  ARM ARM_PROCESSOR(clk, rst);
  
  initial
  begin
    rst = 1'b1;
    clk = 1'b0;
    #50 rst = 1'b0;
    #15000 $stop;
  end
  
  always
  begin
    #10 clk = ~clk;
  end
  
endmodule
