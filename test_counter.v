///////////////////////////////////////////////////////////////////////////
// MODULE               : counter_tb                                     //
//                                                                       // 
// PURPOSE              : 8-bit up counter test bench                    //
//                                                                       //
// DESIGNER             : Dorit Medina                                   //
//                                                                       //
///////////////////////////////////////////////////////////////////////////

module test_counter;

reg clk, rst_n, load, enable;
reg [7:0] data_in;
wire [7:0] count;

counter dut (count, data_in, clk, rst_n, load, enable);

initial                 // Clock generator
  begin
    clk = 0;
    #10 forever #10 clk = !clk;
end
  
initial	// Test stimulus
  begin
    rst_n = 1;
    #20 rst_n = 0;
    #40 rst_n = 1;
    #100 data_in = 8'hDE;
    #50 load = 1;
    #40 load = 0;
    #50 enable = 1;
    #4000 enable = 0;
    #100 $stop;
end
  
initial
    $monitor($stime, rst_n, clk, load, data_in, enable, count); 
    
endmodule
