// Test bench for myFIFO..
`include "myFIFO.v"

module myFIFO_tb(); // this has no in/out ports..
// to drive the input of the myFIFO module
// declare the registers...
reg [3:0] data_in;
reg reset, clock;

// to tap the output from the module..
// declare the wire..
wire [3:0] data_out;

// initiaize all the variables..
initial begin
	$dumpfile("myfifo.vcd");
	$dumpvars(0, myFIFO_tb); // dumps everything...
	reset <= 0;
	clock <= 0;
	data_in <= 0;
	#5 reset <= 1; // assert the reset
	#7 reset <= 0;  // de-assert the reset
	#8 data_in <= 4'b1011;
	#10 data_in <= 4'b1010;
	#12 data_in <= 4'b1000;
	// #14 $display("+--------------------------------------------------------------------------+");
	#15 $finish; // terminate the simulation...
end

always begin
	#1 clock = ~clock; // Toggle the clock every 2 ticks...
	$display("+---------------------------------------------+");
end

// Connect DUT to test bench...
// Explicit port declaration...
myFIFO fifo(
.data_in	(data_in),
.clk 		(clock),
.rst 		(reset),
.data_out	(data_out)
);

// print out the result of tb here....
initial begin
	$display("+--------------------------------------------------------------------------+");
	$display("|clock|reset|data_in|first|second|third|data_out|");
	$display("+--------------------------------------------------------------------------+");
	$monitor("|  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |  %h  |",
		clock, reset, data_in, myFIFO_tb.fifo.first, myFIFO_tb.fifo.second, myFIFO_tb.fifo.third, myFIFO_tb.fifo.data_out);

end
endmodule
