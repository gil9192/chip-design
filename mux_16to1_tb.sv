`timescale 1ps/1ps

module mux_16to1_tb;
    reg [15:0] t_datain;
	reg [3:0] t_select;
    reg [15:0] i;
    reg [15:0] j;
	wire t_outd;
    
    mux_16to1 dut1 (.datain(t_datain), .select(t_select), .outd(t_outd));

    initial begin
        t_datain = 1;
    end

    initial begin
        #0
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                #10 t_select = j;
            end
            #10 t_datain = t_datain << 1; 
        end
        $stop;
    end
endmodule