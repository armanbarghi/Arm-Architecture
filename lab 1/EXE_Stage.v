module MEM_Stage_Reg (
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

    ALU alu_unit(
    .in1(val_Rn),
    .in2(val_Rm),   ///should change!!!!
    .carry_in(SR[1]),
    .exe_cmd(exe_cmd),
    .status_bits(status),
    .result(alu_res)
    );

    assign br_addr = PC + signed_imm_24; 

endmodule