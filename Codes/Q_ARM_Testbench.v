`timescale 1ns/1ns
module Q_ARM_Testbench();
    reg clk, rst, mode;
    wire [31:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6;
    wire [31:0] pc_if, instruction_if;

    ARM_cpu_ arm (
        clk, rst, mode,
        pc_if, instruction_if,
        mem0, mem1, mem2, mem3, mem4, mem5, mem6
    );

    initial begin
        rst = 1'b1;
        clk = 1'b0;
        mode = 1'b1;
        #20 rst = 1'b0;
        #20000;
        $stop;
    end

    always begin
        #10 clk = ~clk;
    end

endmodule