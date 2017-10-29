module adder(x,y,sum);
   parameter maxn = 16;

   input [maxn-1:0] x,y
   output [maxn-1:0] sum;

   reg 				 C[maxn:0];
   always @(x,y)
	 begin
		C[0] = 0
		integer i;
		for (i = 0;i < maxn;i = i+1)
		  begin
			 C[i] = x[i]^y[i]^C[i];
			 C[i+1] = (x[i]&y[i])^(C[i]&(x[i]^y[i]));
		  end
	 end		
endmodule
