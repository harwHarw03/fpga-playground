module banba_tb;
    reg a;
    wire b_nba, c_nba;
    wire b_ba, c_ba;

    ba ba_uut(
        .a(a),
        .b(b_ba),
        .c(c_ba)
    );

    nba nba_uut(
        .a(a),
        .b(b_nba),
        .c(c_nba)
    );

    initial begin
        a = 1;

        $display("Blocking Assignment Module:");
        #5;
        $display("Blocking: A = %b, B = %b, C = %b, Time = %0t", a, b_ba, c_ba, $time);
        #10
        $display("nonBlocking Assignment Module:");
        #5;
        $display("nonBlocking: A = %b, B = %b, C = %b, Time = %0t", a, b_nba, c_nba, $time);

        $finish;
    end

endmodule