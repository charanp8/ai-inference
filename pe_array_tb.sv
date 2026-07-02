// Testbench for 4x4 PE Array
module pe_array_tb;

    logic clk;
    logic rst;
    logic load_weight;
    logic flush_accum;
    logic [7:0] weight_in [0:3];
    logic [7:0] activation_in [0:3];
    logic [31:0] partial_sum_out [0:3][0:3];

    pe_array dut (
        .clk(clk),
        .rst(rst),
        .load_weight(load_weight),
        .flush_accum(flush_accum),
        .weight_in(weight_in),
        .activation_in(activation_in),
        .partial_sum_out(partial_sum_out)
    );

    logic [7:0] weight_values [0:3];
    integer cycle;

    initial begin
        // TODO: Initialize signals
        clk = 0;
        rst = 1;
        load_weight = 0;
        flush_accum = 0;

        weight_in[0] = 0;
        weight_in[1] = 0;
        weight_in[2] = 0;
        weight_in[3] = 0;
        activation_in[0] = 0;
        activation_in[1] = 0;
        activation_in[2] = 0;
        activation_in[3] = 0;

        weight_values[0] = 8'd10;
        weight_values[1] = 8'd20;
        weight_values[2] = 8'd30;
        weight_values[3] = 8'd40;

        // TODO: Reset
        for (cycle = 0; cycle < 2; cycle++) begin //hold reset for 2 cycles
            #1 clk = ~clk;
        end

        rst = 0;

        // TODO: Load weights (4 cycles)
        load_weight = 1;

        
        for (cycle = 0; cycle < 4; cycle++) begin
            weight_in[0] = weight_values[cycle];
            weight_in[1] = weight_values[cycle];
            weight_in[2] = weight_values[cycle];
            weight_in[3] = weight_values[cycle];
            #1 clk = ~clk;
        end

        // TODO: Stream activations and compute
        load_weight = 0;

        for (cycle = 0; cycle < 20; cycle++) begin
            activation_in[0] = 8'd5;
            activation_in[1] = 8'd5;
            activation_in[2] = 8'd5;
            activation_in[3] = 8'd5;
            #1 clk = ~clk;
        end

        activation_in[0] = 8'd0;
        activation_in[1] = 8'd0;
        activation_in[2] = 8'd0;
        activation_in[3] = 8'd0;

        activation_in[0] = 8'd0;
        activation_in[1] = 8'd0;
        activation_in[2] = 8'd0;
        activation_in[3] = 8'd0;

        #10;
        // TODO: Print results
        $display("\n=== Results ===");
        $display("PE[0][0]: %d (expected: 50)", partial_sum_out[0][0]);
        $display("PE[0][1]: %d (expected: 100)", partial_sum_out[0][1]);
        $display("PE[0][2]: %d (expected: 150)", partial_sum_out[0][2]);
        $display("PE[0][3]: %d (expected: 200)", partial_sum_out[0][3]);

        $display("\n=== Checking intermediate signals ===");
        $display("All row 0 PE outputs:");
        for (cycle = 0; cycle < 4; cycle++) begin
            $display("  [0][%d]: %d", cycle, partial_sum_out[0][cycle]);
        end

        $finish;
    end

endmodule
