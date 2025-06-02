module block_ram_dual_port #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10
)(
    input wire clk,

    // Write port
    input wire we,
    input wire [ADDR_WIDTH-1:0] wr_addr,
    input wire [DATA_WIDTH-1:0] wr_data,

    // Read port
    input wire [ADDR_WIDTH-1:0] rd_addr,
    output reg [DATA_WIDTH-1:0] rd_data
);

    // Declare memory
    reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH) - 1];

    always @(posedge clk) begin
        // Write operation
        if (we)
            mem[wr_addr] <= wr_data;

        // Read operation
        rd_data <= mem[rd_addr];
    end

endmodule
