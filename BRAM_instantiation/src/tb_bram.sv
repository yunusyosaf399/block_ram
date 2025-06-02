`timescale 1ns / 1ps

module tb_bram;

    // Parameters
    localparam DATA_WIDTH = 32;
    localparam ADDR_WIDTH = 10;

    // Signals
    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    // Instantiate BRAM
    bram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $display("Starting BRAM Test");
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;

        // Wait for global reset
        #10;

        // Write data to a few addresses
        @(posedge clk);
        we = 1; addr = 10'd3; din = 32'hAABBCCDD;
        @(posedge clk);
        we = 1; addr = 10'd4; din = 32'h11223344;
        @(posedge clk);
        we = 1; addr = 10'd5; din = 32'hDEADBEEF;
        @(posedge clk);
        we = 0; // Stop writing

        // Read data from the same addresses
        @(posedge clk); addr = 10'd3;
        @(posedge clk); $display("Read from addr 3: %h", dout);
        @(posedge clk); addr = 10'd4;
        @(posedge clk); $display("Read from addr 4: %h", dout);
        @(posedge clk); addr = 10'd5;
        @(posedge clk); $display("Read from addr 5: %h", dout);

        #10;
        $display("BRAM Test Completed");
        $finish;
    end

endmodule
