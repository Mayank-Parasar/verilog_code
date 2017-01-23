// Implementing the behavioral model of FIFO..
// not gate level for now...
// Let's make a FIFO 4 flit deep
// Each flit is of width 4 bits...

module myFIFO (
data_in, // input data to the FIFO
clk, // for moving data
rst, // to zero in all the values in the FIFO
data_out // output data to the FIFO
);

// Input ports
input [3:0] data_in; // this is a wire...
input clk; // clock; this is a wire
input rst; // reset; this is a wire

// Output ports
output [3:0] data_out; // this is a reg.

// Port data type
wire [3:0] data_in;
wire clk;
wire rst;

reg [3:0] data_out;

// Now intermediate regs.. to make 
// FIFO 4 flit deep..
reg [3:0] first;
reg [3:0] second;
reg [3:0] third;

// Now the logic of the FIFO...
// considering asynchronous reset...

// // give inital values to each of the 
// // buffer..
// initial begin
// 		first = 4'b0000;
// 		second = 4'b0000;
// 		third = 4'b0000;
// 		data_out = 4'b0000;
// end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		first <= 4'b0000;
		second <= 4'b0000;
		third <= 4'b0000;
		data_out <= 4'b0000;
	end
	else begin
		first <= data_in;
		second <= first;
		third <= second;
		data_out <= third;
	end
end

endmodule