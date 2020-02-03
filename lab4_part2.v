module lab4(LEDR, HEX0, HEX1,HEX2,HEX3, HEX4, HEX5, SW, KEY);
	input [9:0] SW;
	output [7:0] LEDR;
	output [6:0]HEX0, HEX1,HEX2,HEX3, HEX4, HEX5;
	input [2:0] KEY;
	
	reg [7:0]out;
	wire [7:0] wire1, wire2, wire3;
	wire [6:0] connect1, connect2, connect3, connect4;
	wire [3:0] A;
	reg [3:0] B;
	wire clk, reset_n;
	
	assign reset_n = SW[9];
	assign clk = KEY[0];
	assign A = SW[3:0];
	
	adder addone(.out(wire1[7:0]),
					.a(A),
					.b(4'b0001));
	
	adder addB(.out(wire2[7:0]),
				.a(A),
			   .b(B));
			
	mux zero(.out(HEX0[6:0]),
				.in(SW[3:0]));
				
	mux four(.out(HEX4[6:0]),
				.in(LEDR[3:0]));
				
	mux five(.out(HEX5[6:0]),
				.in(LEDR[7:4]));
				
	always @(posedge clk)
	begin
		if (reset_n == 1'b0)
			B <= 4'b0000;
		else
			B <= LEDR[3:0];
	end
		
	always @(*)
	begin
		case (SW[7:5])
			3'b000: out = {3'b000, wire1};
			3'b001: out = {3'b000, wire2};
			3'b010: out = A + B;
			3'b011: out = {A^B, A|B};
			3'b100: out = {7'b0000000, | SW[7:0]};
			3'b101: out = B <<< A;
			3'b110: out = B << A;
			3'b111: out = A * B;
			default: out = {8'b00000000};
		endcase
	end		
	assign LEDR = out;
	assign HEX1[6:0] = 7'b1111111;
	assign HEX2[6:0] = 7'b1111111;
	assign HEX3[6:0] = 7'b1111111;
		
endmodule

module adder(out, a, b);
	input [3:0] a;
	input [3:0] b;
	output[7:0] out;
	wire c1, c2, c3;
	FA one(.A(a[0]),
		.B(b[0]),
		.cin(1'b0),
		.s(out[0]),
		.cout(c1));
		
	FA two(.A(a[1]),
		.B(b[1]),
		.cin(c1),
		.s(out[1]),
		.cout(c2));
	
	FA three(.A(a[2]),
		.B(b[2]),
		.cin(c2),
		.s(out[2]),
		.cout(c3));
	
	FA four(.A(a[3]),
		.B(b[3]),
		.cin(c3),
		.s(out[3]),
		.cout(out[4]));
endmodule

module FA(A,B,cin,s,cout);
	input A,B,cin;
	output s,cout;
	assign s = A^B^cin;
	assign cout = (B & cin) | (A & cin) | (A & B);
endmodule
	
module mux(out, in);
        input [3:0] in;
        output [6:0] out;

        zero u0(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[0])
                );
			one u1(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[1])
                );
			two u2(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[2])
                );

			three u3(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[3])
                );

			four u4(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[4])
                );

			five u5(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[5])
                );
				
			six u6(
                .c0(in[0]),
                .c1(in[1]),
                .c2(in[2]),
					 .c3(in[3]),
                .out(out[6])
                );



endmodule

module zero(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = c0 & ~c1 & c2 & c3 | ~c0 & ~c1 & c2 & ~c3 | c0 & ~c1 & ~c2 & ~c3| c0 & c1 & ~c2 & c3; 
endmodule

module one(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = ~c0 & c2 & c3 | c0 & c1 & c2 & c3 | c0 & ~c1 & c2 & ~c3| ~c0 & c1 & c2 | c0 & c1 & ~c2 & c3; 
endmodule

module two(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = ~c0 & c2 & c3 | c0 & c1 & c2 & c3 | ~c0 & c1 & ~c2 & ~c3; 
endmodule

module three(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = c0 & ~c1 & ~c2 | c0 & c1 & c2 | ~c0 & ~c1 & c2 & ~c3| ~c0 & c1 & ~c2 & c3; 
endmodule

module four(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = c0 & ~c3 | c0 & ~c1 & ~c2 | ~c1 & c2 & ~c3; 
endmodule

module five(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = c0 & c1 & ~c3 | c0 & ~c2 & ~c3 | c0 & ~c1 & c2 & c3| ~c0 & c1 & ~c2 & ~c3; 
endmodule

module six(c0,c1,c2,c3,out);
        input c0;
        input c1;
        input c2;
		  input c3;
        output out;

        assign out = ~c1 & ~c2 & ~c3 | c0 & c1 & c2 & ~c3 | ~c0 & ~c1 & c2 & c3; 
endmodule 
