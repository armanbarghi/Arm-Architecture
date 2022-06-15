module ControlUnit (
    clk, rst, s,
    mode, op_code,
    mem_r_en, mem_w_en, wb_en, b, s_out,
    exp_en, exp_ready,
    exe_cmd
);
    input clk, rst, s;
    input [1:0] mode;
    input [3:0] op_code;
    output mem_r_en, mem_w_en, wb_en, b, s_out;
    output exp_en, exp_ready;
    output reg [3:0] exe_cmd;

    reg [4:0] exp_count;

    assign s_out = (mode == 2'b01 | mode == 2'b10) ? 1'b0 :
                   (op_code == 4'b1010 | op_code == 4'b1000) ? 1'b1 : s;

    assign mem_r_en = (mode == 2'b01 & s == 1'b1) ? 1'b1 : 1'b0;

    assign mem_w_en = (mode == 2'b01 & s == 1'b0) ? 1'b1 : 1'b0;

    assign wb_en = (mode == 2'b10) ? 1'b0:
                   (mode == 2'b01 & s == 1'b0) ? 1'b0:
                   (mode == 1'b00 & (op_code == 4'b1010 | op_code == 4'b1000 )) ? 1'b0 :
                   (exp_ready == 1'b0) ? 1'b0 : 1'b1;

    assign b = (mode == 2'b10) ? 1'b1 : 1'b0; //branch
    
    always @(op_code, mode) begin
        if(mode == 2'b00 | mode == 2'b01)begin
            case(op_code)
                4'b1101: exe_cmd = 4'b0001; //MOV
                4'b1111: exe_cmd = 4'b1001; //MVN
                4'b0100: exe_cmd = 4'b0010; //ADD, LDR, STR
                4'b0101: exe_cmd = 4'b0011; //ADC
                4'b0010: exe_cmd = 4'b0100; //SUB
                4'b0110: exe_cmd = 4'b0101; //SBC
                4'b0000: exe_cmd = 4'b0110; //AND
                4'b1100: exe_cmd = 4'b0111; //ORR
                4'b0001: exe_cmd = 4'b1000; //EOR
                4'b1010: exe_cmd = 4'b0100; //CMP
                4'b1000: exe_cmd = 4'b0110; //TST
                default: exe_cmd = 4'b0000;
            endcase
        end
        else
            exe_cmd = 4'b0000;
    end

    assign exp_en = (op_code == 4'b0011);   //EXP
    assign exp_ready = ( (exp_en == 1'b1) & (exp_count < 5'b10100) ) ? 1'b0 : 1'b1;

    always @(posedge clk, posedge rst) begin
        if (rst)
            exp_count <= 5'b0;
        else if (exp_en) begin
            if (exp_count == 5'b10100) begin
                exp_count <= 5'b0;
            end
            else begin
                exp_count <= exp_count+1'b1;
            end
        end
    end

endmodule