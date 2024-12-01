module one_bit_comparator_tb;

reg x, y;
wire g, e, l, o1, o2, o3;

one_bit_comparator uut(x, y, g, e, l, o1, o2, o3);

initial begin 
    x = 0; y = 0;
    #10 x = 0; y = 1;
    #10 x = 1; y = 0;
    #10 x = 1; y = 1;
    #5
    $finish;
end

initial begin 
    $monitor("Time = %0t | X = %b | Y = %b | g = %b | e = %b | l = %b", 
        $time, x, y, g, e, l);
end

endmodule