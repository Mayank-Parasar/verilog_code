// let's quickly write a test-bench for FIFO
// here FIFO is DUT (Device Under Test).
`include "myFIFO_1.v"
module FIFO_tb(); // Note: this has no inp/op ports
  
  // write the ports you will use 
  // to connect to DUT
  // note: input of DUT can either be connected to 
  // wire or reg
  reg [3:0] data_in; 
  reg clock; // using it reg.. because need to put it on the 
  // LHS in always/initial procedural block
  reg reset;
  // Note: output of DUT can only be connected to wires
  // externally...
  wire [3:0] data_out; // this is to tap the output from DUT
  
  // initialize your stimulus to DUT here...
  // always try to do non-blocking initialization
  // in procedural blocks, to avoid complexity
  initial begin
    #1 data_in <= 4'b0000;
    clock <= 1'b0;
    reset <= 1'b0;
    #4 reset <= 1'b1; // asserting the reset...
    #8 reset <= 1'b0; // de-asserting the reset...
    #2 data_in <= 4'b0101;
    #4 data_in <= 4'b0100;
    #6 data_in <= 4'b0111;
    #10 data_in <= 4'b1101;
    #12 data_in <= 4'b1111;
    #14 data_in <= 4'b0001;
    #16 data_in <= 4'b1001;
    // terminate your simulation here...
    #17 $finish;
  end
  
  // toggle your clock here
  // initial #1 forever clock <= #1 ~clock;
  always begin 
    #1 clock <= ~clock;
    // $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  end
  // instantiate your DUT here
  // connect the ports explicity (I prefer explicit connections)
  FIFO myFIFO (
    .data_in 	(data_in),
    .clk 		(clock),
    .rst 		(reset),
    .data_out 	(data_out)
  );
  
  // your procedural block for display
  initial begin
    $display("+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+");
    $display("|clock|reset|data_in|second|third|data_out|");
    $display("+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+");
    $monitor("| %b | %b | %b | %b | %b | %b |", 
    	clock, reset, data_in, FIFO_tb.myFIFO.second, FIFO_tb.myFIFO.third, data_out);
  end
  
endmodule