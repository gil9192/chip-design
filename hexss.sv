module hexss 
	(
	input logic [3:0] hexin, // Data input: hex numbers 0 to f
	input logic darkN, 
	input logic LampTest, 	// Aditional inputs
	output logic [6:0] ss 	// Output for 7Seg display
	);

	reg [6:0] lut [0:15];
	initial begin
		lut[1'h0] = 7'b0111111; // 0
		lut[1'h1] = 7'b0000110; // 1
		lut[1'h2] = 7'b1011011; // 2
		lut[1'h3] = 7'b1001111; // 3
		lut[1'h4] = 7'b1100110; // 4
		lut[1'h5] = 7'b1101101; // 5
		lut[1'h6] = 7'b1111101; // 6
		lut[1'h7] = 7'b0000111; // 7
		lut[1'h8] = 7'b1111111; // 8
		lut[1'h9] = 7'b1100111; // 9
		lut[1'ha] = 7'b1110111; // a
		lut[1'hb] = 7'b1111100; // b
		lut[1'hc] = 7'b0111001; // c
		lut[1'hd] = 7'b1011110; // d
		lut[1'he] = 7'b1111001; // e
		lut[1'hf] = 7'b1110001; // f
	end


	always_comb
	begin
		if(darkN && !LampTest) begin
			ss = lut[hexin];
		end
		else if(darkN && LampTest) begin
			ss = 7'b1111111;
		end
		else begin
			ss = 7'b0000000;
		end
	end
endmodule