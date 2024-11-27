//-----------------------------------------------------------
// File: fpu_tb.v
// FPU Test Bench
//-----------------------------------------------------------
`timescale 1 ns/100 ps
module fpu_tb ();
 //----------------------------------------------------------
 // inputs to the DUT are reg type
 reg clock;
 reg [31:0] a, b;
 reg [1:0] op;
 reg [31:0] correct;
 //----------------------------------------------------------
 // outputs from the DUT are wire type
 wire [31:0] out;
 wire [49:0] pro;
 //----------------------------------------------------------
 // instantiate the Device Under Test (DUT)
 // using named instantiation
 fpu U1 (
          .clk(clock),
          .A(a),
          .B(b),
          .opcode(op),
          .O(out)
        );
 //----------------------------------------------------------
 // create a 10Mhz clock
 always
 #100 clock = ~clock; // every 100 nanoseconds invert
 //----------------------------------------------------------
 // initial blocks are sequential and start at time 0
 initial
 begin
 $dumpfile("fpu_tb.vcd");
 $dumpvars(0,clock, a, b, op, out);
 clock = 0;op = 2'b01;
a = 32'b00000101101100011110001011001100;
b = 32'b11101100110101100111101100001011;
correct = 32'b01101100110101100111101100001011;
#400 //1.6728312e-35 * -2.0743294e+27 = 2.0743294e+27
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b01100010100001111011100111001100;
b = 32'b10111001010011100001011001000010;
correct = 32'b01100010100001111011100111001100;
#400 //1.2518493e+21 * -0.00019653983 = 1.2518493e+21
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b00101010100001111000101111001111;
b = 32'b10110100111001101101000110001101;
correct = 32'b00110100111001101101000110010101;
#400 //2.407783e-13 * -4.2993307e-07 = 4.299333e-07
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b01100010011110001011100001100111;
b = 32'b01100110110000101110011101011100;
correct = 32'b11100110110000100110101100000000;
#400 //1.14702e+21 * 4.6020346e+23 = -4.5905645e+23
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b00111000000010000001001010101101;
b = 32'b11100010010011000100101001001110;
correct = 32'b01100010010011000100101001001110;
#400 //3.244232e-05 * -9.421225e+20 = 9.421225e+20
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b00010101101111101010100010010001;
b = 32'b00011111010001000111101101111011;
correct = 32'b10011111010001000111101101100011;
#400 //7.700634e-26 * 4.1606755e-20 = -4.1606678e-20
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b11101110100100110001000010000011;
b = 32'b10100001011110111011011011000100;
correct = 32'b11101110100100110001000010000011;
#400 //-2.275713e+28 * -8.5283996e-19 = -2.275713e+28
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b01100011111101010101001000100000;
b = 32'b10000010011100001011101001100101;
correct = 32'b01100011111101010101001000100000;
#400 //9.05074e+21 * -1.7685908e-37 = 9.05074e+21
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b00100100110011010000111111101000;
b = 32'b11000101010010111000010111101000;
correct = 32'b01000101010010111000010111101000;
#400 //8.8931524e-17 * -3256.3691 = 3256.3691
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
a = 32'b01011111010111001101001011100100;
b = 32'b11100111110001000111111000101010;
correct = 32'b01100111110001000111111010011000;
#400 //1.5912031e+19 * -1.8558223e+24 = 1.8558381e+24
if ((correct - out > 2) && (out - correct > 2)) begin
$display ("A      : %b %b %b %h", a[31], a[30:23], a[22:0], a);
$display ("B      : %b %b %b %h", b[31], b[30:23], b[22:0], b);
$display ("Output : %b %b %b %h", out[31], out[30:23], out[22:0], out);
$display ("Correct: %b %b %b %h",correct[31], correct[30:23], correct[22:0], correct); $display();end
$display ("Done.");
$finish;
 // stop the simulation
 end

endmodule