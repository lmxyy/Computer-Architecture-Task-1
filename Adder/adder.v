module adder1(x,y,sum,cin,cout);
   input x,y,cin;
   output sum,cout;
   
   assign sum = x^y^cin;
   assign cout = (x&y)^(cin&(x^y));
endmodule // adder1

module adder(x,y,sum);
   parameter maxn = 16;

   input [maxn-1:0] x,y;
   output [maxn-1:0] sum;

   wire [maxn-1:0] 	 c;
   
   adder1 obj0(.x(x[0]),.y(y[0]),.sum(sum[0]),.cin(z),.cout(c[0]));
   adder1 obj1(.x(x[1]),.y(y[1]),.sum(sum[1]),.cin(c[0]),.cout(c[1]));
   adder1 obj2(.x(x[2]),.y(y[2]),.sum(sum[2]),.cin(c[1]),.cout(c[2]));
   adder1 obj3(.x(x[3]),.y(y[3]),.sum(sum[3]),.cin(c[2]),.cout(c[3]));
   adder1 obj4(.x(x[4]),.y(y[4]),.sum(sum[4]),.cin(c[3]),.cout(c[4]));
   adder1 obj5(.x(x[5]),.y(y[5]),.sum(sum[5]),.cin(c[4]),.cout(c[5]));
   adder1 obj6(.x(x[6]),.y(y[6]),.sum(sum[6]),.cin(c[5]),.cout(c[6]));
   adder1 obj7(.x(x[7]),.y(y[7]),.sum(sum[7]),.cin(c[6]),.cout(c[7]));
   adder1 obj8(.x(x[8]),.y(y[8]),.sum(sum[8]),.cin(c[7]),.cout(c[8]));
   adder1 obj9(.x(x[9]),.y(y[9]),.sum(sum[9]),.cin(c[8]),.cout(c[9]));
   adder1 obj10(.x(x[10]),.y(y[10]),.sum(sum[10]),.cin(c[9]),.cout(c[10]));
   adder1 obj11(.x(x[11]),.y(y[11]),.sum(sum[11]),.cin(c[10]),.cout(c[11]));
   adder1 obj12(.x(x[12]),.y(y[12]),.sum(sum[12]),.cin(c[11]),.cout(c[12]));
   adder1 obj13(.x(x[13]),.y(y[13]),.sum(sum[13]),.cin(c[12]),.cout(c[13]));
   adder1 obj14(.x(x[14]),.y(y[14]),.sum(sum[14]),.cin(c[13]),.cout(c[14]));
   adder1 obj15(.x(x[15]),.y(y[15]),.sum(sum[15]),.cin(c[14]),.cout(z));
   
endmodule // adder

