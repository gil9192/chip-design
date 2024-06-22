module mux_4to1_if ( 
    input logic [3:0] datain,
	input logic [1:0] select,
	output logic outd
	);
    
	always_comb 
	begin
		if (select == 2'b00) begin
			outd = datain[0];
		end
		else if (select == 2'b01) begin
			outd = datain[1];
		end
		else if (select == 2'b10) begin
			outd = datain[2];
		end
		else if (select == 2'b11) begin
			outd = datain[3];
		end
		else begin
			outd = 1'bx;
		end
	end
endmodule
