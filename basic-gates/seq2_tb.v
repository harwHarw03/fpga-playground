`timescale 1ps/1ps

module tb_jk_flip_flop;
reg J, K, clk;
wire Q;

jk_ff uut (
    .J(J),
    .K(K),
    .clk(clk),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    $display("J K clk | Q");
    J = 0; K = 0; #10; $display("%b %b %b | %b", J, K, clk, Q);  // No change
    J = 1; K = 0; #10; $display("%b %b %b | %b", J, K, clk, Q);  // Set
    J = 0; K = 1; #10; $display("%b %b %b | %b", J, K, clk, Q);  // Reset
    J = 1; K = 1; #10; $display("%b %b %b | %b", J, K, clk, Q);  // Toggle
    $finish;
end
endmodule