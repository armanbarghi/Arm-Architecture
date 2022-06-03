module Val2_Generator (
	shift_operand,
	imm,
	val_rm,
	control_input,
	val2
);
	input imm, control_input;
	input [11:0] shift_operand;
	input [31:0] val_rm;
	output reg [31:0] val2;
	
	wire [63:0] rotate_wire;
	wire [63:0] immd;
	wire [4:0] shift_im;
	wire [4:0] rotate_im;
	
	assign immd = {{24{shift_operand[7]}} , shift_operand[7:0] , {24{shift_operand[7]}} , shift_operand[7:0]};
	assign rotate_im = {shift_operand[11:8] , 1'b0};
	assign rotate_wire = {val_rm , val_rm};

	always @(shift_operand, imm, val_rm, control_input) begin
		if (control_input == 1'b1) begin
			val2 <= {{20{shift_operand[11]}}, shift_operand};
		end
		else if(imm == 1'b0 && shift_operand[4] == 1'b0) begin
			case(shift_operand[6:5])
				2'b00 : val2 <= (val_rm << shift_operand[11:7]);
				2'b01 : val2 <= (val_rm >> shift_operand[11:7]);
				2'b10 : val2 <= (val_rm >>> shift_operand[11:7]);
				2'b11 : val2 <= (rotate_wire >> shift_operand[11:7]);
			endcase
		end
		else if(imm == 1'b1) begin
			val2 <= (immd >> rotate_im);
		end
	end

endmodule
