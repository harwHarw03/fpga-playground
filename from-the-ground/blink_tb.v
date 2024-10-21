module BLINK_TB;
    reg clk;
    reg reset;
    wire [3:0] leds;
    
    BLINK uut (
        .clk(clk),
        .reset(reset),
        .leds(leds)
    );

    initial begin 
        clk = 0;
        $display("Time\tclk\treset\tleds");
    end  
    always #5 clk = ~clk;
    
    initial begin
        reset = 0;
        #100 reset = 1;
        #10 reset = 0;
        #100 $finish;
    end
    always @(posedge clk) begin
        // $display("leds = %b", leds);
        
        $monitor("%0t\t%b\t%b\t%h : %b", $time, clk, reset, leds, leds);
    end

endmodule