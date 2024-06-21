`timescale 1ps/1ps

module adder_tb;
    wire [4:0] t_Sum;
    reg [3:0] t_A;
    reg [3:0] t_B;
    reg t_enable;
    reg t_clk;
    reg t_rst;

    adder dut1 (.Sum(t_Sum), .A(t_A), .B(t_B), .enable(t_enable), .clk(t_clk), .rst(t_rst));

    initial begin
        t_A = 0;
        t_B = 0;
        t_clk = 0;
        t_rst = 0;
        t_enable = 0;
        #10 forever #10 t_clk = !t_clk;
    end

    initial	// Test stimulus
    begin
        #0
        #20 t_rst = 1;
        #20 t_rst = 0;
        #20 t_A = 1;
        #20 t_B = 2;
        #20 t_enable = 1;
        #20 t_enable = 0;
        #20 t_A = 2;
        #20 t_B = 2;
        #20 t_enable = 1;
        #20 t_enable = 0;
        #20 t_rst = 1;
        #20 t_rst = 0;
        #20 t_A = 2;
        #20 t_B = 1;
        #20 t_enable = 1;
        #20 t_rst = 1;
        #20 t_rst = 0;
        #100 $stop;
    end
endmodule