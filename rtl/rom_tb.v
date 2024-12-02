module ROM_4x8_tb;

reg [1:0] address;
wire [7:0] data;

ROM_4x8 uut (.address(address), .data(data));

initial begin 
    $monitor("Time: %0t | Address: %b | Data: %h", $time, address, data);

    address = 2'b00; #10; //test access address 0
    address = 2'b01; #10;
    address = 2'b10; #10;
    address = 2'b11; #10;

    $finish;
end

endmodule