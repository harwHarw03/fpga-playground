module top_module ( input [1:0] A, input [1:0] B, output z ); 
    always @(*) begin
        if (A == B) begin
            z = 1'b1;
        end else begin 
            z = 1'b0;
        end
    end
    
    // or can simply use assign z = (A[1:0]==B[1:0]);
endmodule
