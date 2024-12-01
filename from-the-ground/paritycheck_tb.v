module three_bit_even_parcheck_tb;

reg [2:0] b;
reg parity;
wire pe, c;

three_bit_even_parcheck_gen uut (pe, b);

three_bit_even_parcheck_check uut_check (
    .c(c),
    .pe(parity),
    .b(b)
  );

initial begin
    $display("Time | b       | Generated Parity (pe) | Parity Input (parity) | Checker Output (c)");
    $monitor("%4t | %b     | %b                     | %b                     | %b", 
             $time, b, pe, parity, c);
    
    b = 3'b000; parity = 0; #10; // case 0
    b = 3'b001; parity = 1; #10; 
    b = 3'b010; parity = 1; #10; 
    b = 3'b011; parity = 0; #10; 
    b = 3'b100; parity = 0; #10; // should be 1 | error 
    b = 3'b101; parity = 0; #10; 
    b = 3'b110; parity = 1; #10; // should be 0 | error
    b = 3'b111; parity = 1; #10; 

    $display("for Even parcheck. gen | if number of 1 bit even, : 0 | parity input is manual input");
    #5 $finish;
  end
endmodule

