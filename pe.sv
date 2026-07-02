module pe (
    input  logic        clk,
    input  logic        rst,
    input  logic        load_weight,
    input  logic        flush_accum,
    input  logic [7:0]  weight_down,
    input  logic [7:0]  activation_in,
    input  logic [31:0] partial_sum_in,

    output logic [7:0]  weight_down_out,
    output logic [7:0]  activation_out,
    output logic [31:0] partial_sum_out
);

    logic [7:0]  stored_weight;
    logic [15:0] mult_stage1;

    always @(posedge clk) begin
        if (rst) begin
            stored_weight   <= 8'd0;
            mult_stage1     <= 16'd0;
            partial_sum_out <= 32'd0;
            activation_out  <= 8'd0;
        end
        else begin
            weight_down_out <= weight_down;
            activation_out  <= activation_in;

            if (load_weight) begin
                stored_weight <= weight_down;
            end
            else begin
                mult_stage1 <= stored_weight * activation_in;

                if (flush_accum)
                    partial_sum_out <= 32'd0;
                else
                    partial_sum_out <= {16'd0, mult_stage1} + partial_sum_in;
            end
        end
    end

endmodule
