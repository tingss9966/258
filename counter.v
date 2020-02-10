module counter(SW, KEY, HEX0, HEX1);
	input [9:0]SW;
	input [3:0]KEY;
	output [6:0] HEX0, HEX1;
	wire enable, clock, clear_b;
	assign enable = SW[1];
	assign clock = KEY[0];
	assign clear_b = SW[0];
	wire and1, and2, and3, and4, and5, and6, and7;
	wire out1, out2, out3, out4, out5, out6, out7;
	wire out;
	tflip one(.t(enable),
				 .clk(clock),
				 .q(and1),
				 .reset(clear_b));
	assign out1 = enable & and1;
	
	tflip two(.t(out1),
				 .clk(clock),
				 .q(and2),
				 .reset(clear_b));
	assign out2 = out1 & and2;
	
	tflip three(.t(out2),
				 .clk(clock),
				 .q(and3),
				 .reset(clear_b));
	assign out3 = out2 & and3;
	
	tflip four(.t(out3),
				 .clk(clock),
				 .q(and4),
				 .reset(clear_b));
	assign out4 = out3 & and4;
	
	tflip five(.t(out4),
				 .clk(clock),
				 .q(and5),
				 .reset(clear_b));
	assign out5 = out4 & and5;
	
	tflip six(.t(out5),
				 .clk(clock),
				 .q(and6),
				 .reset(clear_b));
	assign out6 = out5 & and6;
	
	tflip seven(.t(out6),
				 .clk(clock),
				 .q(and7),
				 .reset(clear_b));
	assign out7 = out6 & and7;
	
	tflip eight(.t(out7),
				 .clk(clock),
				 .q(out),
				 .reset(clear_b));
				 
	mux number1(.out(HEX0[6:0]),
			  .in({{{out, and7}, and6}, and5}));
			  
	mux number2(.out(HEX1[6:0]),
			  .in({{{and4, and3}, and2}, and1}));
endmodule

module tflip(t,clk,q,reset);
	input t,clk,reset;
	output q;
	reg q;
	always @(posedge clk, negedge reset)
	begin
		if (reset == 1'b0)
			q <= 1'b0;
		else
			begin
				if (t==1'b1)
					q <= ~q;
				else
					q <= q;
			end
	end
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