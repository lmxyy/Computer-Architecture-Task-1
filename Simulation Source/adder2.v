module adder4(x,y,sum,cin,cout);
   parameter maxn = 4;

   input [maxn-1:0] x,y;
   input 			cin;
   output [maxn-1:0] sum;
   output 			 cout;

   assign sum[0] = x[0]^y[0]^cin;
   assign sum[1] = x[1]^y[1]^((x[0]&y[0])^((x[0]^y[0])&cin));
   assign sum[2] = x[2]^y[2]^((x[1]&y[1])^((x[1]^y[1])&(x[0]&y[0]))^((x[1]^y[1])&(x[0]^y[0])&cin));
   assign sum[3] = x[3]^y[3]^((x[2]&y[2])^((x[2]^y[2])&(x[1]&y[1]))^((x[2]^y[2])&(x[1]^y[1])&(x[0]&y[0]))^((x[2]^y[2])&(x[1]^y[1])&(x[0]^y[0])&cin));
   assign cout = (x[3]&y[3])^((x[3]^y[3])&(x[2]&y[2]))^((x[3]^y[3])&(x[2]^y[2])&(x[1]&y[1]))^((x[3]^y[3])&(x[2]^y[2])&(x[1]^y[1])&(x[0]&y[0]))
	 ^((x[3]^y[3])&(x[2]^y[2])&(x[1]^y[1])&(x[0]^y[0])&cin);
endmodule // adder4

module adder(x,y,sum);
   parameter maxn = 16;

   input [maxn-1:0] x,y;
   output [maxn-1:0] sum;

   wire [3:0] 	  tmp1,tmp2,tmp3,tmp4;
   wire			  c1,c2,c3,c4;
   assign x = 1;
   assign y = 3;
   
   adder4 obj1(.x(x[3:0]),.y(y[3:0]),.sum(tmp1),.cin(0),.cout(c1));
   adder4 obj2(.x(x[7:4]),.y(y[7:4]),.sum(tmp2),.cin(c1),.cout(c2));
   adder4 obj3(.x(x[11:8]),.y(y[11:8]),.sum(tmp3),.cin(c2),.cout(c3));
   adder4 obj4(.x(x[15:12]),.y(y[15:12]),.sum(tmp4),.cin(c3),.cout(c4));
   assign sum = {tmp1,tmp2,tmp3,tmp4};
endmodule // adder
