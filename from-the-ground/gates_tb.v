`timescale 1ps/1ps

module gates_tb;
reg A, B;
wire Y_and, Y_or, Y_not, Y_xor, Y_nor;

gate_and and_gate (A, B, Y_and);
gate_or or_gate (A, B, Y_or);
gate_not not_gate (A, Y_not);
gate_xor xor_gate (A, B, Y_xor);
gate_nor nor_gate (A, B, Y_nor);

initial begin
    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 $finish;
end

always @(*) begin
    $display("A=%b, B=%b, Y_and=%b, Y_or=%b, Y_not=%b, Y_xor=%b, Y_nor=%b", A, B, Y_and, Y_or, Y_not, Y_xor, Y_nor);
end

endmodule