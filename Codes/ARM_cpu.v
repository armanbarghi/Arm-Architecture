module ARM_cpu (
    clk, rst
);
    input clk, rst;
    
    wire [31:0] branch_addr;
    wire [31:0] pc_if, instruction_if;
    wire [31:0] pc_id, instruction_id;
    wire [31:0] pc_exe;
    wire [3:0] status_bits_in, status_bits_out;
    wire s_id, s_exe, b_exe, two_src_id;
    wire [31:0] wb_val;
    wire [3:0] wb_dest;
    wire imm_id, mem_r_en_id, mem_w_en_id, wb_en_id, b_id;
    wire [3:0] exe_cmd_id;
    wire imm_exe, mem_r_en_exe, mem_w_en_exe, wb_en_exe;
    wire [3:0] exe_cmd_exe;
    wire [3:0] src1, src2;
    wire [3:0] dest_id, dest_exe, dest_mem;
    wire [11:0] shift_operand_id, shift_operand_exe;
    wire [23:0] signed_imm_24_id, signed_imm_24_exe;
    wire [3:0] status_bits_exe;
    wire [31:0] val_rn_id, val_rm_id, val_rn_exe, val_rm_exe;
    wire [31:0] alu_res_exe, alu_res_mem, alu_res_wb;
    wire mem_r_en_mem, mem_w_en_mem, wb_en_mem;
    wire [31:0] val_rm_mem;
    wire [31:0] mem_res_wb;
    wire [31:0] mem_res;
    wire mem_r_en_wb, wb_en_wb;
    wire hazard;

    IF_Stage if_stage (
        .clk(clk),
        .rst(rst),
        .freeze(hazard),
        .Branch_taken(1'b0),   // FIXME: connect to branchTaken
        .BranchAddr(branch_addr),
        .PC(pc_if),
        .Inst(instruction_if)
    );

    IF_Stage_Reg if_stage_reg (
        .clk(clk),
        .rst(rst),
        .freeze(hazard),
        .flush(1'b0),   // FIXME: connect to branchTaken
        .PC_in(pc_if),
        .Inst_in(instruction_if),
        .PC(pc_id),
        .Inst(instruction_id)
    );

    ID_Stage id_stage (
        .clk(clk),
        .rst(rst),
        .wb_wb_en(wb_en_wb),
        .hazard(hazard),
        .instruction(instruction_id),
        .status_reg(status_bits_out),
        .wb_value(wb_val),
        .wb_dest(wb_dest),
        .two_src(two_src_id),
        .imm(imm_id),
        .mem_r_en(mem_r_en_id),
        .mem_w_en(mem_w_en_id),
        .wb_en(wb_en_id),
        .b(b_id),
        .s(s_id),
        .exe_cmd(exe_cmd_id),
        .src1(src1),
        .src2(src2),
        .dest(dest_id),
        .shift_operand(shift_operand_id),
        .signed_imm_24(signed_imm_24_id),
        .val_rn(val_rn_id),
        .val_rm(val_rm_id)
    );

    Hazard_Detection_Unit hazard_unit (
        .clk(clk),
        .rst(rst),
        .two_src(two_src_id),
        .exe_wb_en(wb_en_exe),
        .mem_wb_en(wb_en_mem),
        .src1(src1),
        .src2(src2),
        .exe_dest(dest_exe),
        .mem_dest(dest_mem),
        .hazard(hazard)
    );

    ID_Stage_Reg id_stage_reg (
        .clk(clk),
        .rst(rst),
        .flush(1'b0),   // FIXME: connect to branchTaken
        .imm_in(imm_id),
        .mem_r_en_in(mem_r_en_id),
        .mem_w_en_in(mem_w_en_id),
        .wb_en_in(wb_en_id),
        .b_in(b_id),
        .s_in(s_id),
        .exe_cmd_in(exe_cmd_id),
        .dest_in(dest_id),
        .status_reg_in(status_bits_out),
        .shift_operand_in(shift_operand_id),
        .signed_imm_24_in(signed_imm_24_id),
        .pc_in(pc_id),
        .val_rn_in(val_rn_id),
        .val_rm_in(val_rm_id),
        .imm(imm_exe),
        .mem_r_en(mem_r_en_exe),
        .mem_w_en(mem_w_en_exe),
        .wb_en(wb_en_exe),
        .b(b_exe),
        .s(s_exe),
        .exe_cmd(exe_cmd_exe),
        .dest(dest_exe),
        .status_reg(status_bits_exe),
        .shift_operand(shift_operand_exe),
        .signed_imm_24(signed_imm_24_exe),
        .pc(pc_exe),
        .val_rn(val_rn_exe),
        .val_rm(val_rm_exe)
    );

    EXE_Stage exe_stage (
        .clk(clk),
        .exe_cmd(exe_cmd_exe),
        .mem_r_en(mem_r_en_exe),
        .mem_w_en(mem_w_en_exe),
        .PC(pc_exe),
        .val_Rn(val_rn_exe),
        .val_Rm(val_rm_exe),
        .imm(imm_exe),
        .shift_operand(shift_operand_exe),
        .signed_imm_24(signed_imm_24_exe),
        .SR(status_bits_exe),
        .alu_res(alu_res_exe),
        .br_addr(branch_addr),
        .status(status_bits_in)
    );

    EXE_Stage_Reg exe_stage_reg(
        .clk(clk),
        .rst(rst),
        .wb_en_in(wb_en_exe),
        .mem_r_en_in(mem_r_en_exe),
        .mem_w_en_in(mem_w_en_exe),
        .alu_res_in(alu_res_exe),
        .val_rm_in(val_rm_exe),
        .dest_in(dest_exe),
        .wb_en(wb_en_mem),
        .mem_r_en(mem_r_en_mem),
        .mem_w_en(mem_w_en_mem),
        .alu_res(alu_res_mem),
        .val_rm(val_rm_mem),
        .dest(dest_mem)
    );

    Register #(.N(4))
        status_reg (
            .clk(clk),
            .rst(rst),
            .ld(s_exe),    // FIXME: s_exe or ~s_exe?
            .d_in(status_bits_in),
            .d_out(status_bits_out)
        );

    Memory memory(
        .clk(clk),
        .rst(rst),
        .mem_read(mem_r_en_mem),
        .mem_write(mem_w_en_mem),
        .address(alu_res_mem-32'd1024),
        .data(val_rm_mem),
        .mem_result(mem_res)
    );

    MEM_Stage_Reg memory_stage_reg(
        .clk(clk),
        .rst(rst),
        .mem_r_en_in(mem_r_en_mem),
        .wb_en_in(wb_en_mem),
        .dest_in(dest_mem),
        .alu_res_in(alu_res_mem),
        .mem_val_in(mem_res),
        .mem_r_en_out(mem_r_en_wb),
        .wb_en_out(wb_en_wb),
        .dest_out(wb_dest),
        .alu_res_out(alu_res_wb),
        .mem_val_out(mem_res_wb)
    );

    WB_Stage wb_stage(
        .clk(clk),
        .rst(rst),
        .mem_r_en(mem_r_en_wb),
        .alu_res(alu_res_wb),
        .mem_res(mem_res_wb),
        .wb_val(wb_val)
    );
endmodule
