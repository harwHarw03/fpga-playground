`timescale 1ns / 1ps
module BLINK_tb;

    reg clk;
    reg reset;
    wire [3:0] leds;

    BLINK uut (
        .clk(clk),
        .reset(reset),
        .leds(leds)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10;
        reset = 0;

        #160; 

        $finish;
    end

    initial begin
        $monitor("Time: %0t | Reset: %b | LEDs: %b", $time, reset, leds);
    end

endmodule
