// Assignemnet: Counter Model
// Author: Alex Tejada
// Description: This module will be a 32bit counter that will allow the
// value to increase over time. The counter can also be concatenated by
// another value - the offse - to the counter. Both events are caused by
// a external clock value.
// 
// Acknowledgements: This code was modified from the counter.v program
// module to test a 32bit counter

`timescale 1ns / 1ns
module counter_32Bit (count, clk, reset, addStart, offset);

// Adjust to meet the counter size
int COUNTER_SIZE = 32;

output [31:0] count;
input clk, reset, addStart;
input [7:0] offset;

reg [31:0] count;

// reset - Start counter
// clk - signal to increment by one
// addStart - signal to add the counter by the offset
always @ (posedge clk or posedge reset or posedge addStart)
	if (reset)
		count = 32'h00;
	else if (addStart)
		count <= count + offset; 
	else
		count <= count + 32'h01;

endmodule
