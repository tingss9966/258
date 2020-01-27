module block(LEDR, SW, select);
	input [9:0] SW;
	input [2:0] select;
	output [9:0] LEDR;
	reg out;
	always @(*)
	begin
		case(select)
			3'b000: out = SW[0];
			3'b001: out = SW[1];
			3'b010: out = SW[2];
			3'b011: out = SW[3];
			3'b100: out = SW[4];
			3'b101: out = SW[5];
			3'b110: out = SW[6];
			default: out = 0;
		endcase
	end
	assign LEDR[0] = out;
endmodule

	
			