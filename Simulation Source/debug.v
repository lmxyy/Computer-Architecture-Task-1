/* ACM Class System (I) 2017 Fall Homework 1 
 *
 * Part I: Write an adder in Verilog
 *
 * This file is used to test your adder. 
 * Please DO NOT modify this file.
 * 
 * GUIDE:
 *   1. Create a RTL project in Vivado
 *   2. Put `adder.v' OR `adder2.v' into `Sources', DO NOT add both of them at the same time.
 *   3. Put this file into `Simulation Sources'
 *   4. Run Behavioral Simulation
 *   5. Make sure to run at least 100 steps during the simulation (usually 100ns)
 *   6. You can see the results in `Tcl console'
 *
 */

`include"adder4.v"

module test_adder;
   wire [3:0] answer;
   reg [3:0]  a, b ;
   reg 		  c;
   wire 	  d;
   adder4 adder (a, b, answer,c,d);
   
   integer 	  i;
   initial begin
	  c = 1;
	  for(i=1; i<=1; i=i+1) begin
		 // a[14:0] = 1;
		 // a[15] = 0;
		 // b[14:0] = 3;
		 // b[15] = 0;
		 a = 8;
		 b = 8;
		 
		 #1;
		 $display("TESTCASE %d: %d + %d = %d,%d", i, a, b, answer,d);

		 if (answer !== a + b) begin
			$display("Wrong Answer!");
		 end
	  end
	  $display("Congratulations! You have passed all of the tests.");
	  $finish;
   end
endmodule
