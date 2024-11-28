module RTL_tb;

reg clk, reset, load, add;
reg [3:0] data_in;
wire [3:0] regA;

// unit under test
RTL uut (clk, reset, load, add, data_in, regA);

// generate clock
always #5 clk = ~clk;

//test sequence
initial begin 
    clk = 0;
    reset = 1;
    load = 0;
    add = 0;
    data_in = 4'b0000; //initial input

    #10 reset = 0;

    #10 load = 1; 
    data_in = 4'b0101; // load 5
    #10 load = 0;

    #10 add = 1;
    data_in = 4'b0001; //add 1
    #10 add = 0;

    #10 add = 1;
    data_in = 4'b0011; //add 3
    #10 add = 0;

    #10 reset = 1;
    #10 reset = 0;

    #10 

    $finish;
end

initial begin 
    $monitor("Time = %0t | Reset = %b | Load = %b | Add = %b | Data_in = %b | RegA = %b", 
        $time, reset, load, add, data_in, regA);
end

endmodule