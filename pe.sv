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

    logic [15:0] temp;

    always @(posedge clk) begin

        weight_out <= weight_in;

        if (flush_accum == 1'b1) begin

            partial_sum_out <= 32'd0;

        end

        else begin

            // TODO: Stage 1 - Multiply
            temp <= weight_in * activation_in;

            // TODO: Stage 2 - Accumulate
            partial_sum_out <= {16'd0, temp} + partial_sum_in;

        end

    end


endmodule
