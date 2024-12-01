module one_bit_comparator (x, y, g, e, l, o1, o2, o3);

input wire x, y;
output wire g, e, l;

// structural modelling
output wire o1, o2, o3; 

not g1(o1, y);
and g2(g, o1, x);

xor g3(o2, x, y);
not g4(e, o2);

not g5(o3, x);
and g6(l, o3, y);

// dataflow modelling
assign g = x & ~y;
assign e = ~(x ^ y);
assign l = ~x & y;

endmodule