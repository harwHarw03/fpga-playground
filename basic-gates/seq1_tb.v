`timescale 1ns/1ps

module d_flip_flop_tb;
reg D, clk;
wire Q, Qn;

d_flip_flop uut (
    .D(D),
    .clk(clk),
    .Q(Q),
    .Qn(Qn)
);

always #2 clk = ~clk;

initial begin
    #3
    clk = 0;
    $display("Time | D clk | Q Qn");
    D = 0; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q, Qn);  // Initial state
    D = 1; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q, Qn);  // Set
    D = 0; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q, Qn);  // Reset
    D = 1; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q, Qn);  // Set
    $finish;
end

endmodule