
module and_gate(
input inp1, // input of the and gate
input inp2,
output out // output of the gate
);

// defining the data-type of the port
wire inp1;
wire inp2;
wire out;

// below condition will always hold true...
assign out = inp1 & inp2;

endmodule