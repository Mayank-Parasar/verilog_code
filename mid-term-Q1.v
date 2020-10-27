/* Author: Mayank Parasar */

module Q1( go_in, d_in, clk, valid_out, data_out );


input wire go_in;
input wire [7:0] d_in;
input wire clk;
output reg valid_out;
output reg [10:0] data_out = 11'b00000000000;


reg [10:0] sum_sig = 11'b0;
reg done_sig = 0;
reg [1:0]i_sig = 2'b00;
reg [1:0]i_reg = 2'b11;
reg [10:0]sum_reg = 11'b0;
reg PS = 0;
reg NS = 0;


always @(posedge clk)
begin
	PS <=NS;
	i_reg <= i_sig;
	// $display("PS: %b", PS);
	// $display("i_sig: %b, i_reg: %b", i_sig, i_reg);
end


always @(*) // check if this is the right way to code up the diagram
begin
		
	
	case(PS)
		2'b0: 
		begin
			if (go_in == 0) 
			begin
				NS = PS;
				i_sig = i_reg;
			end
			else 
			begin
				NS = 2'b01;	
			end
		end
		2'b1: 
		begin
			sum_sig = sum_reg + d_in;
			i_sig = i_reg - 1;
			if (i_reg == 0) 
			begin
				NS = 2'b00;
				done_sig = 1;	
			end
			else 
			begin
				NS = PS;	
			end
		end
		default: 
		begin
			done_sig = 0;
			sum_sig= 0;
			// i_sig = i_reg;
			NS = 0;			
		end

	endcase
end

endmodule
