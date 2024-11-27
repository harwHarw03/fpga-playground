module latches (S, R, Q, _Q);
input wire S, R;
output wire Q, _Q;

assign Q  = ~(R | _Q);
assign _Q = ~(Q | S);

endmodule

module sr_latch (
    input wire S,
    input wire R,
    output wire Q,
    output wire Qn
);
    wire nor1_out, nor2_out;

    assign nor1_out = ~(S | Qn);
    assign nor2_out = ~(R | nor1_out);

    assign Q = nor1_out;
    assign Qn = nor2_out;
endmodule

module d_latch (
    input wire D,
    input wire Enable,
    output wire Q,
    output wire Qn
);
    wire S, R;

    assign S = D & Enable;
    assign R = ~D & Enable;

    sr_latch sr_latch_inst (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );
endmodule

module d_flip_flop (D, clk, Q, Qn);
input wire D;
input wire clk;
output wire Q;
output wire Qn;

wire Q_master, Qn_master;

d_latch master_latch (
    .D(D),
    .Enable(clk),
    .Q(Q_master),
    .Qn(Qn_master)
);

d_latch slave_latch (
    .D(Q_master),
    .Enable(~clk),
    .Q(Q),
    .Qn(Qn)
);

endmodule

module jk_ff (J, K, clk, Q);
input wire J, K, clk;
output reg Q;

always @(posedge clk) begin 
    case ({J, K}) 
        2'b00: Q <= Q;          // No change
        2'b01: Q <= 0;          // Reset
        2'b10: Q <= 1;          // Set
        2'b11: Q <= ~Q;         // Toggle
    endcase
end 

endmodule


module traffic_light_fsm (
    input wire clk, 
    input wire reset,
    output reg [2:0] light  // 3-bit output: {Red, Yellow, Green}
);

    // Define states using parameters
    parameter RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;
    reg [1:0] state, next_state;

    // State Transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= RED;  // Reset to RED state
        else
            state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case (state)
            RED: next_state = GREEN;
            GREEN: next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;  // Default case to handle unexpected states
        endcase
    end

    // Output Logic
    always @(*) begin
        case (state)
            RED: light = 3'b100;    // Red light on
            GREEN: light = 3'b001;  // Green light on
            YELLOW: light = 3'b010; // Yellow light on
            default: light = 3'b100; // Default case to handle unexpected states
        endcase
    end
endmodule
