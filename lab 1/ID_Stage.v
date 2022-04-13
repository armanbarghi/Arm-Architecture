module ID_Stage (
    clk, rst,
    write_back_en,
    pc_in, pc,
    instruction,
    status_reg,
    result_wb,
    dest_wb,
    val_rn, val_rm,
    src1, src2, dest,
    mem_read_en, mem_write_en, wb_en, b, s_out,
    exe_cmd
);
    input clk, rst;
    input write_back_en;
    input [31:0] pc_in, pc;
    input [31:0] instruction;
    input [31:0] result_wb;
    input [3:0] status_reg;
    input [3:0] dest_wb;
    output [31:0] val_rn, val_rm;
    output [3:0] src1, src2, dest;
    
    output mem_read_en, mem_write_en, wb_en, b, s_out;
    output [3:0] exe_cmd;

    assign src1 = instruction[19:16];
    assign src2 = instruction[3:0];
    assign dest = instruction[15:12];

    RegisterFile reg_file(
        .clk(clk),
        .rst(rst),
        .srcl(src1),
        .src2(src2),
        .Dest_wb(dest_wb),
        .Result_WB(result_wb),
        .writeBackEn(write_back_en),
        .reg1(val_rn),  //FIXME: rn or rm??
        .reg2(val_rm)
    );

    ControlUnit control_unit(
        .clk(clk),
        .rst(rst),
        .s(instruction[20]),
        .mode(instruction[27:26]),
        .op_code(instruction[24:21]),
        .mem_read_en(mem_read_en),
        .mem_write_en(mem_write_en),
        .wb_en(wb_en),
        .b(b),
        .s_out(s_out),
        .exe_cmd(exe_cmd)
    );
endmodule