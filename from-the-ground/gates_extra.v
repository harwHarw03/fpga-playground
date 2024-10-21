module half_adder (A, B, Sum, Carry);
input wire A, B;
output wire Sum, Carry;

assign Sum = A & ~B || ~A & B; // A ^ B
assign Carry = A & B;

endmodule

module full_adder (A, B, Cin, Sum, Carry);
input wire A, B, Cin;
output wire Sum, Carry;

assign Sum = A ^ B ^ Cin;
assign Carry = (A & B) | (Cin & (A ^ B));

endmodule
 

module comparator_2bit (A, B, A_gt_B, A_lt_B, A_eq_B);
    input wire [1:0] A, B;
    output wire A_gt_B, A_lt_B, A_eq_B;
    
    assign A_gt_B = (A > B);  // A is greater than B
    assign A_lt_B = (A < B);  // A is less than B
    assign A_eq_B = (A == B); // A is equal to B
endmodule