// ----------------------------------
// This is my second Verilog Design
// Design Name: first_counter
// Function: This ia a 4 bit up-counter with
// Synchronous active high reset and 
// with active high enable signal
// ----------------------------------

module counter (
	clk, // clk input of the design
	rst, // active high, asynchronous Reset input
	enable,  // Active high enable signal for counter
	counter_out // 4 bit vector output of the counter
	); // End of port list
// ------------Input Ports------------------
input  clk;
input rst;
input enable;
// -----------Output Ports------------------
output [3:0] counter_out;
// -----------Input ports Data type---------
// By rule all the input ports should be wires
wire clk;
wire rst;
wire enable;
// ----------Output Ports Data Type---------
// Output port can be a storage element (reg) or a wire
reg [3:0] counter_out;

// ---------Code Starts Here----------------
// Since this counter is a positive edge trigged one,
// We trigger the below block with respect to positive
// edge of the clock.
always @(posedge clk or posedge rst) 
begin : COUNTER // Block Name
	if (rst == 1'b1) begin
		// reset if active, we load the counter output with 4'b0000
		counter_out <= #1 4'b0000;
		
	end
	else if (enable == 1'b1) begin
	counter_out <= #1 counter_out + 1;
	end 
end // End of Block COUNTER

endmodule // End of the Module counter