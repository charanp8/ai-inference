module systolic_top (
    input logic clk,
    input logic rst,
    input logic start,
    input logic [7:0] weight_in [0:7],
    input logic wr_en,
    input logic [3:0] wr_addr,
    input logic [7:0] wr_data [0:7],
    output wire [31:0] partial_sum_out [0:7][0:7],
    output logic done
);

    logic load_weight;
    logic flush_accum;
    logic rd_en;
    wire [7:0] activation_in [0:7];

    controller ctrl_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .rd_en(rd_en),
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

    sram_ctrl sram_inst (
        .clk(clk),
        .rst(rst),
        .rd_en(rd_en),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .data_out(activation_in)
    );

endmodule
