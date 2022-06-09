`timescale 1ns/1ns
module Q_ARM_Testbench();
    reg clk, rst, mode;
    wire SRAM_WE_N;
    wire [15:0]SRAM_DQ;
    wire [17:0] SRAM_ADDR;

    ARM_cpu_ arm(clk, rst, mode,SRAM_WE_N,SRAM_DQ,SRAM_ADDR);
    SRAM mem(clk, rst,SRAM_WE_N,SRAM_DQ,SRAM_ADDR);

    initial begin
        rst = 1'b1;
        clk = 1'b1;
        mode = 1'b1;
        #20 rst = 1'b0;
        #40000;
        $stop;
    end

    always begin
        #25 clk = ~clk;
    end

endmodule