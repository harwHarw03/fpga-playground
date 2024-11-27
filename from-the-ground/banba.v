module ba(a, b, c);
    input a;
    output reg b, c;
    
    initial begin
        b = a;
        c = b;
    end
endmodule


module nba(a, b, c);
    input a;
    output reg b, c;

    initial begin
        #1
        b <= a;
        #1
        c <= b;
    end

endmodule