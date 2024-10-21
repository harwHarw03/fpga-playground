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
