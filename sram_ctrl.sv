module sram_ctrl (

    input logic clk,
    input logic rst,
    input logic rd_en,
    output logic [7:0] data_out [0:3]

);

logic [3:0] counter;
logic [7:0] mem [0:15][0:3];

always@(posedge clk) begin

    if (rst == 1) begin
        counter <= 0;
    end
    else if (rd_en == 1) begin
        data_out[0] <= mem[counter][0];
        data_out[1] <= mem[counter][1];
        data_out[2] <= mem[counter][2];
        data_out[3] <= mem[counter][3];
        counter <= counter + 1;
    end
    

end

endmodule
