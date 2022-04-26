module Val2_Generator (
        shift_operand,
        imm,
        val_rm,
        control_input,
        Val2
);

    input imm, control_input;
    input [11:0] shift_operand;
    input [31:0] val_rm;
    output reg [31:0] Val2;
    
    reg [63:0] rotate_wire;
    reg [63:0] immd;
    reg [4:0] shift_im;
    reg [4:0] rotate_im;
    
    always@(shift_operand, imm, val_rm, control_input)
    begin
      immd = {{24{shift_operand[7]}} , shift_operand[7:0] , {24{shift_operand[7]}} , shift_operand[7:0]};
      rotate_im = {shift_operand[11:8] , 1'b0};
      rotate_wire = {val_rm , val_rm};
      shift_im = shift_operand[11:7];
      if(control_input == 1'b1) begin
            Val2 <= {{20{shift_operand[11]}}, shift_operand};
      end
      else if(imm == 1'b0 && shift_operand[4] == 1'b0) begin
          case(shift_operand[6:5])
            2'b00 : Val2 <= (val_rm << shift_operand[11:7]);
            2'b01 : Val2 <= (val_rm >> shift_operand[11:7]);
            2'b10 : Val2 <= (val_rm >>> shift_operand[11:7]);
            2'b11 : Val2 <= (rotate_wire[shift_im+31-:32]);
          endcase
      end
      else if(imm == 1'b1) begin        
          Val2 <= immd[rotate_im+31-:32];
      end
    end
    
   
endmodule