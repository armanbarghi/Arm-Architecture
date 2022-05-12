module Mux4to1 #(parameter N = 32) (
	i0, i1, i2, i3,
	sel, 
	y
);
	input [N-1:0] i0, i1, i2, i3;
	input [1:0] sel;
	output [N-1:0] y;

	assign y = (sel==2'b00) ? i0 :
               (sel==2'b01) ? i1 :
               (sel==2'b10) ? i2 :
                i3;

endmodule