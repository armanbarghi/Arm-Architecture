module WB_Stage (
    clk, rst,
    mem_r_en,
    alu_res, mem_res,
    wb_val
);
    input clk, rst;
    input mem_r_en;
    input [31:0] alu_res, mem_res;
    output [31:0] wb_val;

    Mux2to1 #(.N(32))
        mux32b (
            .i0(alu_res),
            .i1(mem_res),
            .sel(mem_r_en),
            .y(wb_val)
        );

endmodule