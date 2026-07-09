module controller (
    input  logic clk,
    input  logic rst,
    input  logic start,
    output logic rd_en,
    output logic load_weight,
    output logic flush_accum,
    output logic done
);

parameter IDLE = 2'd0;
parameter LOAD_WEIGHT = 2'd1;
parameter COMPUTE = 2'd2;
parameter DONE = 2'd3;

logic [1:0] state;
logic [4:0] counter;

always@(posedge clk) begin

    if (rst == 1) begin
        state <= IDLE;
        rd_en <= 0;
        counter <= 0;
        done <= 0;
        load_weight <= 0;
        flush_accum <= 0;
    end

    else begin

        case(state)

            IDLE: begin
                rd_en <= 0;
                done <= 0;
                load_weight <= 0;
                flush_accum <= 0;
                if (start == 1) begin
                    state <= LOAD_WEIGHT;
                    counter <= 0;
                end
            end
            LOAD_WEIGHT: begin
                rd_en <= 0;
                load_weight <= 1;
                counter <= counter + 1;
                if (counter == 5'd8) begin
                    state <= COMPUTE;
                    counter <= 0;
                    load_weight <= 0;
                end
            end
            COMPUTE: begin
                rd_en <= 1;
                load_weight <= 0;
                counter <= counter + 1;
                if (counter == 5'd0)
                    flush_accum <= 1;
                else
                    flush_accum <= 0;
                if (counter == 5'd10) begin
                    state <= DONE;
                    counter <= 0;
                end
            end
            DONE: begin
                rd_en <= 0;
                done <= 1;
                state <= IDLE;
            end

        endcase
    end
end

endmodule
