module force_release ();

reg clk, rst, d, preset;
wire q;

initial begin
	$monitor("@%g clk %b rst %b preset %b d %b q %b",
				$time, clk, rst, preset, d, q);
	clk = 0;
	rst = 0;
	d = 0;
	preset = 0;

	#10 rst = 1;
	#10 rst = 0;
	repeat (10) begin // repeat statement is important!!
		@(posedge clk);
		d <=$random;
		@(negedge clk);
		preset <= ~preset;
	end
	#1 $finish;
end

// Clock generator
always #1 clk = ~clk;

// force and release of flip flop module
always @(preset) begin
	if (preset) begin
		force U.q = preset; // force procedural statement
	end else begin
		release U.q; // release procidural statement
	end
end

d_ff U(clk, rst, d, q);

endmodule

// D Flip-flop model
module d_ff (clk, rst, d, q);
input clk, rst, d;
output q;
wire q;
reg q_reg;

assign q = q_reg;

always @(posedge clk) begin
	if (rst) begin
		// reset
		q_reg <=0;
	end else begin
		q_reg <= d;
	end
end

endmodule