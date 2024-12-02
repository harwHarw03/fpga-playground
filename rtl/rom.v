module ROM_4x8 (data, address);

input [1:0] address;
output [7:0] data;

reg [7:0] rom[0:3]; // 4x8 ROM

assign data = rom[address];

initial begin 
    $readmemb("rom_entries.txt", rom);
end


endmodule
