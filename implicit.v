module implicit();
// it has no in/op ports
// lets define intermediate elements
reg clk, d, rst, pre;
wire q;

// here second port is not connected
dff u0 (q,,clk,d,rst,pre);
endmodule

// D flip-flop
module dff (
q, 
q_bar, 
clk, 
d, 
rst, 
pre
);

// -------Input Ports-----------------
input clk;
input d;
input rst;
input pre;

// -------Output Ports-----------------
output q;
output q_bar;

// If nothing mentioned.. they are assumed to be wires..
// however, it is a good practice to expilicity specify
// it here...
// ------------Port data type-----------
reg q;

assign q_bar = ~q; // 'q_bar' is a wire

always @(posedge clk) begin
	if (rst == 1'b1) begin
		q <= 0;
	end else begin
		q <= d;
	end
end

endmodule