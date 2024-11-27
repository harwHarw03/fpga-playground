`timescale 1ns/1ps

module latches_tb;
reg S, R;
wire Q, _Q;

latches _latches(S, R, Q, _Q);

initial begin 
    #5
    S = 0; R = 0;
    #5
    S = 0; R = 1;
    #5
    S = 1; R = 0;
    #5
    S = 0; R = 0;
    #5
    S = 1; R = 1;
    #5
    $finish;
end 

initial $monitor("Time = %0t: S = %b, R = %b, Q = %b, _Q = %b", $time, S, R, Q, _Q);

endmodule

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

`timescale 1ns/1ps

module tb_traffic_light_fsm;
    reg clk, reset;
    wire [2:0] light;  // 3-bit light output

    // Instantiate the FSM
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .light(light)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0; reset = 1; #10;
        reset = 0;
        $display("Light: {Red, Yellow, Green}");
        
        // Observe the traffic light states
        #50 $finish;
    end

    // Monitor the light output
    always @(*) begin
        $display("Time: %0t | Light: %b", $time, light);
    end
endmodule
