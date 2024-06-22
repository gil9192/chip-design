`timescale 1ps/1ps

module priority_encoder_tb;
    reg [8:0] t_in;
    wire [2:0]  t_pos;
    priority_encoder dut1 (.in(t_in), .pos(t_pos));
    integer i;
    initial begin
        for (i=0; i < 15; i = i + 1) begin
            #10 t_in = i;
        end
    #10 $stop;
    end
endmodule