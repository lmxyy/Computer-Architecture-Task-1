module adder4(x,y,sum,cin,cout);
   parameter maxn = 4;

   input [maxn-1:0] x,y;
   input 			cin;
   output [maxn-1:0] sum;
   output 			 cout;

   reg [maxn-1:0] 	 sum;
   reg 				 cout;
   
   always@(x,y)
	 begin
		sum[0] = x[0]^y[0]^cin;
		sum[1] = x[1]^y[1]^((x[0]&y[0])^((x[0]^y[0])&cin));
		sum[2] = x[2]^y[2]^((x[1]&y[1])^((x[1]^y[1])&(x[0]&y[0]))^((x[1]^y[1])&(x[0]^y[0])&cin));
		sum[3] = x[3]^y[3]^((x[2]&y[2])^((x[2]^y[2])&(x[1]&y[1]))^((x[2]^y[2])&(x[1]^y[1])&(x[0]&y[0]))^((x[2]^y[2])&(x[1]^y[1])&(x[0]^y[0])&cin));
		cout = (x[3]&y[3])^((x[3]^y[3])&(x[2]&y[2]))^((x[3]^y[3])&(x[2]^y[2])&(x[1]&y[1]))^((x[3]^y[3])&(x[2]^y[2])&(x[1]^y[1])&(x[0]&y[0]))
		  ^((x[3]^y[3])&(x[2]^y[2])&(x[1]^y[1])&(x[0]^y[0])&cin);
	 end
endmodule // adder4

module adder(x,y,sum);
   parameter maxn = 16;

   input [maxn-1:0] x,y;
   output [maxn-1:0] sum;

   reg [maxn-1:0] x,y,sum;
   reg [maxn-1:0] C,P;
   reg [3:0] 	  tmp1,tmp2,tmp3,tmp4;
   reg 			  c0,c1,c2,c3,c4;
   reg [3:0] 	  rx1,rx2,rx3,rx4,ry1,ry2,ry3,ry4;

   initial
	 begin
		rx1 = x;
		ry1 = y;
		rx2 = x>>4;
		ry2 = y>>4;
		rx3 = x>>8;
		ry3 = y>>8;
		rx4 = x>>12;
		ry4 = y>>12;
		c0 = 0;
	 end
   // always@(x,y)
   // 	 begin
   adder4 obj1(.x(rx1),.y(ry1),.sum(tmp1),.cin(c0),.cout(c1));
   adder4 obj2(.x(rx2),.y(ry2),.sum(tmp2),.cin(c1),.cout(c2));
   adder4 obj3(.x(rx3),.y(ry3),.sum(tmp3),.cin(c2),.cout(c3));
   adder4 obj4(.x(rx4),.y(ry4),.sum(tmp4),.cin(c3),.cout(c4));
   // sum = {tmp1,tmp2,tmp3,tmp4};
   // assign sum = (tmp1)|(tmp2<<4)|(tmp3<<8)|(tmp4<<12);
	 // end
endmodule // adder
