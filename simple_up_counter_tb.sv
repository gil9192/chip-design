`timescale 1ps/1ps

module simple_up_counter_tb;
    reg t_clk;
    reg t_resetN;
    wire [3:0] t_count;

    simple_up_counter dut1 (.clk(t_clk), .resetN(t_resetN), .count(t_count));

    initial begin
        t_clk = 0;
        forever begin
            #10 t_clk = !t_clk;
        end
    end

    initial begin
        #0 t_resetN = 0;
        #40 t_resetN = 1;
        #360
        #10 t_resetN = 0;
        #10 t_resetN = 1;
        #120
        #10 t_resetN = 0;
        $stop;
    end
endmodule

