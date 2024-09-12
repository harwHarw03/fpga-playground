`timescale 1ns/1ps

module mux_tb;
reg data1, data2, S;
wire out;

mux2 mux2_uut (
    .A(data1),
    .B(data2),
    .S(S),
    .Y(out)
);

initial begin 
    data1 = 0;
    data2 = 1;
end 

initial begin 
    S = 0;
    #5
    S = 1;
    #5
    $finish;
end

initial begin 
    $monitor("A=%b, B=%b, S=%b, Y=%b\n", data1, data2, S, out);
end


endmodule
