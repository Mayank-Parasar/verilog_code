/*
Author: Mayank Parasar
email-id: mparasar3@gatech.edu
Description:
In this file I am trying to implement
an up/down counter...
*/
// Trivia: Inputs are always wires..
// though can be driven by reg or wire externally..
// Output can be reg or wire, but always connected
// as wires to the extrnal world..

/*Declaring and defining the ports of 'counter' module...*/
module up_dn_cntr (
input wire clk, // clock
input wire rst, // reset
input wire sense, // for up/down signal..
				  // 1: up; 0:down
output reg [3:0] cntr // output of the counter at anytime
);

/*Define the logic of the counter here..*/
/*It should be a saturating counter..
Otherwise the default dehaviour is rollong over.. */

always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		cntr <= 4'b0000;
	end
	else if (sense == 1'b1) begin
		if (cntr == 4'b1111) 
			cntr <= 4'b1111;
		else 
			cntr <= cntr + 1'b1;
	end else if (sense == 1'b0) begin
		if (cntr == 4'b0000) 
			cntr <= 4'b0000;
		else 
			cntr <= cntr - 1'b1;
	end
end

endmodule