module test_counter;
  reg clk;
  wire [7:0] count;
  reg [7:0] count_compare;
  reg [7:0] data_in;
  reg enable;
  reg load;
  reg rst_n; 
  
  reg dut_error_num;

  event rst_en;
  event rst_done;
  event terminate_sim;

  counter dut (count, data_in, clk, rst_n, load, enable);

  initial begin : INITIALIZE_VALUES
    load = 0; 
    rst_n = 1; 
    enable = 0;
    data_in = 0;
    dut_error_num = 0;
  end

  initial begin : CLK_GENERATOR
      clk = 0;
      #10 forever #10 clk = !clk;
  end

  initial begin : RESET_CASE
    forever begin
      @(rst_en);
      $display("RESET triggered");
      @(negedge clk);
        rst_n = 0;
      @(negedge clk)
        rst_n = 1;
        -> rst_done;
    end
  end

  initial @(terminate_sim) begin : TERMINATE_SIMULATION
    $display("#############################");
    $display("Terminating simulation");
      if (dut_error_num) begin
        $display("Simulation Result: Failed");
      end
      else begin
        $display("Simulation Result: Passed");
      end
      $display("Mismatches: %d", dut_error_num);
      $display("#############################");
    #20 $finish;
  end

  initial	begin : TEST_CASE
    #10 -> rst_en; //Assert reset
    @(rst_done);
    #20 data_in = 8'hDE;
    #20;
    fork // All repeat statments will happen in parallel.
      repeat (10) begin
        @(negedge clk);
        load = $random;
      end
      repeat (10) begin
        @(negedge clk);
        load = $random;
      end
      repeat (10) begin
        @(negedge clk);
        data_in = $random;
      end
    join
    #20 -> terminate_sim;
  end

  always @(posedge clk or negedge rst_n) begin : REFERENCE_MODEL
    if (!rst_n)
        count_compare = 8'h00;
    else if (load)
        count_compare <= data_in;
    else if (enable)
        count_compare <= count + 8'h01;
  end

  always @(posedge clk) begin : CHECKER
    if (count != count_compare)  begin
      $display("DUT error at: %d:", $time);
      $display("Expected %d, Got %d", count_compare, count);
      dut_error_num = dut_error_num + 1;
    end
  end
endmodule
