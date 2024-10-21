`timescale 1ns/1ps

module test_gate_tb;
    reg a, b;
    wire c;

    //instantiate the module under test (MUT), UUT is unit under test
    test_gate uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        $dumpfile("test.vcd");      
        $dumpvars(0, test_gate_tb); 

        a = 0;
        b = 0;

        #5 a = 1; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 1;

        #10 //delay 10ns
        $finish;
    end

    initial begin
        $monitor("Time: %0t | a: %b, b: %b, c: %b", $time, a, b, c);
    end
endmodule
