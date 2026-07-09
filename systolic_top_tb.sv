module systolic_top_tb;

    logic clk;
    logic rst;
    logic start;
    logic [7:0] weight_in [0:7];
    logic wr_en;
    logic [3:0] wr_addr;
    logic [7:0] wr_data [0:7];
    wire [31:0] partial_sum_out [0:7][0:7];
    logic done;
    integer row;

    systolic_top dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .weight_in(weight_in),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .partial_sum_out(partial_sum_out),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        start = 0;
        wr_en = 0;
        wr_addr = 0;
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;

        // load activations into SRAM (all rows = 5)
        @(negedge clk); wr_en=1; wr_addr=0; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=1; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=2; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=3; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=4; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=5; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=6; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=7; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=8; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=9; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=1; wr_addr=10; wr_data[0]=8'd5; wr_data[1]=8'd5; wr_data[2]=8'd5; wr_data[3]=8'd5; wr_data[4]=8'd5; wr_data[5]=8'd5; wr_data[6]=8'd5; wr_data[7]=8'd5;
        @(posedge clk);
        @(negedge clk); wr_en=0;

        start = 1;
        @(posedge clk);
        #1 start = 0;

        // load weights (shift 10->20->...->80 down 8 rows).
        // load_weight is 0 during the counter==0 cycle (first cycle of LOAD_WEIGHT), so that
        // slot's value is never captured; it only latches into rows on counter==1..8. Feeding
        // 10,20,...,80 on those 8 negedges makes row0 end up with 80 (latched last) down to
        // row7 with 10 (latched first, then shifted down through the remaining rows).
        @(negedge clk); weight_in[0]=8'd0;  weight_in[1]=8'd0;  weight_in[2]=8'd0;  weight_in[3]=8'd0;
        weight_in[4]=8'd0;  weight_in[5]=8'd0;  weight_in[6]=8'd0;  weight_in[7]=8'd0;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd10; weight_in[1]=8'd10; weight_in[2]=8'd10; weight_in[3]=8'd10;
        weight_in[4]=8'd10; weight_in[5]=8'd10; weight_in[6]=8'd10; weight_in[7]=8'd10;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd20; weight_in[1]=8'd20; weight_in[2]=8'd20; weight_in[3]=8'd20;
        weight_in[4]=8'd20; weight_in[5]=8'd20; weight_in[6]=8'd20; weight_in[7]=8'd20;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd30; weight_in[1]=8'd30; weight_in[2]=8'd30; weight_in[3]=8'd30;
        weight_in[4]=8'd30; weight_in[5]=8'd30; weight_in[6]=8'd30; weight_in[7]=8'd30;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd40; weight_in[1]=8'd40; weight_in[2]=8'd40; weight_in[3]=8'd40;
        weight_in[4]=8'd40; weight_in[5]=8'd40; weight_in[6]=8'd40; weight_in[7]=8'd40;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd50; weight_in[1]=8'd50; weight_in[2]=8'd50; weight_in[3]=8'd50;
        weight_in[4]=8'd50; weight_in[5]=8'd50; weight_in[6]=8'd50; weight_in[7]=8'd50;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd60; weight_in[1]=8'd60; weight_in[2]=8'd60; weight_in[3]=8'd60;
        weight_in[4]=8'd60; weight_in[5]=8'd60; weight_in[6]=8'd60; weight_in[7]=8'd60;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd70; weight_in[1]=8'd70; weight_in[2]=8'd70; weight_in[3]=8'd70;
        weight_in[4]=8'd70; weight_in[5]=8'd70; weight_in[6]=8'd70; weight_in[7]=8'd70;
        @(posedge clk);
        @(negedge clk); weight_in[0]=8'd80; weight_in[1]=8'd80; weight_in[2]=8'd80; weight_in[3]=8'd80;
        weight_in[4]=8'd80; weight_in[5]=8'd80; weight_in[6]=8'd80; weight_in[7]=8'd80;
        @(posedge clk);

        repeat(30) @(posedge clk);

        #1;
        $display("=== Full 8x8 partial_sum_out grid (act=5 everywhere, weight per row = 80,70,...,10) ===");
        for (row = 0; row < 8; row = row + 1) begin
            $display("row %0d: %0d %0d %0d %0d %0d %0d %0d %0d", row,
                partial_sum_out[row][0], partial_sum_out[row][1],
                partial_sum_out[row][2], partial_sum_out[row][3],
                partial_sum_out[row][4], partial_sum_out[row][5],
                partial_sum_out[row][6], partial_sum_out[row][7]);
        end

        $finish;
    end

endmodule
