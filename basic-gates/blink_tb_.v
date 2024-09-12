module BLINK_TB;
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
        reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #100 $finish;
    end
    always begin
        #5 clk = ~clk;
    end
    always @(posedge clk) begin
        $display("leds = %b", leds);
    end

endmodule