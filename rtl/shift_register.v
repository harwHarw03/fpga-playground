module my_dff (
    input clk,
    input d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;  // on the positive edge of clk, assign d to q
    end
endmodule

module top_module ( input clk, input d, output q );
    wire con1, con2;
    
    my_dff ins1(.clk(clk), .d(d), .q(con1));
    my_dff ins2(.clk(clk), .d(con1), .q(con2));
    my_dff ins3(.clk(clk), .d(con2), .q(q));
endmodule
