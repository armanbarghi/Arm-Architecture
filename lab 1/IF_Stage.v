module IF_Stage(input clk, rst, freeze, Branch_taken,
                input [31:0] BranchAddr,
                output [31:0] PC, Inst);

    wire [31:0] PC_out;
    wire [31:0] Mux_out;

    Register #32 PC_reg(.d_in(Mux_out),
                        .clk(clk),
                        .sclr(rst), 
                        .ld(~freeze), 
                        .d_out(PC_out)) ;

    Mux2to1_32b mux32b(.i0(PC), 
                       .i1(BranchAddr), 
                       .sel(Branch_taken), 
                       .y(Mux_out));

    InstMemory InstMem(.AddrIn(PC_out),
                       .Inst(Inst));

    assign PC = PC_out + 32'd4;    

endmodule