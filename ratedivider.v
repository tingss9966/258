module ratedivider(SW,HEX0);
	input [9:0] SW;
	output [6:0] HEX0;
	reg [27:0]out;
	wire add;
	assign add = out;
	wire[27:0] connect1, connect2, connect3, connect4;
	wire [3:0] oout;
	divider one(.number(28'b0000000000000000000000000001),
					.clk(CLOCK_50),
					.reset(SW[9]),
					.out(connect1));
	
	divider two(.number(28'b0010111110101111000001111111),
					.clk(CLOCK_50),
					.reset(SW[9]),
					.out(connect2));
	
	divider three(.number(28'b0101111101011110000011111111),
					.clk(CLOCK_50),
					.reset(SW[9]),
					.out(connect3));
					
	divider four(.number(28'b1011111010111100000111111111),
					.clk(CLOCK_50),
					.reset(SW[9]),
					.out(connect4));
					
	always @(*)
		begin 
			case (SW[1:0])
				2'b00: out = (connect1 == 28'b0000000000000000000000000000) ? 1'b1 : 1'b0;
				2'b01: out = (connect2 == 28'b0000000000000000000000000000) ? 1'b1 : 1'b0;
				2'b10: out = (connect3 == 28'b0000000000000000000000000000) ? 1'b1 : 1'b0;
				2'b11: out = (connect4 == 28'b0000000000000000000000000000) ? 1'b1 : 1'b0;
				default: out = 1'b0;
			endcase
		end
	
	display dis(.add(add),
			  .clk(CLOCK_50),
			  .reset(SW[9]),
			  .out(oout));
			  
	mux hex(.out(HEX0[6:0]),
			  .in(oout));
			  
endmodule

module display(add,clk,reset,out);
	input add, clk, reset;
	output reg [3:0] out;
	always @(posedge clk, negedge reset)
		begin
			if (reset == 1'b0)
				out <= 4'b000;
			else if (add == 1'b1)
				begin
					if (out == 4'b1111)
						out <= 4'b0000;
					else
						out <= out + 1'b1;
				end
		end
endmodule

module divider(number, clk, reset, out);
	input [27:0] number;
	input clk,reset;
	output [27:0]out;
	reg [27:0] q;
	assign out = q;
	always @(posedge clk, negedge reset)
	begin
		if (reset == 1'b0)
			q <= number;
		else
			begin
				if (q==0)
					q <= number;
				else
					q <= q - 1'b1;
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