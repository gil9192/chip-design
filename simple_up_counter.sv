module simple_up_counter (
    input logic clk, 
    input logic resetN,
    output logic [3:0] count 
    );

    always_ff @( posedge clk or negedge resetN )
    begin
        if (!resetN) begin 
            count <= 0;
        end
        else if (count == 15) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
	end
endmodule