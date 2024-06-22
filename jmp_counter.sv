module jmp_counter (
    input logic clk, 
    input logic resetN, 
    output logic [3:0] count 
    );


	localparam jmp_from = 6; // <------ assign here the right value 
	localparam jmp_to = 9;   // <------ assign here the right value 

    always_ff @( posedge clk or negedge resetN )
    begin
        if (!resetN) begin
            count <= 0;
        end
        else begin
            case (count)
                jmp_from: count <= jmp_to;
                4'b1111: count <= 4'b0000;
                default: count = count + 1;
            endcase
        end
	end
endmodule