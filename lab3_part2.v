module adder(LEDR, SW);
	input [9:0] SW;
	output[9:0] LEDR;
	wire c1, c2, c3;
	FA one(.A(SW[0]),
		.B(SW[6]),
		.cin(SW[5]),
		.s(LEDR[0]),
		.cout(c1));
		
	FA two(.A(SW[1]),
		.B(SW[7]),
		.cin(c1),
		.s(LEDR[1]),
		.cout(c2));
	
	FA three(.A(SW[2]),
		.B(SW[8]),
		.cin(c2),
		.s(LEDR[2]),
		.cout(c3));
	
	FA four(.A(SW[3]),
		.B(SW[9]),
		.cin(c3),
		.s(LEDR[3]),
		.cout(LEDR[4]));
endmodule

module FA(A,B,cin,s,cout);
	input A,B,cin;
	output s,cout;
	assign s = A^B^cin;
	assign cout = (B & cin) | (A & cin) | (A & B);
endmodule
	