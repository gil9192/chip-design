module adder (
    output reg [4:0] Sum,
    input [3:0] A,
    input [3:0] B,
    input enable,
    input clk,
    input rst);

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            Sum <= 0;
        end 
        else if(enable) begin
            Sum <= A + B;
        end
    end
endmodule