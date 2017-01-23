

// This is the top level module to generate 
// 10 up-down counter...

`include "up_dn_cntr.v"

// Currently generating only 8 up_dwn counter..
// such  that output of each of them is connected
// as input of next counter..
// since input necessarily needed to be wires.. we
// have to tap outpu of each module as wires..
module gen_up_dn_cntr(
input wire 			clk, // it gets the clock
// input wire 	[3:0] 	data_in, 
input wire 			reset,
input wire 			sense,
output wire [31:0] 	data_out // this is the final output
						     // of last counter...
);

// Define intermediate wires for connections
// as described above here...
// wire [3:0] out_1;
// wire [3:0] out_2;
// wire [3:0] out_3;
// wire [3:0] out_4;
// wire [3:0] out_5;
// wire [3:0] out_6;
// wire [3:0] out_7;
// wire [27:0] data;

generate
	genvar i;
	for (i = 0; i < 8; i = i + 1) begin:CNTR
		up_dn_cntr U (
			.clk 	(clk),
			.rst 	(reset),
			.sense 	(sense),
			.cntr 	(data_out[((i*4) + 3): (i*4)])
			);
	end
endgenerate

endmodule