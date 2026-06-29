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

    // Partial sum outputs to right (flowing right each row)
    output logic [31:0] partial_sum_out [0:3][0:3]
);

    // TODO: Create internal signals for weight, activation, and partial sum flow
    logic [7:0] weight_vert [0:4][0:3];
    logic [7:0] activation_horiz [0:3][0:4];
    logic [31:0] partial_horiz [0:3][0:4];

    //start the inputs
    assign weight_vert[0] = weight_in;
    assign activation_horiz[0] = activation_in;
    assign partial_horiz[0] = '{default: 32'd0};

    // TODO: Instantiate 4x4 grid of PEs using generate blocks
    genvar i, j;

    generate
        for (i = 0; i < 4; i++) begin : row
            for (j = 0; j < 4; j++) begin : column
                pe pe_instance (
                    .clk(clk),
                    .rst(rst),
                    .weight_down(weight_vert[i][j]), //weight flowing down
                    .weight_down_out(weight_vert[i+1][j]), //weight flowing down
                    .activation_in(activation_horiz[i][j]),
                    .partial_sum_in(partial_horiz[i][j]),
                    .partial_sum_out(partial_horiz[i][j+1]), //flows across columns
                    .load_weight(load_weight),
                    .flush_accum(flush_accum)
                );
            end
        end
    endgenerate


endmodule
