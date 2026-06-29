// Processing Element (PE) for 8-bit Systolic Array
// Atomic Semi 100nm process
// TODO: Fill in ports and logic

module pe (
    input logic clk,
    input logic rst,
    input logic load_weight,
    input logic [7:0] weight_in,
    input logic [7:0] weight_down,
    input logic [7:0] activation_in,
    input logic [31:0] partial_sum_in,
    input logic flush_accum,

    output logic [7:0] weight_down_out,
    output logic [31:0] partial_sum_out
);

    logic [7:0] stored_weight;
    logic [15:0] mult_stage1;

    always @(posedge clk) begin

        if (rst == 1'b1) begin
            stored_weight <= 8'd0;
            mult_stage1 <= 16'd0;
            partial_sum_out <= 32'd0;
        end
        else begin
            // Pass weight down to next PE
            weight_down_out <= weight_down;

            if (load_weight == 1'b1) begin
                // Weight loading phase: capture weight from above
                stored_weight <= weight_down;
            end
            else begin
                // Compute phase: multiply and accumulate
                // Stage 1: Multiply stored weight by incoming activation
                mult_stage1 <= stored_weight * activation_in;

                // Stage 2: Accumulate using previous cycle's multiply result
                if (flush_accum == 1'b1) begin
                    partial_sum_out <= 32'd0;
                end
                else begin
                    partial_sum_out <= {16'd0, mult_stage1} + partial_sum_in;
                end
            end
        end
    end

endmodule
