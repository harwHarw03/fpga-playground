`timescale 1ns / 1ps

module Testbench;

    // Clock and Reset
    reg clk, reset;

    // D Flip-Flop Signals
    reg D;
    wire Q_DFF;

    // JK Flip-Flop Signals
    reg J, K;
    wire Q_JKFF;

    // Register Signals
    reg [3:0] D_reg;
    wire [3:0] Q_reg;

    // ROM Signals
    reg [2:0] rom_addr;
    wire [3:0] rom_data;

    // RAM Signals
    reg [2:0] ram_addr;
    reg [3:0] ram_data_in;
    wire [3:0] ram_data_out;
    reg we;

    // Instantiate Modules
    DFlipFlop dff (.D(D), .clk(clk), .reset(reset), .Q(Q_DFF));
    JKFlipFlop jkff (.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q_JKFF));
    Register reg4 (.D(D_reg), .clk(clk), .reset(reset), .Q(Q_reg));
    ROM rom (.addr(rom_addr), .data(rom_data));
    RAM ram (.addr(ram_addr), .data_in(ram_data_in), .we(we), .clk(clk), .data_out(ram_data_out));

    // Clock Generation
    always #5 clk = ~clk; // 10ns clock period

    // Test Sequence
    initial begin
        // Initialize signals
        clk = 0; reset = 1; 
        D = 0; J = 0; K = 0; 
        D_reg = 4'b0000; rom_addr = 3'b000; 
        ram_addr = 3'b000; ram_data_in = 4'b0000; we = 0;

        // VCD file generation
        $dumpfile("testbench.vcd"); // Specify VCD file name
        $dumpvars(0, Testbench);   // Dump all signals in the Testbench module

        // Start test sequence
        #10 reset = 0;

        // Test D Flip-Flop
        D = 1; #10; D = 0; #10;

        // Test JK Flip-Flop
        J = 1; K = 0; #10; // Set
        J = 0; K = 1; #10; // Reset
        J = 1; K = 1; #10; // Toggle

        // Test Register
        D_reg = 4'b1010; #10;
        D_reg = 4'b0101; #10;

        // Test ROM
        rom_addr = 3'b000; #10;
        rom_addr = 3'b001; #10;
        rom_addr = 3'b010; #10;

        // Test RAM
        we = 1; ram_addr = 3'b011; ram_data_in = 4'b1111; #10; // Write
        we = 0; ram_addr = 3'b011; #10; // Read

        $finish; // End simulation
    end

    // Monitor Signals
    initial begin
        $monitor("Time=%0d | Reset=%b | D=%b Q_DFF=%b | J=%b K=%b Q_JKFF=%b | D_reg=%b Q_reg=%b | ROM addr=%b data=%b | RAM addr=%b data_in=%b data_out=%b we=%b",
                 $time, reset, D, Q_DFF, J, K, Q_JKFF, D_reg, Q_reg, rom_addr, rom_data, ram_addr, ram_data_in, ram_data_out, we);
    end
endmodule
