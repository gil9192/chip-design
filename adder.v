module adder #(
    parameter INPUT_WIDTH = 4
)
(
    output [INPUT_WIDTH:0] Sum,
    input [INPUT_WIDTH-1:0] A,
    input [INPUT_WIDTH-1:0] B,
    input enable,
    input clk,
    input rst
);
    reg [INPUT_WIDTH:0] Temp;
    reg [INPUT_WIDTH:0] Out;

    assign Sum = Temp;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            Temp <= 0;
        end
        else begin
            if (enable) begin
                Temp <= A + B;
            end
        end
    end
endmodule