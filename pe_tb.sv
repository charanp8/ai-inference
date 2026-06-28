// Testbench for Processing Element (PE)
module pe_tb;

    logic clk;
    logic rst;
    logic [7:0] weight_in;
    logic [7:0] activation_in;
    logic [31:0] partial_sum_in;
    logic flush_accum;

    logic [7:0] weight_out;
    logic [31:0] partial_sum_out;

    pe instance1 (
        .clk(clk),
        .rst(rst),
        .weight_in(weight_in),
        .activation_in(activation_in),
        .partial_sum_in(partial_sum_in),
        .flush_accum(flush_accum),
        .weight_out(weight_out),
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
        weight_in = 8'd20;
        activation_in = 8'd20;
        partial_sum_in = 32'd100;

        // Let the pipeline run for 4 cycles
        for (cycle = 0; cycle < 4; cycle++) begin
            #1 clk = ~clk;
        end

        $display("Result: %d (expected: 500)", partial_sum_out);
        $finish;
    end

endmodule
