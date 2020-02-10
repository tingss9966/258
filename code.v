module morsecode(SW,KEY,LEDR);
	input [2:0]SW;
	input [1:0]KEY;
	output [9:0]LEDR;
	wire [27:0] q;
	wire [15:0] code;
	wire clk;
	wire temp;
	LUT lu(SW[2:0],code);
	divider div(.number(28'b0001011111010111100000111111),
					.clk(CLOCK_50),
					.reset(KEY[0]),
					.out(q));
	
	assign clk = (q==0 ? 1 : 0);
	shifter shift(.innum(code),
						.reset_n(KEY[0]),
						.load_n(KEY[1]),
						.clk(clk),
						.shiftright(1'b1),
						.in(1'b0),
						.out(temp));
						
	assign LEDR[0] = temp;
endmodule

module LUT(letter, morse_code);
	input [2:0] letter;
	output reg [15:0] morse_code;

	always @(letter)
	begin
		case(letter)
			3'b000: morse_code = 16'b1010100000000000;
			3'b001: morse_code = 16'b1110000000000000;
			3'b010: morse_code = 16'b1010111000000000;
			3'b011: morse_code = 16'b1010101110000000;
			3'b100: morse_code = 16'b1011101110000000;
			3'b101: morse_code = 16'b1110101011100000;
			3'b110: morse_code = 16'b1110101110111000;
			3'b111: morse_code = 16'b1110111010100000;
		endcase
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
			
module shifter(innum, reset_n,load_n,clk,shiftright,in, out);
        input [15:0] innum;
        output out;
        wire q0,q1,q2,q3,q4,q5,q6,q7,q_1,q_2,q_3,q_4,q_5,q_6,q_7,q_8;
        input reset_n,load_n,clk,in,shiftright;
		  wire connect;
        
        
        mux2to1 asr(.x(1'b0),
                    .y(q0),
                    .s(in),
                    .out(connect));
                                        
        shifterbit one(.in(connect),
                       .q(q7),
                       .reset(reset_n),
                       .clk(clk),
                       .load_val(innum[15]),
                       .load_n(load_n),
                       .shiftright(shiftright));
                                                
        shifterbit two(.in(q7),
                       .q(q6),
                       .reset(reset_n),
                       .clk(clk),
                       .load_val(innum[14]),
                       .load_n(load_n),
                       .shiftright(shiftright));
                                                
        shifterbit three(.in(q6),
                         .q(q5),
                         .reset(reset_n),
                         .clk(clk),
                         .load_val(innum[13]),
                         .load_n(load_n),
                         .shiftright(shiftright));
                                                
        shifterbit four(.in(q5),
							 .q(q4),
							 .reset(reset_n),
							 .clk(clk),
							 .load_val(innum[12]),
							 .load_n(load_n),
							 .shiftright(shiftright));
                                                
        shifterbit five(.in(q4),
							 .q(q3),
							 .reset(reset_n),
							 .clk(clk),
							 .load_val(innum[11]),
							 .load_n(load_n),
							 .shiftright(shiftright));
                                                
        shifterbit six(.in(q3),
							 .q(q2),
							 .reset(reset_n),
							 .clk(clk),
							 .load_val(innum[10]),
							 .load_n(load_n),
							 .shiftright(shiftright));
															
        shifterbit seven(.in(q2),
								 .q(q1),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[9]),
								 .load_n(load_n),
								 .shiftright(shiftright));
                                                
        shifterbit eight(.in(q1),
								 .q(q0),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[8]),
								 .load_n(load_n),
								 .shiftright(shiftright));
								 
		shifterbit nine(.in(q0),
								 .q(q_1),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[7]),
								 .load_n(load_n),
								 .shiftright(shiftright));
								 
		shifterbit ten(.in(q_1),
								 .q(q_2),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[6]),
								 .load_n(load_n),
								 .shiftright(shiftright));
		
		shifterbit eleven(.in(q_2),
								 .q(q_3),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[5]),
								 .load_n(load_n),
								 .shiftright(shiftright));
		
		shifterbit twelve(.in(q_3),
								 .q(q_4),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[4]),
								 .load_n(load_n),
								 .shiftright(shiftright));
								 
		shifterbit thirteen(.in(q_4),
								 .q(q_5),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[3]),
								 .load_n(load_n),
								 .shiftright(shiftright));
								 
		shifterbit fourteen(.in(q_5),
								 .q(q_6),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[2]),
								 .load_n(load_n),
								 .shiftright(shiftright));
								 
		shifterbit fifteen(.in(q_6),
								 .q(q_7),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[1]),
								 .load_n(load_n),
								 .shiftright(shiftright));
								 
		shifterbit sixteen(.in(q_7),
								 .q(q_8),
								 .reset(reset_n),
								 .clk(clk),
								 .load_val(innum[0]),
								 .load_n(load_n),
								 .shiftright(shiftright));
															
        assign out = q_8;
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