module systolic_top_tb;

    logic clk;
    logic rst;
    logic start;
    logic [7:0] weight_in [0:3];
    wire [31:0] partial_sum_out [0:3][0:3];
    logic done;

    systolic_top dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .weight_in(weight_in),
        .partial_sum_out(partial_sum_out),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        start = 0;
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;

        dut.sram_inst.mem[0][0] = 8'd5; dut.sram_inst.mem[0][1] = 8'd5; dut.sram_inst.mem[0][2] = 8'd5; dut.sram_inst.mem[0][3] = 8'd5;
        dut.sram_inst.mem[1][0] = 8'd5; dut.sram_inst.mem[1][1] = 8'd5; dut.sram_inst.mem[1][2] = 8'd5; dut.sram_inst.mem[1][3] = 8'd5;
        dut.sram_inst.mem[2][0] = 8'd5; dut.sram_inst.mem[2][1] = 8'd5; dut.sram_inst.mem[2][2] = 8'd5; dut.sram_inst.mem[2][3] = 8'd5;
        dut.sram_inst.mem[3][0] = 8'd5; dut.sram_inst.mem[3][1] = 8'd5; dut.sram_inst.mem[3][2] = 8'd5; dut.sram_inst.mem[3][3] = 8'd5;
        dut.sram_inst.mem[4][0] = 8'd5; dut.sram_inst.mem[4][1] = 8'd5; dut.sram_inst.mem[4][2] = 8'd5; dut.sram_inst.mem[4][3] = 8'd5;
        dut.sram_inst.mem[5][0] = 8'd5; dut.sram_inst.mem[5][1] = 8'd5; dut.sram_inst.mem[5][2] = 8'd5; dut.sram_inst.mem[5][3] = 8'd5;

        weight_in[0] = 8'd10; weight_in[1] = 8'd10;
        weight_in[2] = 8'd10; weight_in[3] = 8'd10;
        @(posedge clk);

        weight_in[0] = 8'd20; weight_in[1] = 8'd20;
        weight_in[2] = 8'd20; weight_in[3] = 8'd20;
        @(posedge clk);

        weight_in[0] = 8'd30; weight_in[1] = 8'd30;
        weight_in[2] = 8'd30; weight_in[3] = 8'd30;
        @(posedge clk);

        weight_in[0] = 8'd40; weight_in[1] = 8'd40;
        weight_in[2] = 8'd40; weight_in[3] = 8'd40;
        @(posedge clk);

        start = 1;
        repeat(20) @(posedge clk);

        #1;
        $display("=== Row 0 results ===");
        $display("PE[0][0]: %d", partial_sum_out[0][0]);
        $display("PE[0][1]: %d", partial_sum_out[0][1]);
        $display("PE[0][2]: %d", partial_sum_out[0][2]);
        $display("PE[0][3]: %d", partial_sum_out[0][3]);

        $finish;
    end

endmodule
