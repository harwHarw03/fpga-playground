// A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 3-bit input vector.
module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    wire C, D;
// based on truth table (using SOP)
    assign C = ~in[0] & ~in[1] & in[2] | ~in[0] & in[1] & ~in[2] | in[0] & ~in[1] & ~in[2] | in[0] & in[1] & in[2];
    assign D = ~in[0] & in[1] & in[2] | in[0] & ~in[1] & in[2] | in[0] & in[1] & ~in[2] | in[0] & in[1] & in[2];
    assign out = {D, C};
    
    // Yet another method uses behavioural code inside a procedure (combinational always block)
	// to directly implement the truth table:
	/*
	always @(*) begin
		case (in)
			3'd0: out = 2'd0;
			3'd1: out = 2'd1;
			3'd2: out = 2'd1;
			3'd3: out = 2'd2;
			3'd4: out = 2'd1;
			3'd5: out = 2'd2;
			3'd6: out = 2'd2;
			3'd7: out = 2'd3;
		endcase
	end
	*/

endmodule
