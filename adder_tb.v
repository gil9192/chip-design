`timescale 1ps/1ps

module adder_tb;
    reg tb_clk;
    wire [4:0] tb_sum;
    wire [4:0] tb_ref_sum;
    reg [3:0] tb_A;
    reg [3:0] tb_B;
    reg tb_enable;
    reg tb_rst;
    reg tb_mismatches;
    reg [4:0] tb_tmp;
    
    event rst_start;
    event rst_end;
    event end_sim;
    event terminate_sim;


    adder dut (.Sum(tb_sum), .A(tb_A), .B(tb_B), .enable(tb_enable), .clk(tb_clk), .rst(tb_rst));



    initial begin : INIT
        tb_A = 0;
        tb_B = 0;
        tb_rst = 0;
        tb_enable = 0;
        tb_mismatches = 0;
    end

    initial begin : CLOCK
        tb_clk = 0;
        forever begin
            #10 tb_clk = !tb_clk;
        end
    end

    initial begin : RESET
        forever begin
            @(rst_start);
            $display("Reset triggered at: %d", $time);
            @(negedge tb_clk);
            tb_rst = 1;
            @(negedge tb_clk);
            tb_rst = 0;
            -> rst_end;
        end
    end

    initial begin : TEST_CASE
        #10 -> rst_start;
        @(rst_end);
        #20;
        fork
            repeat (20) begin
                @(posedge tb_clk)
                tb_A = $random;
                tb_B = $random;
                $display("A: %d B: %d", tb_A, tb_B);
            end
            repeat (20) begin
                @(posedge tb_clk)
                tb_enable = $random;
            end
        join
        -> terminate_sim;
    end

    initial @(terminate_sim) begin : TERMINATION
        $display("############################");
        if (tb_mismatches) begin
            $display("Tesbench status: Failed");
        end
        else begin
            $display("Tesbench status: Passed");
        end
        $display("Number of mismatches: %d", tb_mismatches);
        $display("############################");
        $finish;
    end

    assign tb_ref_sum = tb_tmp;

    always @(posedge tb_clk, posedge tb_rst) begin
        if (tb_rst) begin
            tb_tmp <= 0;
        end
        else begin
            if (tb_enable) begin
                tb_tmp <= tb_A + tb_B;
            end
        end
    end

    initial begin : CHECKER
        if (tb_ref_sum != tb_sum) begin
            $display("Found mismatch at: %d", $time);
            $display("Expecting: %d", tb_ref_sum, "Got", tb_sum);
            tb_mismatches = tb_mismatches + 1;
        end
    end
endmodule