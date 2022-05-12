`timescale 1ps/1ps
module ARM_Testbench();
    reg clk, rst, mode;

    ARM_cpu ARM_PROCESSOR(clk, rst, mode);
  
    initial begin
        rst = 1'b1;
        clk = 1'b1;
        mode = 1'b0;
        #20 rst = 1'b0;
        #15000;
        $stop;
    end
  
    always begin
        #10 clk = ~clk;
    end
  
endmodule
