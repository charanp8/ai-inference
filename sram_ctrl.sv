module sram_ctrl (
    input logic clk,
    input logic rst,
    input logic rd_en,
    input logic wr_en,
    input logic [3:0] wr_addr,
    input logic [7:0] wr_data [0:7],
    output logic [7:0] data_out [0:7]
);

logic [3:0] counter;
logic [7:0] mem [0:15][0:7];

always@(posedge clk) begin
    if (rst == 1) begin
        counter <= 0;
        data_out[0] <= 8'd0; data_out[1] <= 8'd0;
        data_out[2] <= 8'd0; data_out[3] <= 8'd0;
        data_out[4] <= 8'd0; data_out[5] <= 8'd0;
        data_out[6] <= 8'd0; data_out[7] <= 8'd0;
    end
    else begin
        if (wr_en) begin
            mem[wr_addr][0] = wr_data[0];
            mem[wr_addr][1] = wr_data[1];
            mem[wr_addr][2] = wr_data[2];
            mem[wr_addr][3] = wr_data[3];
            mem[wr_addr][4] = wr_data[4];
            mem[wr_addr][5] = wr_data[5];
            mem[wr_addr][6] = wr_data[6];
            mem[wr_addr][7] = wr_data[7];
        end
        if (rd_en) begin
            data_out[0] <= mem[counter][0];
            data_out[1] <= mem[counter][1];
            data_out[2] <= mem[counter][2];
            data_out[3] <= mem[counter][3];
            data_out[4] <= mem[counter][4];
            data_out[5] <= mem[counter][5];
            data_out[6] <= mem[counter][6];
            data_out[7] <= mem[counter][7];
            counter <= counter + 1;
        end
    end
end

endmodule
