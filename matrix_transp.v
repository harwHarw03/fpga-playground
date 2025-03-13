`timescale 1ns / 1ps

module matrix_transpose #(
    parameter ROWS = 4,               // Number of rows in the input matrix
    parameter COLS = 4,               // Number of columns in the input matrix
    parameter DATA_WIDTH = 8          // Bit-width of each matrix element
)(
    input wire clk,                   // Clock signal
    input wire reset,                 // Synchronous reset
    input wire enable,                // Enable signal to start transpose
    input wire [ROWS*COLS*DATA_WIDTH-1:0] matrix_in, // Flattened input matrix
    output reg [ROWS*COLS*DATA_WIDTH-1:0] matrix_out // Flattened transposed matrix
);

// Internal registers to hold intermediate states
reg [ROWS*COLS*DATA_WIDTH-1:0] transpose_reg;
integer i, j;

always @(posedge clk) begin
    if (reset) begin
        transpose_reg <= 0;
        matrix_out <= 0;
    end
    else if (enable) begin
        // Perform the transpose operation
        for (i = 0; i < ROWS; i = i + 1) begin
            for (j = 0; j < COLS; j = j + 1) begin
                // Calculate the bit positions
                // Each element occupies DATA_WIDTH bits
                // Flattened in row-major order
                // To transpose, swap i and j indices
                transpose_reg[(j*ROWS + i)*DATA_WIDTH +: DATA_WIDTH] = 
                    matrix_in[(i*COLS + j)*DATA_WIDTH +: DATA_WIDTH];
            end
        end
        matrix_out <= transpose_reg;
    end
end

endmodule
