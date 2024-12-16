//3-bit adder based on full adder blocks
//it is called ripple carry adder

module fadd_module( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = (a ^ b) ^ cin;
    assign cout = ((a ^ b) & cin) | (a & b);

endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    fadd_module ins1(a[0], b[0], cin, cout[0], sum[0]);
    fadd_module ins2(a[1], b[1], cout[0], cout[1], sum[1]);
    fadd_module ins3(a[2], b[2], cout[1], cout[2], sum[2]);
    

endmodule

