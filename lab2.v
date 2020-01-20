
module mux(LEDR, SW);
	input [9:0] SW;
	output [9:0] LEDR;
	wire wire1;
	wire wire2;	
	
	mux2to1 u0(
		.x(SW[0]),
		.y(SW[1]),
		.s(SW[9]),
		.out(wire1)
		);
		
	mux2to1 u1(
		.x(SW[2]),
		.y(SW[3]),
		.s(SW[9]),
		.out(wire2)
		);
		
	mux2to1 u3(
		.x(wire1),
		.y(wire2),
		.s(SW[8]),
		.out(LEDR[0])
		);
		
endmodule

module mux2to1(x,y,s,out);
	input x;
	input y;
	input s;
	output out;
	
	assign out = y & s | ~s & x;
endmodule


