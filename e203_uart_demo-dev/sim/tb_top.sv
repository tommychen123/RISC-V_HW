
`timescale 1ns/10ps
`define USING_IVERILOG


int clk_period = 1e9/2.7e7;
int clk_half_period = clk_period/2;


module tb_top();

  reg  clk;
  reg  lfextclk;
  reg  rst_n;

  wire hfclk = clk;

`ifdef USING_IVERILOG
  initial begin
    $dumpfile("waveout.vcd");
    $dumpvars(0, tb_top);
  end
 `endif

`ifdef USING_VCS
  initial begin
    $fsdbDumpfile("test.fsdb");
    $fsdbDumpvars;
  end
`endif

  initial begin
    #10ms;
    $finish;
  end


  initial begin

    clk   <=0;
    lfextclk   <=0;
    rst_n <=0;
    #120      rst_n <=1;
  end


  always
  begin 
     #clk_half_period clk <= ~clk;
  end

  always
  begin 
     #33 lfextclk <= ~lfextclk;
  end

    e203_soc_demo uut (
        .clk_in              (clk),  

        .tck                 (), 
        .tms                 (), 
        .tdi                 (), 
        .tdo                 (),  

        .gpio_in             (),
        .gpio_out            (),
        .qspi_in             (),
        .qspi_out            (),      
        .qspi_sck            (),  
        .qspi_cs             (),   

        .erstn               (rst_n), 

        .dbgmode0_n          (1'b1), 
        .dbgmode1_n          (1'b1),
        .dbgmode3_n          (1'b1),
  
        .bootrom_n           (1'b0), 
  
        .aon_pmu_dwakeup_n   (), 
        .aon_pmu_padrst      (),    
        .aon_pmu_vddpaden    () 
    );

endmodule
