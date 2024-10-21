`timescale 1ns/1ps

module half_adder_tb;
    reg A, B;
    wire Sum, Carry; 
    
    half_adder uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );
    
    initial begin
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end

    always @(*) begin
        $display("A=%b, B=%b, Sum=%b, Carry=%b", A, B, Sum, Carry);
    end
endmodule

module full_adder_tb;
    reg A, B, Cin; 
    wire Sum, Carry; 
    
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Carry(Carry)
    );
    
    initial begin
        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 1; #10;
        $finish;
    end

    always @(*) begin
        $display("A=%b, B=%b, Cin=%b, Sum=%b, Carry=%b", A, B, Cin, Sum, Carry);
    end
endmodule

module comparator_2bit_tb;
    reg [1:0] A, B;
    wire A_gt_B, A_lt_B, A_eq_B; 
    
    comparator_2bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
    );
    
    initial begin
        A = 2'b00; B = 2'b00; #10;
        A = 2'b00; B = 2'b01; #10;
        A = 2'b01; B = 2'b01; #10;
        A = 2'b10; B = 2'b01; #10;
        A = 2'b11; B = 2'b10; #10;
        A = 2'b11; B = 2'b11; #10;
        $finish;
    end

    always @(*) begin
        $display("A=%b, B=%b, A_gt_B=%b, A_lt_B=%b, A_eq_B=%b", A, B, A_gt_B, A_lt_B, A_eq_B);
    end
endmodule
