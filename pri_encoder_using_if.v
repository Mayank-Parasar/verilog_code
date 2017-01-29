// -------------------------------------------
// Design Mame: pri_encoder_using_if
// -------------------------------------------
module pri_encoder_using_if (
	binary_out,
	encoder_in,
	enable
	);

	output [3:0] binary_out;
	input enable;
	input [15:0] encoder_in;

	reg [3:0] binary_out;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// reset
			
		end
		else if () begin
			
		end
	end