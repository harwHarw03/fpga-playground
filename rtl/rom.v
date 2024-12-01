module ROM (
    input wire [2:0] addr,
    output reg [3:0] data
);
    reg [3:0] rom[0:7]; // 8x4 ROM

    initial begin
        rom[0] = 4'b0000;
        rom[1] = 4'b0001;
        rom[2] = 4'b0010;
        rom[3] = 4'b0011;
        rom[4] = 4'b0100;
        rom[5] = 4'b0101;
        rom[6] = 4'b0110;
        rom[7] = 4'b0111;
    end

    always @(addr) begin
        data = rom[addr];
    end
endmodule
