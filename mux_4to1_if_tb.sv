`timescale 1ps/1ps

module mux_4to1_if_tb;
    reg [3:0] t_datain;
	reg [1:0] t_select;
	wire t_outd;
    
    mux_4to1_if dut1 (.datain(t_datain), .select(t_select), .outd(t_outd));

    initial begin
        #0 
        t_datain = 0; 
        t_select = 0;
    end

    initial begin
        #10 t_datain = 1;
        #10 t_select = 0;
        #10 t_select = 1;
        #10 t_select = 2;
        #10 t_select = 3;
        #10 t_select = 0;
        t_datain = t_datain << 1;
        #10 t_select = 1;
        #10 t_select = 2;
        #10 t_select = 3;
        #10 t_select = 0;
        t_datain = t_datain << 1;
        #10 t_select = 1;
        #10 t_select = 2;
        #10 t_select = 3;
        #10 t_select = 0;
        t_datain = t_datain << 1;
        #10 t_select = 1;
        #10 t_select = 2;
        #10 t_select = 3;
        #10 t_select = 0;
        t_datain = t_datain << 1;
        #10 t_select = 1;
        #10 t_select = 2;
        #10 t_select = 3;
        #10 t_select = 0;
        #10 t_select = 2'b0x;
        #10 t_select = 2'bxx;
        #10 t_select = 2'b0z;
        #10 t_select = 2'bzz;
        #10 t_select = 2'bxz;
        #10 t_select = 2'bzx;
        $stop;
    end
endmodule