module RTL (clk, reset, load, add, data_in, regA);

input wire clk, reset, load, add;
input wire [3:0] data_in;
output reg [3:0] regA;

always @(posedge clk or posedge reset) begin 
    if (reset)
        regA <= 4'b0000; // clear register
    else if (load) 
        regA <= data_in;
    else if (add)
        regA <= regA + data_in;
end

endmodule