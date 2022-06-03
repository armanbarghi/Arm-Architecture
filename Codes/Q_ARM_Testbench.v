`timescale 1ns/1ns
module Q_ARM_Testbench();
    reg clk, rst, mode;
    wire [31:0] pc_if, instruction_if;
    wire [31:0] rf0, rf1, rf2, rf3, rf4, rf5, rf6, rf7, rf10, rf11;
    wire sram_freeze, sram_ready;
    wire sram_we_n;
    wire [15:0] sram_dq;
    wire [17:0] sram_addr;

    ARM_cpu_ arm (
        clk, rst, mode,
        pc_if, instruction_if,
        rf0, rf1, rf2, rf3, rf4, rf5, rf6, rf7, rf10, rf11,
        sram_freeze, sram_ready,
        sram_we_n,
        sram_dq,
        sram_addr
    );

    initial begin
        rst = 1'b1;
        clk = 1'b1;
        mode = 1'b1;
        #20 rst = 1'b0;
        #4000;
        $stop;
    end

    always begin
        #10 clk = ~clk;
    end

endmodule