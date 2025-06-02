`timescale 1ns / 1ps

module tb_dual_port_ram;

    // Parameters
    localparam DATA_WIDTH = 32;
    localparam ADDR_WIDTH = 10;

    // Signals
    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] wr_addr;
    reg [DATA_WIDTH-1:0] wr_data;
    reg [ADDR_WIDTH-1:0] rd_addr;
    wire [DATA_WIDTH-1:0] rd_data;

    // Instantiate DUT
    block_ram_dual_port #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .we(we),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    // Clock generation
    always #5 clk = ~clk;

        integer i;

    initial begin
        $display("Starting full dual-port RAM test");
        clk = 0;
        we = 0;
        wr_addr = 0;
        wr_data = 0;
        rd_addr = 0;

        // Wait for reset
        #10;

        // -------- WRITE PHASE --------
        for (i = 0; i < (1 << ADDR_WIDTH); i = i + 1) begin
            @(posedge clk);
            we = 1;
            wr_addr = i;
            wr_data = i;  // write value = address
        end

        // Disable write
        @(posedge clk);
        we = 0;

        // -------- READ PHASE --------
        for (i = 0; i < (1 << ADDR_WIDTH); i = i + 1) begin
            @(posedge clk);
            rd_addr = i;

            @(posedge clk);  // wait for read data to update
            $display("Read from addr %0d: %h", i, rd_data);
            if (rd_data !== i)
                $display("ERROR: Expected %0h at addr %0d, got %0h", i, i, rd_data);
        end

        #10;
        $display("Dual-port RAM test completed");
        $finish;
    end


endmodule
s