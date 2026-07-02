// Testbench for Processing Element (PE)
module pe_tb;

    logic clk;
    logic rst;
    logic load_weight;
    logic [7:0] weight_in;
    logic [7:0] activation_in;
    logic [31:0] partial_sum_in;
    logic flush_accum;

    logic [7:0] weight_down_out;
    logic [7:0] activation_out;
    logic [31:0] partial_sum_out;

    pe instance1 (
        .clk(clk),
        .rst(rst),
        .load_weight(load_weight),
        .weight_down(weight_in),
        .activation_in(activation_in),
        .activation_out(activation_out),
        .partial_sum_in(partial_sum_in),
        .flush_accum(flush_accum),
        .weight_down_out(weight_down_out),
        .partial_sum_out(partial_sum_out)
    );

    // Free-running clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize all signals
        rst = 1;
        load_weight = 0;
        weight_in = 0;
        activation_in = 0;
        partial_sum_in = 0;
        flush_accum = 0;

        // Hold reset for 2 cycles
        @(posedge clk); @(posedge clk);
        rst = 0;

        // Load weight: signal stable before posedge
        load_weight = 1;
        weight_in = 8'd20;
        @(posedge clk);   // PE captures stored_weight=20
        @(negedge clk);   // wait for negedge so NBA has applied

        // Switch to compute — signals stable before next posedge
        load_weight = 0;
        weight_in = 0;
        activation_in = 8'd20;
        partial_sum_in = 32'd100;
        @(posedge clk);  // Stage 1: mult_stage1 = 20*20=400, ps_out = 0+100=100
        @(posedge clk);  // Stage 2: ps_out = 400+100=500
        @(posedge clk);  // One more cycle to be safe

        #1;
        $display("Result: %d (expected: 500)", partial_sum_out);
        $finish;
    end

endmodule
