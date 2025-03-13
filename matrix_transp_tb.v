`timescale 1ns / 1ps

module tb_matrix_transpose;

    // Parameters
    parameter ROWS = 4;
    parameter COLS = 4;
    parameter DATA_WIDTH = 8;

    // Inputs
    reg clk;
    reg reset;
    reg enable;
    reg [ROWS*COLS*DATA_WIDTH-1:0] matrix_in;

    // Outputs
    wire [ROWS*COLS*DATA_WIDTH-1:0] matrix_out;

    // Instantiate the matrix_transpose module
    matrix_transpose #(
        .ROWS(ROWS),
        .COLS(COLS),
        .DATA_WIDTH(DATA_WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .matrix_in(matrix_in),
        .matrix_out(matrix_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        enable = 0;
        matrix_in = 0;
        #10;
        
        // Release reset
        reset = 0;
        #10;
        
        // Apply first test vector
        enable = 1;
        // Example 4x4 matrix:
        // | 1  2  3  4 |
        // | 5  6  7  8 |
        // | 9 10 11 12 |
        // |13 14 15 16 |
        matrix_in = {
            8'd1, 8'd2, 8'd3, 8'd4,
            8'd5, 8'd6, 8'd7, 8'd8,
            8'd9, 8'd10, 8'd11, 8'd12,
            8'd13, 8'd14, 8'd15, 8'd16
        };
        #10;
        
        // Disable enable
        enable = 0;
        #10;
        
        // Wait and observe the output
        #20;
        
        // Finish simulation
        $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | matrix_out = %h", $time, matrix_out);
    end

endmodule
