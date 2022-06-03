`timescale 1ns/1ns
module ARM_Testbench();
    reg clk, rst, mode;

    ARM_cpu arm(clk, rst, mode);

    initial begin
        rst = 1'b1;
        clk = 1'b1;
        mode = 1'b1;
        #20 rst = 1'b0;
        #100000;
        $stop;
    end

    always begin
        #10 clk = ~clk;
    end

endmodule
