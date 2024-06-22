module mux_4to1_case ( 
	input logic [3:0] datain,
	input logic [1:0] select,
	output logic outd
	);

	always_comb
	begin
		case (select)
			2'b00: outd = datain[0];
			2'b01: outd = datain[1];
			2'b10: outd = datain[2];
			2'b11: outd = datain[3];
			default: outd = 1'bx;
		endcase
	end
endmodule


