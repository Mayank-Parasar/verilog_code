// -----------------------------
// This is simple parity Program
// Design Name : Parity
// File Name : parity.v
// Function : This program shows how a verilog 
// 				primitive/module port connection are done
// Coder: Mayank Parasar
// -----------------------------

module parity (
a,  // First input
b,  // Second input
c,  // Third input
d,  // Fouth Input
y   // Partity output
);

// Input Declaration
input a;
input b;
input c;
input d;
// Output Declaration
output y;
// port data types
wire a;
wire b;
wire c;
wire d;
wire y;
// Internal variables
wire out_0;
wire out_1;

// Code starts here..
xor u0 (
	out_0,
	a,
	b
	);
xor u1 (
	out_1,
	c,
	d
	);
xor u2 (
	y,
	out_0,
	out_1
	);
endmodule