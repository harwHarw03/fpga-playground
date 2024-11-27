`timescale 1ns/1ps

module sequential_tb;
    reg S, R;
    wire Q, _Q;

    latches _latches(S, R, Q, _Q);

    initial begin 
        $display("----- Latches Test -----");
        #5 S = 0; R = 0; #5
        S = 0; R = 1; #5
        S = 1; R = 0; #5
        S = 0; R = 0; #5
        S = 1; R = 1; #5
        $finish;
    end 

    initial $monitor("Time = %0t: S = %b, R = %b, Q = %b, _Q = %b", $time, S, R, Q, _Q);

    reg D, clk;
    wire Q_ff, Qn_ff;

    d_flip_flop d_ff_inst (
        .D(D),
        .clk(clk),
        .Q(Q_ff),
        .Qn(Qn_ff)
    );

    always #2 clk = ~clk;

    initial begin
        #3 clk = 0;
        $display("----- D Flip-Flop Test -----");
        $display("Time | D clk | Q Qn");
        D = 0; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q_ff, Qn_ff);  // Initial state
        D = 1; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q_ff, Qn_ff);  // Set
        D = 0; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q_ff, Qn_ff);  // Reset
        D = 1; #5; $display("%0t | %b %b | %b %b", $time, D, clk, Q_ff, Qn_ff);  // Set
    end

    reg J, K;
    wire Q_jk;

    jk_ff jk_ff_inst (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q_jk)
    );

    always #5 clk = ~clk;

    initial begin
        #10 clk = 0;
        $display("----- JK Flip-Flop Test -----");
        $display("J K clk | Q");
        J = 0; K = 0; #10; $display("%b %b %b | %b", J, K, clk, Q_jk);  // No change
        J = 1; K = 0; #10; $display("%b %b %b | %b", J, K, clk, Q_jk);  // Set
        J = 0; K = 1; #10; $display("%b %b %b | %b", J, K, clk, Q_jk);  // Reset
        J = 1; K = 1; #10; $display("%b %b %b | %b", J, K, clk, Q_jk);  // Toggle
    end

    reg reset;
    wire [2:0] light;  // 3-bit light output

    traffic_light_fsm fsm_inst (
        .clk(clk),
        .reset(reset),
        .light(light)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; #10;
        reset = 0;
        $display("----- Traffic Light FSM Test -----");
        $display("Light: {Red, Yellow, Green}");
        
        #50 $finish;
    end

    always @(*) begin
        $display("Time: %0t | Light: %b", $time, light);
    end

endmodule
