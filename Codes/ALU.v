module ALU (
    in1, in2, 
    carry_in,
    exe_cmd,
    status_bits,
    result
);
    input [31:0] in1, in2;
    input carry_in;
    input [3:0] exe_cmd;
    output [3:0] status_bits;
    output reg [31:0] result;

    wire N, Z, V;
    reg C;
    wire [32:0] x1,x2,x3,x4,x5,x6,x7,x8,x9;

    always @(exe_cmd, in1, in2, carry_in) begin
        case(exe_cmd)
            4'b0101: {C, result} = x1;    //SBC
            4'b0011: {C, result} = x2;    //ADC
            4'b0010: {C, result} = x3;    //ADD, LDR, STR
            4'b0100: {C, result} = x4;    //SUB, CMP
            4'b0110: {C, result} = x5;    //AND, TST
            4'b0111: {C, result} = x6;    //ORR
            4'b1000: {C, result} = x7;    //EOR
            4'b1001: {C, result} = x8;    //MVN
            4'b0001: {C, result} = x9;    //MOV
            default: {C, result} = 32'b0;
        endcase
    end

    assign x1 = (in1 - in2 - {31'b0, ~carry_in});
    assign x2 = (in1 + in2 + carry_in);
    assign x3 = (in1 + in2);
    assign x4 = (in1 - in2);
    assign x5 = (in1 & in2);
    assign x6 = (in1 | in2);
    assign x7 = (in1 ^ in2);
    assign x8 = (~in2);
    assign x9 = (in2);

    assign N = result[31];
    assign Z = (result == 32'b0) ? 1'b1 : 1'b0;
    assign V = (  (exe_cmd == 4'b0010 | exe_cmd == 4'b0011)  &  ( ((~in1[31])&(~in2[31])&result[31]) | (in1[31]&in2[31]&(~result[31])) )  ) ? 1'b1:
               (  (exe_cmd == 4'b0100 | exe_cmd == 4'b0101)  &  ( (in1[31]&(~in2[31])&(~result[31])) | ((~in1[31])&in2[31]&result[31]) )  ) ? 1'b1:
                1'b0;
               
    assign status_bits = {N, Z, C, V};

endmodule
