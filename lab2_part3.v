module mux(HEX0, SW);
        input [9:0] SW;
        output [6:0] HEX0;

        zero u0(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[0])
                );
			one u1(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[1])
                );
			two u2(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[2])
                );

			three u3(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[3])
                );

			four u4(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[4])
                );

			five u5(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[5])
                );
				
			six u6(
                .c0(SW[0]),
                .c1(SW[1]),
                .c2(SW[2]),
					 .c3(SW[3]),
                .out(HEX0[6])
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
