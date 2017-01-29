// Testbed to test 'and_module'

`include "and_gate.v"

module and_gate_tb();

// Declare the driving input/output wires here
reg inp1;
reg inp2;
wire out;

// instantiate the gate here...
and_gate gate (
.inp1 	(inp1),
.inp2 	(inp2),
.out 	(out)
);

// initialize the input here...
initial begin
	// 11
	inp1 <= 1'b1;
	inp2 <= 1'b1;
	// 10
	#2 inp1 <= 1'b1;
	#2 inp2 <= 1'b0;
	// 01
	#4 inp1 <= 1'b0;
	#4 inp2 <= 1'b1;
	// 00
	#6 inp1 <= 1'b0;
	#6 inp2 <= 1'b0;
end

// monitor the output here...
initial begin
	$display("+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+");
	$display("|inp1|inp2|out|");
	$display("+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+");
	$monitor("  %h   %h   %h", inp1, inp2, out);
end

endmodule