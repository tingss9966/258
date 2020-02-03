module shifter(SW, KEY, LEDR);
	input [9:0] SW;
	input [3:0] KEY;
	output [9:0] LEDR;
	wire q0,q1,q2,q3,q4,q5,q6,q7;
	wire reset_n,load_n,clk,in,shiftright;
	assign reset_n = SW[9];
	assign shiftright = KEY[2];
	assign load_n = KEY[1];
	assign clk = KEY[0];
	
	
	mux2to1 asr(.x(1'b0),
					.y(q0),
					.s(KEY[3]),
					.out(in));
					
	shifterbit one(.in(in),
					   .q(q7),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[7]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit two(.in(q7),
					   .q(q6),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[6]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit three(.in(q6),
					   .q(q5),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[5]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit four(.in(q5),
					   .q(q4),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[4]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit five(.in(q4),
					   .q(q3),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[3]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit six(.in(q3),
					   .q(q2),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[2]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit seven(.in(q2),
					   .q(q1),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[1]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	shifterbit eight(.in(q1),
					   .q(q0),
					   .reset(reset_n),
					   .clk(clk),
					   .load_val(SW[0]),
					   .load_n(load_n),
					   .shiftright(shiftright));
						
	assign LEDR[7] = q7;
	assign LEDR[6] = q6;
	assign LEDR[5] = q5;
	assign LEDR[4] = q4;
	assign LEDR[3] = q3;
	assign LEDR[2] = q2;
	assign LEDR[1] = q1;
	assign LEDR[0] = q0;
endmodule

module shifterbit(in, q, reset, clk, load_val, load_n, shiftright);
	input in, reset, clk, load_val, load_n, shiftright;
	output q;
	wire wire1,wire2;
	mux2to1 first(.x(q),
					  .y(in),
					  .s(shiftright),
					  .out(wire1));
					  
	mux2to1 second(.x(load_val),
						.y(wire1),
						.s(load_n),
						.out(wire2));
	
	flipflop flop(.d(wire2),
					  .clk(clk),
					  .reset_n(reset),
					  .q(q));
					  
endmodule

module flipflop(d,clk,reset_n,q);
	input d, clk, reset_n;
	output reg q;
	always @(posedge clk)
	begin
		if (reset_n == 1'b0)
			q <= 0;
		else
			q <= d;
	end
endmodule

module mux2to1(x,y,s,out);
	input x;
	input y;
	input s;
	output out;
	
	assign out = y & s | ~s & x;
endmodule
