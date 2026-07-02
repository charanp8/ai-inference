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
    logic [31:0] partial_sum_out;

    pe instance1 (
        .clk(clk),
        .rst(rst),
        .load_weight(load_weight),
        .weight_down(weight_in),
        .activation_in(activation_in),
        .partial_sum_in(partial_sum_in),
        .flush_accum(flush_accum),
        .weight_down_out(weight_down_out),
        .partial_sum_out(partial_sum_out)
    );

    integer cycle;

    initial begin
        clk = 0;
        rst = 1;
        weight_in = 0;
        activation_in = 0;
        partial_sum_in = 0;
        flush_accum = 0;

        // Reset for 2 cycles
        for (cycle = 0; cycle < 2; cycle++) begin
            #1 clk = ~clk;
        end

        rst = 0;

        // Load weight
        load_weight = 1;
        weight_in = 8'd20;
        #1 clk = ~clk;

        // Switch to compute
        load_weight = 0;
        weight_in = 0;
        activation_in = 8'd20;
        partial_sum_in = 32'd100;

        // Run pipeline for 4 cycles
        for (cycle = 0; cycle < 4; cycle++) begin
            #1 clk = ~clk;
        end

        $display("Result: %d (expected: 500)", partial_sum_out);
        $finish;
    end

endmodule
