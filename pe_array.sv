module pe_array (
    input logic clk,
    input logic rst,
    input logic load_weight,
    input logic flush_accum,
    input logic [7:0] weight_in [0:7],
    input logic [7:0] activation_in [0:7],
    output wire [31:0] partial_sum_out [0:7][0:7]
);

    wire [7:0] weight_vert [0:8][0:7];
    wire [7:0] activation_horiz [0:7][0:8];
    wire [31:0] partial_horiz [0:7][0:8];

    genvar i, j;

    generate
        for (i = 0; i < 8; i++) begin : gen_edge
            assign weight_vert[0][i] = weight_in[i];
            assign activation_horiz[i][0] = activation_in[i];
            assign partial_horiz[i][0] = 32'd0;
        end

        for (i = 0; i < 8; i++) begin : gen_row
            for (j = 0; j < 8; j++) begin : gen_col
                pe pe_inst (
                    .clk(clk),
                    .rst(rst),
                    .load_weight(load_weight),
                    .flush_accum(flush_accum),
                    .weight_down(weight_vert[i][j]),
                    .weight_down_out(weight_vert[i+1][j]),
                    .activation_in(activation_horiz[i][j]),
                    .activation_out(activation_horiz[i][j+1]),
                    .partial_sum_in(partial_horiz[i][j]),
                    .partial_sum_out(partial_horiz[i][j+1])
                );
                assign partial_sum_out[i][j] = partial_horiz[i][j+1];
            end
        end
    endgenerate

endmodule
