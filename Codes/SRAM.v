`timescale 1ps/1ps
module SRAM (
    clk, rst,
    SRAM_WE_N,
    SRAM_DQ,
    SRAM_ADDR
);
    input clk, rst;
    input SRAM_WE_N;
    inout [15:0] SRAM_DQ;       // SRAM Data bus 16 Bits
    input [17:0] SRAM_ADDR;     // SRAM Address bus 18 Bits
    
    reg [15:0] SRAM_DQ_REG;
    reg [15:0] mem[0:1024];

    assign SRAM_DQ = SRAM_DQ_REG;

    always @(SRAM_WE_N, SRAM_ADDR) begin
        if (SRAM_WE_N) begin
            $display("Start of SRAM read / time=%0t", $time);
            #30 SRAM_DQ_REG = mem[SRAM_ADDR];
            $display("End of SRAM read / time=%0t", $time);
            $display("mem[SRAM_ADDR]=0b%0d", mem[SRAM_ADDR]);
        end
        else
            SRAM_DQ_REG <= {(16){1'bz}};
    end

    always @(posedge clk) begin
        if (SRAM_WE_N == 1'b0) begin
            mem[SRAM_ADDR] <= SRAM_DQ;
        end
    end

endmodule