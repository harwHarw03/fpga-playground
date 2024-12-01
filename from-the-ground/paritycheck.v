module three_bit_even_parcheck_gen (pe, b);

input [2:0] b;
output pe;

// dataflow
assign pe = b[0] ^ b[1] ^ b[2];

endmodule

module three_bit_even_parcheck_check(c, pe, b);

input [2:0] b;
input pe;
output c; // check, error or not

// dataflow
assign c = b[0] ^ b[1] ^ b[2] ^ pe;

endmodule