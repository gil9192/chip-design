module memory (
    input clk,
    input rst,
    input enable,
    input rd_wr,
    input [2:0]addr,
    input [7:0]wr_data,
    output [7:0]rd_data
);
    reg [7:0] mem [0:7];
    reg [7:0] tmp;
    integer addr_ptr;

    assign rd_data = tmp;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            for (addr_ptr = 0; addr_ptr < 8; addr_ptr = addr_ptr + 1) begin
                mem[addr_ptr] <= 'hFF;
            end
        end
        else begin
            case (rd_wr)
                0: begin // Write operation.
                    if (enable) begin
                        mem[addr] <= wr_data;
                    end
                end
                1: begin // Read operation.
                    if (enable) begin
                        tmp <= mem[addr];
                    end
                end
            endcase
        end
    end
endmodule