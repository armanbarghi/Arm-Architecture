`timescale 1ps/1ps
module ARM_Testbench();
    reg clk, rst;
  
    ARM_cpu ARM_PROCESSOR(clk, rst);
  
    initial begin
        rst = 1'b1;
        clk = 1'b0;
        #20 rst = 1'b0;
        #1000000000;
        $stop;
    end
  
    always begin
        #10 clk = ~clk;
    end
  
endmodule
