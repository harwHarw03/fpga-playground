module gate_and (A, B, Y);
input wire A, B;
output wire Y;

assign Y = A & B;

endmodule

module gate_or (A, B, Y);
input wire A, B;
output wire Y;

assign Y = A | B;

endmodule

module gate_not (A, Y);
input wire A;
output wire Y;

assign Y = ~A;

endmodule

module gate_xor (A, B, Y);
input wire A, B;
output wire Y;

assign Y = A ^ B;

endmodule

module gate_nor (A, B, Y);
input wire A, B;
output wire Y;
wire or_out;

gate_or or_gate (A, B, or_out);

gate_not not_gate (or_out, Y); 

endmodule

module mux2 (A, B, S, Y);
input wire A, B, S;
output wire Y;

assign Y = S ? B : A; 

endmodule

module mux4 (A, B, C, D, S1, S0, Y);
input wire A, B, C, D, S1, S0;
output wire Y;

assign Y = (S1 & S0) ? D : (S1 & ~S0) ? C : (S0 & ~S1) ? B : A;

endmodule

module dec2t4 (A, D);
input wire [1:0] A;
output wire [3:0] D;

assign D[0] = ~A[0] & ~A[1]; 
assign D[1] = A[0] & ~A[1];
assign D[2] = ~A[0] & A[1];
assign D[3] = A[0] & A[1];

endmodule