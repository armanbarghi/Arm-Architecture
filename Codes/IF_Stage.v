module IF_Stage (
    clk, rst, freeze, Branch_taken,
    BranchAddr,
    PC, Inst
);
    input clk, rst, freeze, Branch_taken;
    input [31:0] BranchAddr;
    output [31:0] PC, Inst;

    wire [31:0] PC_out;
    wire [31:0] Mux_out;

    Register #(.N(32))
        PC_reg (
            .clk(clk),
            .rst(rst), 
            .ld(~freeze), 
            .d_in(Mux_out),
            .d_out(PC_out)
        );

    Mux2to1 #(.N(32))
        mux32b (
            .i0(PC_out + 32'd4), 
            .i1(BranchAddr), 
            .sel(Branch_taken), 
            .y(Mux_out)
        );

    InstMemory InstMem (
        .AddrIn(PC_out),
        .Inst(Inst)
    );

    assign PC = PC_out;

endmodule