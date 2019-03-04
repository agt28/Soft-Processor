// Assignemnet: Counter Model 
// Author: Alex Tejada
// Description: Testbench for counter_32_Bit. The testbench provides a
// clock that will continuously add to the counter. After 100 time steps,
// a second 32bit number will be added to the counter to demonstrate that
// the counter can be concatenated.
// 
// Acknowledgements: This code was modified from the tcounter.v program
// module to test a 32bit counter


`timescale 1ns / 1ns

module test_counter_32bit;

reg clk, reset, addStart;
reg [7:0] para; // Number to add to counter (offset) 
wire [31:0] count; // Counter 
 

counter_32Bit mod (count, clk, reset, addStart, para );

initial
	begin
		para = 8'h28; // constant number
		clk = 0;
		addStart = 0;
		repeat(10) #10 clk = !clk;
	end

initial
	begin
		reset = 0;
		#5 reset = 1;
		#5 reset = 0;
		#150 addStart = 1;
		#10 addStart = 0;
	end

initial
    $monitor($stime,, reset,, clk,,, count); 	

endmodule
