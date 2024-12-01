module RAM (
    input wire [2:0] addr,
    input wire [3:0] data_in,
    input wire we,
    input wire clk,
    output reg [3:0] data_out
);
    reg [3:0] ram[0:7]; // 8x4 RAM

    always @(posedge clk) begin
        if (we)
            ram[addr] <= data_in;
        else
            data_out <= ram[addr];
    end
endmodule
