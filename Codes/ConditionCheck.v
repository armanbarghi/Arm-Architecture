module ConditionCheck (
    clk, rst,
    cond,
    status_reg,
    cond_out
);
    input clk, rst;
    input [3:0] cond;
    input [3:0] status_reg;
    output cond_out;

endmodule