module gate_tb;
    reg a, b;
    reg [1:0] addr;
    wire y_and, y_or, y_not, y_xor, y_nor;
    wire mux2_out, mux4_out;
    wire [3:0] dec_out;

    gate_and and_gate(.A(a), .B(b), .Y(y_and));
    gate_or or_gate(.A(a), .B(b), .Y(y_or));
    gate_not not_gate(.A(a), .Y(y_not));
    gate_xor xor_gate(.A(a), .B(b), .Y(y_xor));
    gate_nor nor_gate(.A(a), .B(b), .Y(y_nor));
    mux2 mux2_inst(.A(a), .B(b), .S(a), .Y(mux2_out));
    mux4 mux4_inst(.A(a), .B(b), .C(~a), .D(~b), .S1(a), .S0(b), .Y(mux4_out));
    dec2t4 decoder(.A(addr), .D(dec_out));

    initial begin
        a = 0; b = 0; addr = 2'b00;
        // Write more test or use looping
        #5;

        $display("A = %b, B = %b, AND = %b", a, b, y_and);
        $display("A = %b, B = %b, OR = %b", a, b, y_or);
        $display("A = %b, NOT = %b", a, y_not);
        $display("A = %b, B = %b, XOR = %b", a, b, y_xor);
        $display("A = %b, B = %b, NOR = %b", a, b, y_nor);
        $display("MUX2: A = %b, B = %b, Sel = %b, Output = %b", a, b, a, mux2_out);
        $display("MUX4: A = %b, B = %b, C = %b, D = %b, S1 = %b, S0 = %b, Output = %b", 
                 a, b, ~a, ~b, a, b, mux4_out);
        $display("Decoder: A = %b, Output = %b", addr, dec_out);

        a = 1; b = 0; addr = 2'b01; #5;  // Change inputs
        $display("A = %b, B = %b, AND = %b", a, b, y_and);
        $display("A = %b, B = %b, OR = %b", a, b, y_or);
        $display("A = %b, NOT = %b", a, y_not);
        $display("A = %b, B = %b, XOR = %b", a, b, y_xor);
        $display("A = %b, B = %b, NOR = %b", a, b, y_nor);
        $display("MUX2: A = %b, B = %b, Sel = %b, Output = %b", a, b, a, mux2_out);
        $display("MUX4: A = %b, B = %b, C = %b, D = %b, S1 = %b, S0 = %b, Output = %b", 
                 a, b, ~a, ~b, a, b, mux4_out);
        $display("Decoder: A = %b, Output = %b", addr, dec_out);

        $finish;
    end
endmodule


/// Manual but works

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
