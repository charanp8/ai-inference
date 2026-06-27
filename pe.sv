// Processing Element (PE) for 8-bit Systolic Array
// Atomic Semi 100nm process
// TODO: Fill in ports and logic

module pe (
    // TODO: add your ports here
    input logic clk,
    input logic rst,
    input logic [7:0] weight_in,
    input logic [7:0] activation_in,
    input logic [31:0] partial_sum_in,
    input logic flush_accum,

    output logic [7:0] weight_out,
    output logic [31:0] partial_sum_out
);

    // TODO: Stage 1 - Multiply
    

    // TODO: Stage 2 - Accumulate

endmodule
