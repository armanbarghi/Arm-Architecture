module Mux2to1 #(parameter N = 32) (
	i0, i1, 
	sel, 
	y
);
	input [N-1:0] i0, i1;
	input sel;
	output [N-1:0] y;

	assign y = (sel==1'b1) ? i1 : i0;

endmodule
