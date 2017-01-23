// Let's make a 4-bit size;
// 4-flit deep FIFO
// Declare input-output ports of this module...
// using verilog-2001 style...
module FIFO (
  input wire [3:0] data_in,
  input wire clk,
  input wire rst,
  output reg [3:0] data_out
);
  
  // create intermediate wire/reg here...
  reg [3:0] first;  
  reg [3:0] second;  
  reg [3:0] third;
  
  // execute your logic here...
  always @ (posedge clk) begin
    if(rst == 1'b1) begin //reset is asserted.. zero in all regs
      first <= 4'b0000;
      second <= 4'b0000;
      third <= 4'b0000;
      data_out <= 4'b0000;
    end else begin
      first <= data_in;
      second <= first;
      third <= second;
      data_out <= third;
    end
    
  end
  
endmodule