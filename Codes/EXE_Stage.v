module EXE_Stage (
    clk,
    exe_cmd, mem_r_en, mem_w_en,
    PC, val_Rn, val_Rm, imm, shift_operand,
    signed_imm_24, SR, alu_res, br_addr,
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
    output [31:0] alu_res, br_addr;
    output [3:0] status;

    wire control_input;
    wire [31:0] val2;

    ALU alu_unit (
        .in1(val_Rn),
        .in2(val2),   
        .carry_in(SR[1]),
        .exe_cmd(exe_cmd),
        .status_bits(status),
        .result(alu_res)
    );

    Val2_Generator val2_gen (
        .shift_operand(shift_operand),
        .imm(imm),
        .val_rm(val_Rm),
        .control_input(control_input),
        .Val2(val2)
    );

    assign br_addr = PC + ({{8{Signed_imm_24[23]}}, Signed_imm_24} + 32'd1) << 2; 
    assign control_input = mem_r_en | mem_w_en;

endmodule