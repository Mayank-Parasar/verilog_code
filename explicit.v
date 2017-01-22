module explicit();

reg clk, d, rst, pre;
wire q;

// Here q_bar is not connected
// we can connect pots in any order
dff u0(
.q 		(q),
.d 		(d),
.clk	(clk),
.q_bar 	(),
.rst	(rst),
.pre 	(pre)
);

endmodule

// D flip-flop
module dff (q, q_bar, clk, d, rst, pre);
// ------Input ports--------------
input clk, d, rst, pre;
// ------Output ports--------------
output q, q_bar;

// ------Port Data Type------------
reg q;

always @(posedge clk) begin
	if (rst == 1'b1) begin
		q <= 0;
	end else if (pre == 1'b1) begin
		q <= 1;
	end else begin
		q <= d;
	end
end

endmodule