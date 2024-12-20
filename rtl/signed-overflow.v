module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    // assign s = ...
    // assign overflow = ... (used to detect signed overflow, in signed-bit representation)
    assign s = a + b;
    assign overflow = (a[7] == b[7]) && (s[7] != a[7]);

    //example    
//a = 01111111 (127, max positive value in 8 bits)
//b = 00000001 (+1)
//s = 10000000 (-128, overflow occurred)
//overflow = 1

endmodule
