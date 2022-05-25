`timescale 1ps/1ps
module Q_ARM_Testbench();
    reg clk, rst, mode;
    reg pc_if;

    ARM_cpu arm (
        clk, rst, mode,
        pc_if, instruction_if
    );

    initial begin
        rst = 1'b1;
        clk = 1'b1;
        mode = 1'b1;
        #20 rst = 1'b0;
        #15000;
        $stop;
    end

    always begin
        #10 clk = ~clk;
    end

endmodule