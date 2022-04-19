module ID_Stage (
    clk, rst,
    wb_wb_en, hazard,
    pc_in,
    instruction,
    status_reg,
    wb_value,
    wb_dest,
    two_src, imm,
    mem_r_en, mem_w_en, wb_en, b, s,
    exe_cmd,
    src1, src2, dest,
    shift_operand,
    signed_imm_24,
    pc, val_rn, val_rm
);
    input clk, rst;
    input wb_wb_en, hazard;
    input [31:0] pc_in;
    input [31:0] instruction;
    input [31:0] wb_value;
    input [3:0] status_reg;
    input [3:0] wb_dest;
    output two_src, imm;
    output mem_r_en, mem_w_en, wb_en, b, s;
    output [3:0] exe_cmd;
    output [3:0] src1, src2, dest;
    output [11:0] shift_operand;
    output [23:0] signed_imm_24;
    output [31:0] pc, val_rn, val_rm;

    wire cu_mem_r_en, cu_mem_w_en, cu_wb_en, cu_b, cu_s;
    wire [3:0] cu_exe_cmd;
    wire cond_out;

    assign src1 = instruction[19:16];
    assign dest = instruction[15:12];
    assign imm = instruction[25];
    assign pc = pc_in;
    assign shift_operand = instruction[11:0];
    assign signed_imm_24 = {{16{instruction[7]}}, instruction[7:0]};
    
    or(two_src, mem_w_en, ~imm);

    or(bubble, ~cond_out, hazard);

    Mux2to1 #(.N(32))
        mux32b (
            .i0(instruction[3:0]), 
            .i1(dest), 
            .sel(mem_w_en), 
            .y(src2)
        );

    Mux2to1 #(.N(9))
        mux9b (
            .i0({cu_mem_r_en, cu_mem_w_en, cu_wb_en, cu_b, cu_s, cu_exe_cmd}), 
            .i1(9'b0), 
            .sel(bubble), 
            .y({mem_r_en, mem_w_en, wb_en, b, s, exe_cmd})
        );

    ControlUnit control_unit(
        .clk(clk),
        .rst(rst),
        .s(instruction[20]),
        .mode(instruction[27:26]),
        .op_code(instruction[24:21]),
        .mem_r_en(cu_mem_r_en),
        .mem_w_en(cu_mem_w_en),
        .wb_en(cu_wb_en),
        .b(cu_b),
        .s_out(cu_s),
        .exe_cmd(cu_exe_cmd)
    );

    ConditionCheck condition_check(
        .clk(clk),
        .rst(rst),
        .cond(instruction[31:28]),
        .status_reg(status_reg),
        .cond_out(cond_out)
    );

    RegisterFile reg_file(
        .clk(clk),
        .rst(rst),
        .srcl(src1),
        .src2(src2),
        .Dest_wb(wb_dest),
        .Result_WB(wb_value),
        .writeBackEn(wb_wb_en),
        .reg1(val_rn),  //FIXME: rn or rm??
        .reg2(val_rm)
    );


endmodule