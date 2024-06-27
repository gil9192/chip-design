module hexss_tb;
	logic [3:0] t_hexin; // Data input: hex numbers 0 to f
	logic t_darkN; 
	logic t_LampTest; 	// Additional inputs
	logic [6:0] t_ss; 	// Output for 7Seg display
	
	hexss dut(
		.hexin(t_hexin), 
		.darkN(t_darkN), 
		.LampTest(t_LampTest), 
		.ss(t_ss)
	);

	initial begin
		// Initialize control signals
		t_darkN = 1;
		t_LampTest = 0;
		
		// Test all hex values
		for (int i = 0; i < 16; i = i + 1) begin
			t_hexin = i;
			#10; // Wait for 10 time units
		end

		// Test with LampTest
		t_LampTest = 1;
		for (int i = 0; i < 16; i = i + 1) begin
			t_hexin = i;
			#10; // Wait for 10 time units
		end
		
		// Test with darkN disabled
		t_darkN = 0;
		t_LampTest = 0;
		t_hexin = 4'h0;
		#10;
		
		$stop;
	end
endmodule