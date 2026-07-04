module systolic_top (
    input logic clk,
    input logic rst,
    input logic start,
    input logic [7:0] weight_in [0:3],
    input logic [7:0] activation_in [0:3],
    output wire [31:0] partial_sum_out [0:3][0:3],
    output logic done
);

    logic load_weight;
    logic flush_accum;

    controller ctrl_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .load_weight(load_weight),
        .flush_accum(flush_accum),
        .done(done)
    );

    pe_array array_inst (
        .clk(clk),
        .rst(rst),
        .load_weight(load_weight),
        .flush_accum(flush_accum),
        .weight_in(weight_in),
        .activation_in(activation_in),
        .partial_sum_out(partial_sum_out)
    );

endmodule
