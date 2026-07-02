// 4x4 Systolic Array of Processing Elements
module pe_array (
    input logic clk,
    input logic rst,
    input logic load_weight,
    input logic flush_accum,

    // Weight inputs from top (flowing down each column)
    input logic [7:0] weight_in [0:3],

    // Activation inputs from left (flowing right each row)
    input logic [7:0] activation_in [0:3],

    // Partial sum outputs (one per PE, row x col)
    output wire [31:0] partial_sum_out [0:3][0:3]
);

    // Internal flow signals — all wire so module outputs can drive them cleanly
    wire [7:0]  weight_vert     [0:4][0:3];   // [level][col]  weights flowing down
    wire [7:0]  activation_horiz[0:3][0:4];   // [row][level]  activations flowing right
    wire [31:0] partial_horiz   [0:3][0:4];   // [row][level]  partial sums flowing right

    // Edge inputs: tie level-0 of each flow array to the module inputs
    assign weight_vert[0][0] = weight_in[0];
    assign weight_vert[0][1] = weight_in[1];
    assign weight_vert[0][2] = weight_in[2];
    assign weight_vert[0][3] = weight_in[3];

    assign activation_horiz[0][0] = activation_in[0];
    assign activation_horiz[1][0] = activation_in[1];
    assign activation_horiz[2][0] = activation_in[2];
    assign activation_horiz[3][0] = activation_in[3];

    assign partial_horiz[0][0] = 32'd0;
    assign partial_horiz[1][0] = 32'd0;
    assign partial_horiz[2][0] = 32'd0;
    assign partial_horiz[3][0] = 32'd0;

    // 4x4 PE grid
    genvar i, j;
    generate
        for (i = 0; i < 4; i++) begin : gen_row
            for (j = 0; j < 4; j++) begin : gen_col
                pe pe_inst (
                    .clk            (clk),
                    .rst            (rst),
                    .load_weight    (load_weight),
                    .flush_accum    (flush_accum),
                    .weight_down    (weight_vert[i][j]),
                    .weight_down_out(weight_vert[i+1][j]),
                    .activation_in  (activation_horiz[i][j]),
                    .activation_out (activation_horiz[i][j+1]),
                    .partial_sum_in (partial_horiz[i][j]),
                    .partial_sum_out(partial_horiz[i][j+1])
                );
            end
        end
    endgenerate

    // Output: last level of partial_horiz for each PE
    assign partial_sum_out[0][0] = partial_horiz[0][1];
    assign partial_sum_out[0][1] = partial_horiz[0][2];
    assign partial_sum_out[0][2] = partial_horiz[0][3];
    assign partial_sum_out[0][3] = partial_horiz[0][4];

    assign partial_sum_out[1][0] = partial_horiz[1][1];
    assign partial_sum_out[1][1] = partial_horiz[1][2];
    assign partial_sum_out[1][2] = partial_horiz[1][3];
    assign partial_sum_out[1][3] = partial_horiz[1][4];

    assign partial_sum_out[2][0] = partial_horiz[2][1];
    assign partial_sum_out[2][1] = partial_horiz[2][2];
    assign partial_sum_out[2][2] = partial_horiz[2][3];
    assign partial_sum_out[2][3] = partial_horiz[2][4];

    assign partial_sum_out[3][0] = partial_horiz[3][1];
    assign partial_sum_out[3][1] = partial_horiz[3][2];
    assign partial_sum_out[3][2] = partial_horiz[3][3];
    assign partial_sum_out[3][3] = partial_horiz[3][4];

endmodule
