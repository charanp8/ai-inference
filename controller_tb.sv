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

endmodule