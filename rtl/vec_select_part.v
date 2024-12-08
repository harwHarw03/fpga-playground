module top_module(
    input [31:0] in,
    output reg [31:0] out
);
    integer i;
    always @(*) begin
        for (i = 0; i < 32; i = i + 8) begin
            // reorder bytes in 'in' to 'out'
            out[31 - i -: 8] = in[i +: 8];  // select 4 bits starting from index i
        end
    end
endmodule
