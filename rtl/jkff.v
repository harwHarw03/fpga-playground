module JKFlipFlop (
    input wire J,
    input wire K,
    input wire clk,
    input wire reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (J && ~K)
            Q <= 1;
        else if (~J && K)
            Q <= 0;
        else if (J && K)
            Q <= ~Q;
    end
endmodule
