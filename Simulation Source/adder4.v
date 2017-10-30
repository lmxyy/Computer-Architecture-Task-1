module adder4(x,y,sum,cin,cout);
   parameter maxn = 4;

   input [maxn-1:0] x,y;
   input 			cin;
   output [maxn-1:0] sum;
   output 			 cout;

   // reg [maxn-1:0] 	 x,y;
   // reg 				 cin;
   
   assign sum[0] = x[0]^y[0]^cin;
   assign sum[1] = x[1]^y[1]^((x[0]&y[0])^((x[0]^y[0])&cin));
   assign sum[2] = x[2]^y[2]^((x[1]&y[1])^((x[1]^y[1])&(x[0]&y[0]))^((x[1]^y[1])&(x[0]^y[0])&cin));
   assign sum[3] = x[3]^y[3]^((x[2]&y[2])^((x[2]^y[2])&(x[1]&y[1]))^((x[2]^y[2])&(x[1]^y[1])&(x[0]&y[0]))^((x[2]^y[2])&(x[1]^y[1])&(x[0]^y[0])&cin));
   assign cout = (x[3]&y[3])^((x[3]^y[3])&(x[2]&y[2]))^((x[3]^y[3])&(x[2]^y[2])&(x[1]&y[1]))
	 ^((x[3]^y[3])&(x[2]^y[2])&(x[1]^y[1])&(x[0]&y[0]))^((x[3]^y[3])&(x[2]^y[2])&(x[1]^y[1])&(x[0]^y[0])&cin);
endmodule // adder4
