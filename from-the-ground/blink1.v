module BLINK (
    input clk,
    input reset,
    output [3:0] leds
);
    reg [3:0] counter = 0;
    reg [3:0] pattern; // register to hold current LED pattern

    reg [3:0] MEM [0:15]; // pattern memory | 16 patterns (4-bit each)

    // Initialize memory with predefined patterns
    initial begin
        MEM[0] = 4'b0001;
        MEM[1] = 4'b0010;
        MEM[2] = 4'b0100;
        MEM[3] = 4'b1000;
        MEM[4] = 4'b1111;
        MEM[5] = 4'b1010;
        MEM[6] = 4'b0101;
        MEM[7] = 4'b0011;
        MEM[8] = 4'b0110;
        MEM[9] = 4'b1100;
        MEM[10] = 4'b0000;
        MEM[11] = 4'b1110;
        MEM[12] = 4'b1001;
        MEM[13] = 4'b0111;
        MEM[14] = 4'b1011;
        MEM[15] = 4'b1101;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            pattern <= MEM[0]; // reset to first pattern
        end else begin
            counter <= counter + 1;
            if (counter == 4'd15) begin // cycle through 16 patterns
                counter <= 0; // reset counter
            end
            pattern <= MEM[counter]; // load pattern from memory
        end
    end

    assign leds = pattern;

endmodule
