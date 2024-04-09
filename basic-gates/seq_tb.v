`timescale 1ns/1ps

module latches_tb;
reg S, R;
wire Q, _Q;

latches _latches(S, R, Q, _Q);

initial begin 
    #5
    S = 0; R = 0;
    #5
    S = 0; R = 1;
    #5
    S = 1; R = 0;
    #5
    S = 0; R = 0;
    #5
    S = 1; R = 1;
    #5
    $finish;
end 

initial $monitor("Time = %0t: S = %b, R = %b, Q = %b, _Q = %b", $time, S, R, Q, _Q);

endmodule
