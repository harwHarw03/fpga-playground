`timescale 1ns/1ps

module dec_tb;
reg [1:0] A;
wire [3:0] D;

dec2t4 dec2t4_uut (A, D);

initial begin 
    A = 2'b00;

    #10 

    A = 2'b01; #5
    A = 2'b10; #5
    A = 2'b11; #5


    $finish;
end

initial $monitor("Time = %0t: A = %b, D = %b", $time, A, D);


endmodule