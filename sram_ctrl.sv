module sram_ctrl (
    input logic clk,
    input logic rst,
    input logic rd_en,
    input logic wr_en,
    input logic [3:0] wr_addr,
    input logic [7:0] wr_data [0:3],
    output logic [7:0] data_out [0:3]
);

logic [3:0] counter;
logic [7:0] mem [0:15][0:3];


always@(posedge clk) begin
    if (rst == 1) begin
        counter <= 0;
        data_out[0] <= 8'd0;
        data_out[1] <= 8'd0;
        data_out[2] <= 8'd0;
        data_out[3] <= 8'd0;
    end
    else begin
        if (wr_en) begin
            mem[wr_addr][0] = wr_data[0];
        end
        if (rd_en) begin
            data_out[0] <= mem[counter][0];
            data_out[1] <= mem[counter][1];
            data_out[2] <= mem[counter][2];
            data_out[3] <= mem[counter][3];
            counter <= counter + 1;
        end
    end
end

endmodule
