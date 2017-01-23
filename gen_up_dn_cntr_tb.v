// This is a test bench for 'gen_up_dn_cntr.v' file
// this will give stimulus to it DUT

`include "gen_up_dn_cntr.v"
module gen_up_dn_cntr_tb(); // again note that it has no in/op ports..

// What signals need to go to DUT: "gen_up_dn_cntr"
reg clk;
reg rst;
reg sense;
wire [31:0] out; // wire to tap the output of DUT...

// initializing the variables here...
initial begin
	$dumpfile("gen_up_dn_cntr.vcd");
	$dumpvars(0, gen_up_dn_cntr_tb);
	clk <= 0;
	rst <= 0;
	#2 rst <= 1; // asserting reset
	#4 rst <= 0;  // de-asserting reset
	sense <= 1; // counting up...
	#10 sense <= 0; // counting down...

	#15 $finish;
end

initial #1 forever clk = #1 ~clk;

// Instantiate your DUT here...
gen_up_dn_cntr cnt(
.clk 		(clk),
.reset 		(rst),
.sense 		(sense),
.data_out 	(out)
);

// Print your stats here from the circuit...
initial begin
	$display("+--------------------------------------------------------------------------+");
	$display("|clock|reset|sense|data_out|");
	$display("+--------------------------------------------------------------------------+");
	$monitor("|  %h  |  %h  |  %h  |  %b  |",
				clk, rst, sense, out);
end

endmodule