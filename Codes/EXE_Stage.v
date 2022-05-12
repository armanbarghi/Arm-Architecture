module EXE_Stage (
    clk,
    exe_cmd, mem_r_en, mem_w_en,
    PC, val_Rn, val_Rm, imm, shift_operand,
    signed_imm_24, SR, 
    sel_src1, sel_src2,
    mem_alu_res, wb_value,
    alu_res, br_addr, val_Rm_out,
    status
);
    input clk;
    input [3:0] exe_cmd;
    input mem_r_en, mem_w_en;
    input [31:0] PC, val_Rn, val_Rm;
    input imm;
    input [11:0] shift_operand;
    input [23:0] signed_imm_24;
    input [3:0] SR;
    input [1:0] sel_src1, sel_src2;
    input [31:0] mem_alu_res, wb_value;
    output [31:0] alu_res, br_addr, val_Rm_out;
    output [3:0] status;

    wire control_input;
    wire [31:0] val2;
    wire [31:0] mux_rn_out, mux_rm_out;

    ALU alu_unit (
        .in1(mux_rn_out),
        .in2(val2),   
        .carry_in(SR[1]),
        .exe_cmd(exe_cmd),
        .status_bits(status),
        .result(alu_res)
    );

    Val2_Generator val2_gen (
        .shift_operand(shift_operand),
        .imm(imm),
        .val_rm(mux_rm_out),
        .control_input(control_input),
        .val2(val2)
    );

    Mux4to1 #(.N(32))
        mux_rn (
            .i0(val_Rn), 
            .i1(mem_alu_res), 
            .i2(wb_value), 
            .i3(), 
            .sel(sel_src1), 
            .y(mux_rn_out)
        );
    
    Mux4to1 #(.N(32))
        mux_rm (
            .i0(val_Rm), 
            .i1(mem_alu_res), 
            .i2(wb_value), 
            .i3(), 
            .sel(sel_src2), 
            .y(mux_rm_out)
        );

    assign br_addr = PC + (({{8{signed_imm_24[23]}}, signed_imm_24} + 32'd1) << 2); 
    assign control_input = mem_r_en | mem_w_en;
    assign val_Rm_out = mux_rm_out;

endmodule