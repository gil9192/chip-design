module adder (
    output reg [4:0] Sum,
    input [3:0] A,
    input [3:0] B,
    input enable,
    input clk,
    input rst);

    always @(rst) begin
        Sum <= 0;
    end

    always @(posedge clk) begin
        if ((enable) && (~rst)) begin
            Sum <= A + B;
        end 
    end
endmodule