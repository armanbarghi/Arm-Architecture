module ControlUnit (
    clk, rst, s,
    mode, op_code,
    mem_r_en, mem_w_en, wb_en, b, s_out,
    exe_cmd
);
    input clk, rst, s;
    input [1:0] mode;
    input [3:0] op_code;
    output mem_r_en, mem_w_en, wb_en, b, s_out;
    output [3:0] exe_cmd;



endmodule