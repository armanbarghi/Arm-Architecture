module Forwarding_Unit (
    clk, rst,
    mem_wb_en, wb_wb_en,
    src1, src2,
    mem_dest, wb_dest,
    sel_src1, sel_src2
);
    input clk, rst;
    input mem_wb_en, wb_wb_en;
    input [3:0] src1, src2;
    input [3:0] mem_dest, wb_dest;
    output reg [1:0] sel_src1, sel_src2;

    always @(src1, src2, mem_wb_en, wb_wb_en, mem_dest, wb_dest) begin
        if (mem_wb_en) begin
            if (src1 == mem_dest)
                sel_src1 = 2'b01;
            if (src2 == mem_dest)
                sel_src2 = 2'b01;
        end
        else if (wb_wb_en) begin
            if (src1 == wb_dest)
                sel_src1 = 2'b10;
            if (src2 == wb_dest)
                sel_src2 = 2'b10;
        end
        else begin
            sel_src1 = 2'b00;
            sel_src2 = 2'b00;
        end
    end

endmodule
