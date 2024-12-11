// a one-bit wide, 2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b

module top_module( 
    input a, b, sel,
    output out ); 
    // (sel & b) | (~sel & a) or
    assign out = (sel?b:a);

endmodule

// the ternary solution also work to this problem 
//input [99:0] a, b,
//input sel,
//output [99:0] out );
