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
    output [31:0] result;

    wire N, Z, C, V;
    assign {C, result} = (exe_cmd == 4'b0001) ? (in2) :  //MOV
                         (exe_cmd == 4'b1001) ? (~in2) : //MVN
                         (exe_cmd == 4'b0010) ? (in1 + in2) :    //ADD, LDR, STR
                         (exe_cmd == 4'b0011) ? (in1 + in2 + carry_in) : //ADC
                         (exe_cmd == 4'b0100) ? (in1 - in2) :    //SUB, CMP
                         (exe_cmd == 4'b0101) ? (in1 - in2 - ~carry_in) :    //SBC
                         (exe_cmd == 4'b0110) ? (in1 & in2) :    //AND, TST
                         (exe_cmd == 4'b0111) ? (in1 | in2) :    //ORR
                         (exe_cmd == 4'b1000) ? (in1 ^ in2) :    //EOR

                          32'b0 ;
 
    assign N = (result[31] == 1'b1) ? 1'b1 : 1'b0;
    assign Z = (result == 32'b0) ? 1'b1 : 1'b0;
    assign V = ((exe_cmd == 4'b0010 | exe_cmd == 4'b0011) & (in1[31] == 1'b0 & in2[31] == 1'b0 & result[31] == 1'b1)) ? 1'b1:
               ((exe_cmd == 4'b0010 | exe_cmd == 4'b0011) & (in1[31] == 1'b1 & in2[31] == 1'b1 & result[31] == 1'b0)) ? 1'b1:
                1'b0;
               
    assign status_bits = {N, Z, C, V};

endmodule