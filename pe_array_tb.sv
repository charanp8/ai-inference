// Testbench for 4x4 PE Array
module pe_array_tb;

    logic clk;
    logic rst;
    logic load_weight;
    logic flush_accum;
    logic [7:0] weight_in [0:3];
    logic [7:0] activation_in [0:3];
    wire  [31:0] partial_sum_out [0:3][0:3];

    pe_array dut (
        .clk(clk),
        .rst(rst),
        .load_weight(load_weight),
        .flush_accum(flush_accum),
        .weight_in(weight_in),
        .activation_in(activation_in),
        .partial_sum_out(partial_sum_out)
    );

    // Free-running clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize
        rst = 1;
        load_weight = 0;
        flush_accum = 0;
        weight_in[0] = 0; weight_in[1] = 0; weight_in[2] = 0; weight_in[3] = 0;
        activation_in[0] = 0; activation_in[1] = 0;
        activation_in[2] = 0; activation_in[3] = 0;

        // Reset for 2 cycles
        @(posedge clk); @(posedge clk);
        rst = 0;

        // Load weights — shift [10,20,30,40] down one row per cycle
        load_weight = 1;
        weight_in[0] = 8'd10; weight_in[1] = 8'd10;
        weight_in[2] = 8'd10; weight_in[3] = 8'd10;
        @(posedge clk);  // row 0 gets weight 10

        weight_in[0] = 8'd20; weight_in[1] = 8'd20;
        weight_in[2] = 8'd20; weight_in[3] = 8'd20;
        @(posedge clk);  // row 1 gets weight 10, row 0 gets 20

        weight_in[0] = 8'd30; weight_in[1] = 8'd30;
        weight_in[2] = 8'd30; weight_in[3] = 8'd30;
        @(posedge clk);  // row 2 gets 10, row 1 gets 20, row 0 gets 30

        weight_in[0] = 8'd40; weight_in[1] = 8'd40;
        weight_in[2] = 8'd40; weight_in[3] = 8'd40;
        @(posedge clk);  // row 3 gets 10, row 2 gets 20, row 1 gets 30, row 0 gets 40

        // Switch to compute phase
        load_weight = 0;
        weight_in[0] = 0; weight_in[1] = 0;
        weight_in[2] = 0; weight_in[3] = 0;

        // Stream activations
        activation_in[0] = 8'd5; activation_in[1] = 8'd5;
        activation_in[2] = 8'd5; activation_in[3] = 8'd5;

        // Wait enough cycles for pipeline to fill: 4 cols + 2 pipeline stages
        repeat (10) @(posedge clk);

        #1;
        $display("=== Row 0 results (weight=40, act=5: PE[0][0]=200, accumulates by 200 per column) ===");
        $display("PE[0][0]: %d", partial_sum_out[0][0]);
        $display("PE[0][1]: %d", partial_sum_out[0][1]);
        $display("PE[0][2]: %d", partial_sum_out[0][2]);
        $display("PE[0][3]: %d", partial_sum_out[0][3]);

        $finish;
    end

endmodule
