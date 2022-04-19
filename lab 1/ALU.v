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

    assign result = (exe_cmd == 4'b0001) ? (in2) :  //MOV
                    (exe_cmd == 4'b1001) ? (~in2) : //MVN
                    (exe_cmd == 4'b0010) ? (in1 + in2) :    //ADD, LDR, STR
                    (exe_cmd == 4'b0011) ? (in1 + in2 + carry_in) : //ADC
                    (exe_cmd == 4'b0100) ? (in1 - in2) :    //SUB, CMP
                    (exe_cmd == 4'b0101) ? (in1 - in2 - ~carry_in) :    //SBC
                    (exe_cmd == 4'b0110) ? (in1 & in2) :    //AND, TST
                    (exe_cmd == 4'b0111) ? (in1 | in2) :    //ORR
                    (exe_cmd == 4'b1000) ? (in1 ^ in2) :    //EOR
                    32'b0 ;
    // FIXME: update status_bits
endmodule