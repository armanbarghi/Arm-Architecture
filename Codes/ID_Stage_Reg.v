module ID_Stage_Reg (
    clk, rst, flush,
    imm_in, mem_r_en_in, mem_w_en_in, wb_en_in, b_in, s_in,
    exe_cmd_in,
    dest_in, status_reg_in,
    shift_operand_in,
    signed_imm_24_in,
    pc_in, val_rn_in, val_rm_in,
    imm, mem_r_en, mem_w_en, wb_en, b, s,
    exe_cmd,
    dest, status_reg,
    shift_operand,
    signed_imm_24,
    pc, val_rn, val_rm
);
    input clk, rst, flush;
    input imm_in, mem_r_en_in, mem_w_en_in, wb_en_in, b_in, s_in;
    input [3:0] exe_cmd_in;
    input [3:0] dest_in, status_reg_in;
    input [11:0] shift_operand_in;
    input [23:0] signed_imm_24_in;
    input [31:0] pc_in, val_rn_in, val_rm_in;
    output reg imm, mem_r_en, mem_w_en, wb_en, b, s;
    output reg [3:0] exe_cmd;
    output reg [3:0] dest, status_reg;
    output reg [11:0] shift_operand;
    output reg [23:0] signed_imm_24;
    output reg [31:0] pc, val_rn, val_rm;

    always @(posedge clk, posedge rst) begin
        if (rst == 1'b1) begin
            imm <= 1'b0;
            mem_r_en <= 1'b0;
            mem_w_en <= 1'b0;
            wb_en <= 1'b0;
            b <= 1'b0;
            s <= 1'b0;
            exe_cmd <= 4'b0;
            dest <= 4'b0;
            status_reg <= 4'b0;
            shift_operand <= 12'b0;
            signed_imm_24 <= 24'b0;
            pc <= 32'b0;
            val_rn <= 32'b0;
            val_rm <= 32'b0;
        end
        else if (flush == 1'b1) begin
            imm <= 1'b0;
            mem_r_en <= 1'b0;
            mem_w_en <= 1'b0;
            wb_en <= 1'b0;
            b <= 1'b0;
            s <= 1'b0;
            exe_cmd <= 4'b0;
            dest <= 4'b0;
            status_reg <= 4'b0;
            shift_operand <= 12'b0;
            signed_imm_24 <= 24'b0;
            pc <= 32'b0;
            val_rn <= 32'b0;
            val_rm <= 32'b0;
        end
        else begin
            imm <= imm_in;
            mem_r_en <= mem_r_en_in;
            mem_w_en <= mem_w_en_in;
            wb_en <= wb_en_in;
            b <= b_in;
            s <= s_in;
            exe_cmd <= exe_cmd_in;
            dest <= dest_in;
            status_reg <= status_reg_in;
            shift_operand <= shift_operand_in;
            signed_imm_24 <= signed_imm_24_in;
            pc <= pc_in;
            val_rn <= val_rn_in;
            val_rm <= val_rm_in;
        end
    end
    
endmodule
