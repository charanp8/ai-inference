module controller_tb;

    logic clk;
    logic rst;
    logic start;
    logic load_weight;
    logic flush_accum;
    logic done;

    controller dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .load_weight(load_weight),
        .flush_accum(flush_accum),
        .done(done)
    );

    // have the clock running
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("t=%0t state=%0d load_weight=%b done=%b counter=%0d", $time, dut.state, load_weight, done, dut.counter);

        start = 0;
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;

        #5;

        start = 1;
        repeat(20) @(posedge clk);

        
        
        $finish;
    end

endmodule