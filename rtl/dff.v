module DFlipFlop (
    input wire D,
    input wire clk,
    input wire reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else
            Q <= D;
    end
endmodule
