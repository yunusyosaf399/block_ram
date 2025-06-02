module bram #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10  // 2^10 = 1024 locations
)(
    input wire clk,
    input wire we,                      // Write enable
    input wire [ADDR_WIDTH-1:0] addr,   // Address
    input wire [DATA_WIDTH-1:0] din,    // Data input
    output reg [DATA_WIDTH-1:0] dout    // Data output
);

    // Declare memory
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;  // Write operation
        dout <= mem[addr];     // Read operation
    end

endmodule
