module ConditionCheck (
    clk, rst,
    cond, status_reg,
    cond_out
);
    input clk, rst;
    input [3:0] cond, status_reg;
    output cond_out;

    wire n, z, c, v;
    assign n = status_reg[3];
    assign z = status_reg[2];
    assign c = status_reg[1];
    assign v = status_reg[0];

    always @(cond, n, z, c, v) begin
        case (cond)
            4'b0000: cond_out = (z == 1'b1);
            4'b0001: cond_out = (z == 1'b0);
            4'b0010: cond_out = (c == 1'b1);
            4'b0011: cond_out = (c == 1'b0);
            4'b0100: cond_out = (n == 1'b1);
            4'b0101: cond_out = (n == 1'b0);
            4'b0110: cond_out = (v == 1'b1);
            4'b0111: cond_out = (v == 1'b0);
            4'b1000: cond_out = ({c,z} == 2'b10);
            4'b1001: cond_out = ({c,z} == 1'b01);
            4'b1010: cond_out = (n == v);
            4'b1011: cond_out = (n != v);
            4'b1100: cond_out = (z == 1'b0 && n == v);
            4'b1101: cond_out = (z == 1'b1 && n != v);
            4'b1110: cond_out = 1'b1;
        endcase
    end

endmodule