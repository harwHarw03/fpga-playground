module BLINK (clk, reset, leds);
    input clk, reset;
    output [3:0] leds;
    
    reg [3:0] counter = 0;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    assign leds = counter[3:0];

endmodule
